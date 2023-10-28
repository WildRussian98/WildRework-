local leopard_susdata = {}
for i = 1,6 do
	leopard_susdata[i] = { 
		attachment = "sus_left_attach_"..i,
		poseparameter = "suspension_left_"..i,
	}
	
	local ir = i + 6
	
	leopard_susdata[ir] = { 
		attachment = "sus_right_attach_"..i,
		poseparameter = "suspension_right_"..i,
	}
end

local function cannon_fire(ply,vehicle,shootOrigin,shootDirection)
	vehicle:EmitSound("leopard_fire")
	
	timer.Simple( 4, function() 
		if IsValid( vehicle ) then 
			vehicle:EmitSound("simulated_vehicles/weapons/leopard_ready.ogg")
		end
	end)
	
	local effectdata = EffectData()
		effectdata:SetEntity( vehicle )
	util.Effect( "simfphys_leopard_muzzle", effectdata )

	vehicle:GetPhysicsObject():ApplyForceOffset( -shootDirection * 300000, shootOrigin ) 
	
	local projectile = {}
		projectile.filter = vehicle.VehicleData["filter"]
		projectile.shootOrigin = shootOrigin
		projectile.shootDirection = shootDirection
		projectile.attacker = ply
		projectile.attackingent = vehicle
		projectile.Damage = 2500
		projectile.Force = 8000
		projectile.Size = 5
		projectile.DeflectAng = 20
		projectile.BlastRadius = 400
		projectile.BlastDamage = 1000
		projectile.BlastEffect = "simfphys_tankweapon_explosion"
	
	simfphys.FirePhysProjectile( projectile )
end

function simfphys.weapon:ValidClasses()
	return { "sim_fphys_tank_tam" }
end

function simfphys.weapon:Initialize( vehicle )
	net.Start( "avx_misc_register_tank" )
		net.WriteEntity( vehicle )
		net.WriteString( "tam" )
	net.Broadcast()
	
	vehicle:SetNWBool( "SpecialCam_Loader", true )
	vehicle:SetNWFloat( "SpecialCam_LoaderTime", 3.5 )

	simfphys.RegisterCrosshair( vehicle:GetDriverSeat(), { Attachment = "cannon_muzzle", Type = 4 } )
	simfphys.RegisterCamera( vehicle:GetDriverSeat(), Vector(-140,0,-15), Vector(0,90,110), true, "cannon_muzzle" )
	
	if not istable( vehicle.PassengerSeats ) or not istable( vehicle.pSeat ) then return end
	
	timer.Simple( 1, function()
		if not IsValid( vehicle ) then return end
		if not vehicle.VehicleData["filter"] then print("[simfphys Armed Vehicle Pack] ERROR:TRACE FILTER IS INVALID. PLEASE UPDATE SIMFPHYS BASE") return end
		
		vehicle.WheelOnGround = function( ent )
			ent.FrontWheelPowered = ent:GetPowerDistribution() ~= 1
			ent.RearWheelPowered = ent:GetPowerDistribution() ~= -1
			
			for i = 1, table.Count( ent.Wheels ) do
				local Wheel = ent.Wheels[i]		
				if IsValid( Wheel ) then
					local dmgMul = Wheel:GetDamaged() and 0.5 or 1
					local surfacemul = simfphys.TractionData[Wheel:GetSurfaceMaterial():lower()]
					
					ent.VehicleData[ "SurfaceMul_" .. i ] = (surfacemul and math.max(surfacemul,0.001) or 1) * dmgMul
					
					local WheelPos = ent:LogicWheelPos( i )
					
					local WheelRadius = WheelPos.IsFrontWheel and ent.FrontWheelRadius or ent.RearWheelRadius
					local startpos = Wheel:GetPos()
					local dir = -ent.Up
					local len = WheelRadius + math.Clamp(-ent.Vel.z / 50,2.5,6)
					local HullSize = Vector(WheelRadius,WheelRadius,0)
					local tr = util.TraceHull( {
						start = startpos,
						endpos = startpos + dir * len,
						maxs = HullSize,
						mins = -HullSize,
						filter = ent.VehicleData["filter"]
					} )
					
					local onground = self:IsOnGround( vehicle ) and 1 or 0
					Wheel:SetOnGround( onground )
					ent.VehicleData[ "onGround_" .. i ] = onground
					
					if tr.Hit then
						Wheel:SetSpeed( Wheel.FX )
						Wheel:SetSkidSound( Wheel.skid )
						Wheel:SetSurfaceMaterial( util.GetSurfacePropName( tr.SurfaceProps ) )
					end
				end
			end
			
			local FrontOnGround = math.max(ent.VehicleData[ "onGround_1" ],ent.VehicleData[ "onGround_2" ])
			local RearOnGround = math.max(ent.VehicleData[ "onGround_3" ],ent.VehicleData[ "onGround_4" ])
			
			ent.DriveWheelsOnGround = math.max(ent.FrontWheelPowered and FrontOnGround or 0,ent.RearWheelPowered and RearOnGround or 0)
		end
	end)
