local function bcDamage( vehicle , position , cdamage )
	if not simfphys.DamageEnabled then return end
	
	cdamage = cdamage or false
	net.Start( "simfphys_spritedamage" )
		net.WriteEntity( vehicle )
		net.WriteVector( position ) 
		net.WriteBool( cdamage ) 
	net.Broadcast()
end

local function DestroyVehicle( ent )
	if not IsValid( ent ) then return end
	if ent.destroyed then return end
	
	ent.destroyed = true
	
	local ply = ent.EntityOwner
	local skin = ent:GetSkin()
	local Col = ent:GetColor()
	Col.r = Col.r * 0.8
	Col.g = Col.g * 0.8
	Col.b = Col.b * 0.8
	
	local bprop = ents.Create( "gmod_sent_vehicle_fphysics_gib" )
	bprop:SetModel( ent:GetModel() )			
	bprop:SetPos( ent:GetPos() )
	bprop:SetAngles( ent:GetAngles() )
	bprop:Spawn()
	bprop:Activate()
	bprop:GetPhysicsObject():SetVelocity( ent:GetVelocity() + Vector(math.random(-5,5),math.random(-5,5),math.random(150,250)) ) 
	bprop:GetPhysicsObject():SetMass( ent.Mass * 0.75 )
	bprop.DoNotDuplicate = true
	bprop.MakeSound = true
	bprop:SetColor( Col )
	bprop:SetSkin( skin )
	
	ent.Gib = bprop
	
	simfphys.SetOwner( ply , bprop )
	
	if IsValid( ply ) then
		undo.Create( "Gib" )
		undo.SetPlayer( ply )
		undo.AddEntity( bprop )
		undo.SetCustomUndoText( "Undone Gib" )
		undo.Finish( "Gib" )
		ply:AddCleanup( "Gibs", bprop )
	end
	
	if ent.CustomWheels == true and not ent.NoWheelGibs then
		for i = 1, table.Count( ent.GhostWheels ) do
			local Wheel = ent.GhostWheels[i]
			if IsValid(Wheel) then
				local prop = ents.Create( "gmod_sent_vehicle_fphysics_gib" )
				prop:SetModel( Wheel:GetModel() )			
				prop:SetPos( Wheel:LocalToWorld( Vector(0,0,0) ) )
				prop:SetAngles( Wheel:LocalToWorldAngles( Angle(0,0,0) ) )
				prop:SetOwner( bprop )
				prop:Spawn()
				prop:Activate()
				prop:GetPhysicsObject():SetVelocity( ent:GetVelocity() + Vector(math.random(-5,5),math.random(-5,5),math.random(0,25)) )
				prop:GetPhysicsObject():SetMass( 20 )
				prop.DoNotDuplicate = true
				bprop:DeleteOnRemove( prop )
				
				simfphys.SetOwner( ply , prop )
			end
		end
	end
	
	local Driver = ent:GetDriver()
	if IsValid( Driver ) then
		if ent.RemoteDriver ~= Driver then
			Driver:TakeDamage( Driver:Health() + Driver:Armor(), ent.LastAttacker or Entity(0), ent.LastInflictor or Entity(0) )
		end
	end
	
	if ent.PassengerSeats then
		for i = 1, table.Count( ent.PassengerSeats ) do
			local Passenger = ent.pSeat[i]:GetDriver()
			if IsValid( Passenger ) then
				Passenger:TakeDamage( Passenger:Health() + Passenger:Armor(), ent.LastAttacker or Entity(0), ent.LastInflictor or Entity(0) )
			end
		end
	end
	
	ent:Extinguish() 
	
	ent:OnDestroyed()
	
	ent:Remove()
end

local function DamageVehicle( ent , damage, type )
	if not simfphys.DamageEnabled then return end
	
	local MaxHealth = ent:GetMaxHealth()
	local CurHealth = ent:GetCurHealth()
	
	local NewHealth = math.max( math.Round(CurHealth - damage,0) , 0 )
	
	if NewHealth <= (MaxHealth * 0.6) then
		if NewHealth <= (MaxHealth * 0.3) then
			ent:SetOnFire( true )
			ent:SetOnSmoke( false )
		else
			ent:SetOnSmoke( true )
		end
	end
	
	if MaxHealth > 30 and NewHealth <= 31 then
		if ent:EngineActive() then
			ent:DamagedStall()
		end
	end
	
	if NewHealth <= 0 then
		if type ~= DMG_GENERIC and type ~= DMG_CRUSH or damage > 400 then
			
			DestroyVehicle( ent )
			
			return
		end
		
		if ent:EngineActive() then
			ent:DamagedStall()
		end
		
		return
	end
	
	ent:SetCurHealth( NewHealth )
end

local function TankTakeDamage( ent, dmginfo )
	ent:TakePhysicsDamage( dmginfo )

	if not ent:IsInitialized() then return end

	local Damage = dmginfo:GetDamage()
	local DamagePos = dmginfo:GetDamagePosition()
	local Type = dmginfo:GetDamageType()

	ent.LastAttacker = dmginfo:GetAttacker() 
	ent.LastInflictor = dmginfo:GetInflictor()

	bcDamage( ent , ent:WorldToLocal( DamagePos ) )

	local Mul = 1

	if Damage < (ent.DamageThreshold or 80) then
			Mul = Damage / (80 or ent.DamageThreshold)
	end

	DamageVehicle( ent , Damage * Mul, Type )
