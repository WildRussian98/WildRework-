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



local V = {
	Name = "БМП-2",
	Model = "models/avx/bmp2.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Средняя бронетехника",
	SpawnOffset = Vector(0,0,60),
	SpawnAngleOffset = 180,

	Members = {
		Mass = 15000,
		AirFriction = 0,
		--Inertia = Vector(14017.5,46543,47984.5),
		Inertia = Vector(20000,80000,100000),

		OnSpawn = function(ent)
			ent:SetNWBool( "simfphys_NoRacingHud", true )
			ent.DamageThreshold = 30
			ent.OnTakeDamage = TankTakeDamage
			ent:SetSkin(math.random(0,2))
		end,

		MaxHealth = 8500,

		IsArmored = true,

		NoWheelGibs = true,

		FirstPersonViewPos = Vector(-10,-30,20),

		FrontWheelRadius = 35,
		RearWheelRadius = 35,

		EnginePos = Vector(50,-15,60),

		CustomWheels = true,
		CustomSuspensionTravel = 10,

		CustomWheelModel = "models/props_c17/canisterchunk01g.mdl",
		--CustomWheelModel = "models/props_vehicles/apc_tire001.mdl",

		CustomWheelPosRL = Vector(-122,-25,25),
		CustomWheelPosRR = Vector(-122,25,25),
		CustomWheelPosML = Vector(0,-25,25),
		CustomWheelPosMR = Vector(0,25,25),
		CustomWheelPosFL = Vector(110,-25,25),
		CustomWheelPosFR = Vector(110,25,25),
		CustomWheelAngleOffset = Angle(0,0,90),

		CustomMassCenter = Vector(0,0,0),

		CustomSteerAngle = 60,

		SeatOffset = Vector(0,0,48),
		SeatPitch = -15,
		SeatYaw = 90,

		ModelInfo = {
			WheelColor = Color(0,0,0,0),
		},

		PassengerSeats = {
			{
				pos = Vector(-30,20,20),
				ang = Angle(0,180,18)
			},
			{
				pos = Vector(-55,20,20),
				ang = Angle(0,180,18)
			},
			{
				pos = Vector(-80,20,20),
				ang = Angle(0,180,18)
			},
			{
				pos = Vector(-30,-20,20),
				ang = Angle(0,0,18)
			},
			{
				pos = Vector(-55,-20,20),
				ang = Angle(0,0,18)
			},
			{
				pos = Vector(-80,-20,20),
				ang = Angle(0,0,18)
			},
		},

		FrontHeight = 1,
		FrontConstant = 50000,
		FrontDamping = 30000,
		FrontRelativeDamping = 300000,

		RearHeight = 1,
		RearConstant = 50000,
		RearDamping = 20000,
		RearRelativeDamping = 20000,

		FastSteeringAngle = 20,
		SteeringFadeFastSpeed = 300,

		TurnSpeed = 4,

		MaxGrip = 1500,
		Efficiency = 1,
		GripOffset = -500,
		BrakePower = 400,
		BulletProofTires = true,

		IdleRPM = 100,
		LimitRPM = 2500,
		PeakTorque = 310,
		PowerbandStart = 600,
		PowerbandEnd = 2600,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = true,

		FuelFillPos = Vector(139.42,-3.68,38.38),
		FuelType = FUELTYPE_DIESEL,
		FuelTankSize = 220,
		
		PowerBias = -0.3,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/t90ms/idle.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/sherman/low.wav",
		Sound_MidPitch = 1.5,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 100,
		Sound_MidFadeOutRate = 1,
		
		Sound_High = "simulated_vehicles/t90ms/high.wav",
		Sound_HighPitch = 1.5,
		Sound_HighVolume = 0.7,
		Sound_HighFadeInRPMpercent = 50,
		Sound_HighFadeInRate = 0.2,
		
		Sound_Throttle = "",
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "common/null.wav",
		ForceTransmission = 1,
		
		DifferentialGear = 0.4,
		Gears = {-0.06,0,0.06,0.08,0.1,0.12,0.13}
	}
}
list.Set( "simfphys_vehicles", "avx_bmp2", V )