end

function simfphys.weapon:GetForwardSpeed( vehicle )
	return vehicle.ForwardSpeed
end

function simfphys.weapon:IsOnGround( vehicle )
	return (vehicle.susOnGround == true)
end

function simfphys.weapon:AimCannon( ply, vehicle, pod, Attachment )	
	if not IsValid( pod ) then return end

	local Aimang = pod:WorldToLocalAngles( ply:EyeAngles() )
	Aimang:Normalize()
	
	local AimRate = 40
	
	local Angles = vehicle:WorldToLocalAngles( Aimang + Angle(-2.2,0,0) )
	
	vehicle.sm_pp_yaw = vehicle.sm_pp_yaw and math.ApproachAngle( vehicle.sm_pp_yaw, Angles.y, AimRate * FrameTime() ) or 90
	vehicle.sm_pp_pitch = vehicle.sm_pp_pitch and math.ApproachAngle( vehicle.sm_pp_pitch, Angles.p, AimRate * FrameTime() ) or 0
	
	local TargetAng = Angle(vehicle.sm_pp_pitch,vehicle.sm_pp_yaw,0)
	TargetAng:Normalize() 

	vehicle:SetPoseParameter("cannon_aim_yaw", TargetAng.y - 90 )
	
	local pclamp = math.Clamp( (math.cos( math.rad(TargetAng.y + 90) ) - 0.465) * 3,0,1) ^ 2 * 13.4
	vehicle:SetPoseParameter("cannon_aim_pitch", math.Clamp(TargetAng.p,-15 + pclamp,11) )
end

function simfphys.weapon:ControlTurret( vehicle, deltapos )
	if not istable( vehicle.PassengerSeats ) or not istable( vehicle.pSeat ) then return end
	
	local pod = vehicle:GetDriverSeat()
	
	if not IsValid( pod ) then return end
	
	local ply = pod:GetDriver()
	
	if not IsValid( ply ) then return end
	
	local safemode = ply:KeyDown( IN_WALK )

	if vehicle.ButtonSafeMode ~= safemode then
		vehicle.ButtonSafeMode = safemode
		
		if safemode then
			vehicle:SetNWBool( "TurretSafeMode", not vehicle:GetNWBool( "TurretSafeMode", true ) )
			
			if vehicle:GetNWBool( "TurretSafeMode" ) then
				vehicle:EmitSound( "vehicles/tank_turret_stop1.wav")
			else
				vehicle:EmitSound( "vehicles/tank_turret_stop1.wav")
			end
		end
	end
	
	if vehicle:GetNWBool( "TurretSafeMode", true ) then return end
	
	local ID = vehicle:LookupAttachment( "cannon_muzzle" )
	local Attachment = vehicle:GetAttachment( ID )
	
	self:AimCannon( ply, vehicle, pod, Attachment )
	
	local DeltaP = deltapos * engine.TickInterval()
	
	local fire = ply:KeyDown( IN_ATTACK )
	local fire2 = ply:KeyDown( IN_ATTACK2 )
	
	if fire then
		self:PrimaryAttack( vehicle, ply, Attachment.Pos + DeltaP, Attachment )
	end
	
	local Rate = FrameTime() / 5
	vehicle.smTmpHMG = vehicle.smTmpHMG and vehicle.smTmpHMG + math.Clamp((fire2 and 1 or 0) - vehicle.smTmpHMG,-Rate * 6,Rate) or 0
	