end

local light_table = {
	L_HeadLampPos = Vector(-122,-39,61.5),
	L_HeadLampAng = Angle(0,-180,0),
	R_HeadLampPos = Vector(-122,39,61.5),
	R_HeadLampAng = Angle(0,-180,0),
	---------- 1  avant/arriere | 2- droite/gauche |   3-  haut/bas --------------
	Headlight_sprites = { 
		Vector(-122,39,61.5),
		Vector(-122,-39,61.5)
	},
	Headlamp_sprites = { 
		Vector(-122,39,61.5),
		Vector(-122,-39,61.5)
	},
	Rearlight_sprites = {
		Vector(118,-44.5,71.5),
		Vector(118,45.5,71.5)
	},
	Brakelight_sprites = {
		Vector(118,-44.5,71.5),
		Vector(118,45.5,71.5)
	},
	Reverselight_sprites = {
		Vector(118,-44.5,71.5),
		Vector(118,45.5,71.5)
	},
	Turnsignal_sprites = {
		Left = {
		Vector(-122,-31.5,62),
		Vector(118,-44.5,71.5),
		},
		Right = {
		Vector(-122,31.5,62),
		Vector(118,45.5,71.5),
		},
	},
}
list.Set( "simfphys_lights", "tfre_v300_2", light_table)

local V = {
	Name = "LAV-300 50mm AC",
	Model = "models/TFRE/vehicles/LAV300/LAV300_2.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Средняя бронетехника",
	SpawnOffset = Vector(0,0,20),
	SpawnAngleOffset = 0,

	Members = {
		Mass = 14696,
		
		CustomMassCenter = Vector(4,0,12),
		LightsTable = "tfre_v300_2",

		OnSpawn = function(ent)
			ent:SetNWBool( "simfphys_NoRacingHud", true )
			ent.OnTakeDamage = TankTakeDamage
			ent:SetBodygroup(4,1)
		end,
		
		MaxHealth = 8500,
		
		IsArmored = true,
		
        NoWheelGibs = true,
		
		FirstPersonViewPos = Vector(0,-30,20),
		
		FrontWheelRadius = 25,
		RearWheelRadius = 25,
		
		EnginePos = Vector(-40,20,65),
		
		CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		CustomWheelModel = "models/TFRE/vehicles/LAV300/LAV300_wheels.mdl",
	    CustomWheelPosFL = Vector(-59,41,30),
		CustomWheelPosFR = Vector(-59,-41,30),
		CustomWheelPosML = Vector(25,41,30),
		CustomWheelPosMR = Vector(25,-41,30),
		CustomWheelPosRL = Vector(82.5,41,30),
		CustomWheelPosRR = Vector(82.5,-41,30),
		CustomWheelAngleOffset = Angle(0,-90,0),
		
		CustomMassCenter = Vector(0,0,8),
		
		CustomSteerAngle = 15,
		
		SeatOffset = Vector(40,-14,65),
		SeatPitch = 0,
		SeatYaw = -90,
		
			
		ExhaustPositions = {
			{
				pos = Vector(97,45.5,72.5),
				ang = Angle(-90,-90,0)
			},
			{
				pos = Vector(97,45.5,72.5),
				ang = Angle(-90,-90,0)
			},
			{
				pos = Vector(97,45.5,72.5),
				ang = Angle(-90,-90,0)
			},
			{
				pos = Vector(97,45.5,72.5),
				ang = Angle(-90,-90,0)
			},
		},
		
		PassengerSeats = {
			{
				pos = Vector(105,20,32),
				ang = Angle(0,180,0)
			},
			{
				pos = Vector(105,-20,32),
				ang = Angle(0,0,0)
			}
		},
		
		StrengthenSuspension = true,
		
		FrontHeight = 21.5,
		FrontConstant = 50000,
		FrontDamping = 30000,
		FrontRelativeDamping = 300000,

		RearHeight = 21.5,
		RearConstant = 50000,
		RearDamping = 20000,
		RearRelativeDamping = 20000,

		
		FastSteeringAngle = 20,
		SteeringFadeFastSpeed = 445,
		TurnSpeed = 4,
		
MaxGrip = 350,
Efficiency = 1,
GripOffset = -0.10,
BrakePower = 70,
BulletProofTires = true,

IdleRPM = 1000,
LimitRPM = 2800,
PeakTorque = 400,
PowerbandStart = 1500,
PowerbandEnd = 8000,
Turbocharged = false,
Supercharged = false,
		DoNotStall = false,
		
		FuelFillPos = Vector(-20,2.5,78),
		FuelType = FUELTYPE_DIESEL,
		FuelTankSize = 570,
		
		PowerBias = 0,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/sherman/idle.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/sherman/low.wav",
		Sound_MidPitch = 1.3,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 60,
		Sound_MidFadeOutRate = 0.4,
		
		Sound_High = "simulated_vehicles/sherman/high.wav",
		Sound_HighPitch = 1.2,
		Sound_HighVolume = 1,
		Sound_HighFadeInRPMpercent = 45,
		Sound_HighFadeInRate = 0.2,
		
		Sound_Throttle = "",
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "simulated_vehicles/horn_3.wav",
		ForceTransmission = 1,
		
DifferentialGear = 0.17,
Gears = {-0.2,0,0.3,0.4,0.6}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_tfre_lav300_2", V )