end

function simfphys.weapon:PrimaryAttack( vehicle, ply, shootOrigin, Attachment )
	if not self:CanPrimaryAttack( vehicle ) then return end
	
	local shootDirection = Attachment.Ang:Forward()
	
	vehicle:PlayAnimation( "fire" )
	cannon_fire( ply, vehicle, shootOrigin + shootDirection * 80, shootDirection )
	
	self:SetNextPrimaryFire( vehicle, CurTime() + 3.5 )
end

function simfphys.weapon:CanPrimaryAttack( vehicle )
	vehicle.NextShoot = vehicle.NextShoot or 0
	return vehicle.NextShoot < CurTime()
end

function simfphys.weapon:SetNextPrimaryFire( vehicle, time )
	vehicle.NextShoot = time
	
	vehicle:SetNWFloat( "SpecialCam_LoaderNext", time )
end

function simfphys.weapon:ModPhysics( vehicle, wheelslocked )
	if wheelslocked and self:IsOnGround( vehicle ) then
		local phys = vehicle:GetPhysicsObject()
		phys:ApplyForceCenter( -vehicle:GetVelocity() * phys:GetMass() * 0.04 )
	end
end

function simfphys.weapon:ControlTrackSounds( vehicle, wheelslocked ) 
	local speed = math.abs( self:GetForwardSpeed( vehicle ) )
	local fastenuf = speed > 20 and not wheelslocked and self:IsOnGround( vehicle )
	
	if fastenuf ~= vehicle.fastenuf then
		vehicle.fastenuf = fastenuf
		
		if fastenuf then
			vehicle.track_snd = CreateSound( vehicle, "simulated_vehicles/leopard/tracks.wav" )
			vehicle.track_snd:PlayEx(0,0)
			vehicle:CallOnRemove( "stopmesounds", function( vehicle )
				if vehicle.track_snd then
					vehicle.track_snd:Stop()
				end
			end)
		else
			if vehicle.track_snd then
				vehicle.track_snd:Stop()
				vehicle.track_snd = nil
			end
		end
	end
	
	if vehicle.track_snd then
		vehicle.track_snd:ChangePitch( math.Clamp(70 + speed / 40,0,150) ) 
		vehicle.track_snd:ChangeVolume( math.min( math.max(speed - 20,0) / 200,1) ) 
	end
end

function simfphys.weapon:ControlPassengerSeats( vehicle )
	if not vehicle.pSeat then return end
	
	vehicle.sm_pp_yaw = vehicle.sm_pp_yaw and vehicle.sm_pp_yaw or 90
	vehicle.sm_pp_pitch = vehicle.sm_pp_pitch and vehicle.sm_pp_pitch or 0
	
	do
		local Commander = vehicle.pSeat[2]
		if IsValid( Commander ) then
			local ply = Commander:GetDriver()
			local Toggle = false
			if IsValid( ply ) then
				Toggle = ply:KeyDown( IN_JUMP )
			end
			
			if Toggle ~= vehicle.OldToggleC then
				vehicle.OldToggleC = Toggle
				if Toggle then
					vehicle.tg_c_z = not vehicle.tg_c_z
					
					if vehicle.tg_c_z then
						vehicle:EmitSound( "vehicles/atv_ammo_open.wav" )
						simfphys.RegisterCamera( Commander, Vector(0,0,0), Vector(0,0,0), false )
					else
						vehicle:EmitSound( "vehicles/atv_ammo_close.wav" )
						simfphys.RegisterCamera( Commander, Vector(0,0,25), Vector(0,0,25), false )
					end
				end
			end

			local X = math.sin( math.rad( -vehicle.sm_pp_yaw - 25 ) ) * 27
			local Y = math.cos( math.rad( -vehicle.sm_pp_yaw - 25 ) ) * 27
			Commander:SetLocalPos( Vector(X,Y,50 + (vehicle.tg_c_z and 25 or 0)) )
			Commander:SetLocalAngles( Angle(0,vehicle.sm_pp_yaw - 90,0) ) 
		end
	end
	
	do
		local Loader = vehicle.pSeat[3]
		if IsValid( Loader ) then
			local ply = Loader:GetDriver()
			local Toggle = false
			if IsValid( ply ) then
				Toggle = ply:KeyDown( IN_JUMP )
			end
			
			if Toggle ~= vehicle.OldToggleL then
				vehicle.OldToggleL = Toggle
				if Toggle then
					vehicle.tg_l_z = not vehicle.tg_l_z
					
					if vehicle.tg_l_z then
						vehicle:EmitSound( "vehicles/atv_ammo_open.wav" )
						simfphys.RegisterCamera( Loader, Vector(0,0,0), Vector(0,0,0), false )
					else
						vehicle:EmitSound( "vehicles/atv_ammo_close.wav" )
						simfphys.RegisterCamera( Loader, Vector(0,0,25), Vector(0,0,25), false )
					end
				end
			end

			local X = math.sin( math.rad( -vehicle.sm_pp_yaw - 160 ) ) * 27
			local Y = math.cos( math.rad( -vehicle.sm_pp_yaw - 160 ) ) * 27
			Loader:SetLocalPos( Vector(X,Y,50 + (vehicle.tg_l_z and 25 or 0)) )
			Loader:SetLocalAngles( Angle(0,vehicle.sm_pp_yaw - 90,0) ) 
		end
	end
end

function simfphys.weapon:Think( vehicle )
	if not IsValid( vehicle ) or not vehicle:IsInitialized() then return end
	
	vehicle.wOldPos = vehicle.wOldPos or Vector(0,0,0)
	local deltapos = vehicle:GetPos() - vehicle.wOldPos
	vehicle.wOldPos = vehicle:GetPos()
	
	local handbrake = vehicle:GetHandBrakeEnabled()
	
	self:ControlPassengerSeats( vehicle )
	self:UpdateSuspension( vehicle )
	self:DoWheelSpin( vehicle )
	self:ControlTurret( vehicle, deltapos )
	self:ControlTrackSounds( vehicle, handbrake )
	self:ModPhysics( vehicle, handbrake )
end

function simfphys.weapon:UpdateSuspension( vehicle )
	if not vehicle.filterEntities then
		vehicle.filterEntities = player.GetAll()
		table.insert(vehicle.filterEntities, vehicle)
		
		for i, wheel in pairs( ents.FindByClass( "gmod_sent_vehicle_fphysics_wheel" ) ) do
			table.insert(vehicle.filterEntities, wheel)
		end
	end
	
	vehicle.oldDist = istable( vehicle.oldDist ) and vehicle.oldDist or {}
	
	vehicle.susOnGround = false
	local Up = vehicle:GetUp()
	
	for i, v in pairs( leopard_susdata ) do
		local pos = vehicle:GetAttachment( vehicle:LookupAttachment( leopard_susdata[i].attachment ) ).Pos + Up * 5
		
		local trace = util.TraceHull( {
			start = pos,
			endpos = pos + Up * - 100,
			maxs = Vector(10,10,0),
			mins = -Vector(10,10,0),
			filter = vehicle.filterEntities,
		} )
		local Dist = (pos - trace.HitPos):Length() - 38
		
		if trace.Hit then
			vehicle.susOnGround = true
		end
		
		vehicle.oldDist[i] = vehicle.oldDist[i] and (vehicle.oldDist[i] + math.Clamp(Dist - vehicle.oldDist[i],-5,1)) or 0
		
		vehicle:SetPoseParameter(leopard_susdata[i].poseparameter, vehicle.oldDist[i] )
	end
end

function simfphys.weapon:DoWheelSpin( vehicle )
	local spin_r = (vehicle.VehicleData[ "spin_4" ] + vehicle.VehicleData[ "spin_6" ]) * 1.75
	local spin_l = (vehicle.VehicleData[ "spin_3" ] + vehicle.VehicleData[ "spin_5" ]) * 1.75
	
	net.Start( "simfphys_update_tracks", true )
		net.WriteEntity( vehicle )
		net.WriteFloat( spin_r ) 
		net.WriteFloat( spin_l ) 
	net.Broadcast()
	
	vehicle:SetPoseParameter("spin_wheels_right", spin_r)
	vehicle:SetPoseParameter("spin_wheels_left", spin_l )
end