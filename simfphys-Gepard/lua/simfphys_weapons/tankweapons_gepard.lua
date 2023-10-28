local gepard_susdata = {}
for i = 1,7 do
	gepard_susdata[i] = { 
		attachment = "sus_left_attach_"..i,
		poseparameter = "suspension_left_"..i,
	}
	
	local ir = i + 7
	
	gepard_susdata[ir] = { 
		attachment = "sus_right_attach_"..i,
		poseparameter = "suspension_right_"..i,
	}
end

local function hmg_fire(ply,vehicle,shootOrigin,shootDirection)
	vehicle:EmitSound("simulated_vehicles/weapons/autocanon/m2-1.ogg")
	
	local projectile = {}
		projectile.filter = vehicle.VehicleData["filter"]
		projectile.shootOrigin = shootOrigin
		projectile.shootDirection = shootDirection
		projectile.attacker = ply
		projectile.Tracer	= 1
		projectile.HullSize = 10
		projectile.attackingent = vehicle
		projectile.Spread = Vector(0.005,0.005,0.005)
		projectile.Damage = 140
		projectile.Force = 12
		
	simfphys.FireHitScan( projectile )
end

function simfphys.weapon:ValidClasses()
	return { "sim_fphys_tank_gepard" }
end

function simfphys.weapon:Initialize( vehicle )
	net.Start( "avx_misc_register_tank" )
		net.WriteEntity( vehicle )
		net.WriteString( "gepard" )
	net.Broadcast()
	
	local data = {}
	data.Attachment = "muzzle_left"
	data.Direction = Vector(1,0,0)
	data.Attach_Start_Left = "muzzle_left"
	data.Attach_Start_Right = "muzzle_right"
	data.Type = 3

	simfphys.RegisterCrosshair( vehicle:GetDriverSeat(), { Attachment = "muzzle_right", Type = 4 } )
	simfphys.RegisterCamera( vehicle:GetDriverSeat(), Vector(-40,0,40), Vector(0,0,125), true, "muzzle_right" )
	
	if not istable( vehicle.PassengerSeats ) or not istable( vehicle.pSeat ) then return end

	simfphys.RegisterCamera( vehicle.pSeat[1], Vector(-170,40,40), Vector(0,70,70), true, "muzzle_right" )
	
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

function simfphys.weapon:AimWeapon( ply, vehicle, pod )	
	if not IsValid( pod ) then return end

	local Aimang = pod:WorldToLocalAngles( ply:EyeAngles() )
	Aimang:Normalize()
	
	local AimRate = 100
	
	local Angles = vehicle:WorldToLocalAngles( Aimang + Angle(-2.2,180,0) )
	
	vehicle.sm_pp_yaw = vehicle.sm_pp_yaw and math.ApproachAngle( vehicle.sm_pp_yaw, Angles.y, AimRate * FrameTime() ) or 0
	vehicle.sm_pp_pitch = vehicle.sm_pp_pitch and math.ApproachAngle( vehicle.sm_pp_pitch, Angles.p, AimRate * FrameTime() ) or 0
	
	local TargetAng = Angle(vehicle.sm_pp_pitch,vehicle.sm_pp_yaw,0)
	TargetAng:Normalize() 

	vehicle:SetPoseParameter("cannon_aim_yaw", TargetAng.y)
	vehicle:SetPoseParameter("cannon_aim_pitch", -TargetAng.p)
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
	
	local ID = vehicle:LookupAttachment( "muzzle_right" )
	local Attachment = vehicle:GetAttachment( ID )
	
	self:AimWeapon( ply, vehicle, pod, Attachment )
	
	local DeltaP = deltapos * engine.TickInterval()
	
	local fire = ply:KeyDown( IN_ATTACK )
	
	if fire then
		self:PrimaryAttack( vehicle, ply, Attachment.Pos + DeltaP, Attachment )
	end
	
end

function simfphys.weapon:PrimaryAttack( vehicle, ply, shootOrigin, Attachment )
	if not self:CanPrimaryAttack( vehicle ) then return end
	
	vehicle.wOldPos = vehicle.wOldPos or Vector(0,0,0)
	local deltapos = vehicle:GetPos() - vehicle.wOldPos
	vehicle.wOldPos = vehicle:GetPos()

	if vehicle.swapMuzzle then
		vehicle.swapMuzzle = false
	else
		vehicle.swapMuzzle = true
	end
	
	local AttachmentID = vehicle.swapMuzzle and vehicle:LookupAttachment( "muzzle_left" ) or vehicle:LookupAttachment( "muzzle_right" )
	local Attachment = vehicle:GetAttachment( AttachmentID )
	
	local shootOrigin = Attachment.Pos + deltapos * engine.TickInterval()
	local shootDirection = Attachment.Ang:Forward()
	
	local effectdata = EffectData()
		effectdata:SetOrigin( shootOrigin )
		effectdata:SetAngles( Attachment.Ang )
		effectdata:SetEntity( vehicle )
		effectdata:SetAttachment( AttachmentID )
		effectdata:SetScale( 4 )
	util.Effect( "CS_MuzzleFlash", effectdata, true, true )
	
	hmg_fire( ply, vehicle, shootOrigin, shootDirection )
	
	self:SetNextPrimaryFire( vehicle, CurTime() + 0.05 )
end

function simfphys.weapon:CanPrimaryAttack( vehicle )
	vehicle.NextShoot = vehicle.NextShoot or 0
	return vehicle.NextShoot < CurTime()
end

function simfphys.weapon:SetNextPrimaryFire( vehicle, time )
	vehicle.NextShoot = time
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
			vehicle.track_snd = CreateSound( vehicle, "simulated_vehicles/sherman/tracks.wav" )
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
		vehicle.track_snd:ChangePitch( math.Clamp(60 + speed / 40,0,150) ) 
		vehicle.track_snd:ChangeVolume( math.min( math.max(speed - 20,0) / 200,1) ) 
	end
end

function simfphys.weapon:ControlPassengerSeats( vehicle )
	if not vehicle.pSeat then return end
	
	vehicle.sm_pp_yaw = vehicle.sm_pp_yaw and vehicle.sm_pp_yaw or 180
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

			local X = math.sin( math.rad( -vehicle.sm_pp_yaw - 40 ) ) * 27
			local Y = math.cos( math.rad( -vehicle.sm_pp_yaw - 40 ) ) * 27
			Commander:SetLocalPos( Vector(X + 2.9121,Y,20 + (vehicle.tg_c_z and 25 or 0)) )
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

			local X = math.sin( math.rad( -vehicle.sm_pp_yaw - 165 ) ) * 30
			local Y = math.cos( math.rad( -vehicle.sm_pp_yaw - 165 ) ) * 30
			Loader:SetLocalPos( Vector(X + 2.9121,Y,24 + (vehicle.tg_l_z and 25 or 0)) )
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
	
	for i, v in pairs( gepard_susdata ) do
		local pos = vehicle:GetAttachment( vehicle:LookupAttachment( gepard_susdata[i].attachment ) ).Pos + Up * 15
		
		local trace = util.TraceHull( {
			start = pos,
			endpos = pos + Up * - 100,
			maxs = Vector(10,10,0),
			mins = -Vector(10,10,0),
			filter = vehicle.filterEntities,
		} )
		local Dist = (pos - trace.HitPos):Length() - 53
		
		if trace.Hit then
			vehicle.susOnGround = true
		end
		
		vehicle.oldDist[i] = vehicle.oldDist[i] and (vehicle.oldDist[i] + math.Clamp(Dist - vehicle.oldDist[i],-5,1)) or 0
		
		vehicle:SetPoseParameter(gepard_susdata[i].poseparameter, vehicle.oldDist[i] )
	end
end

function simfphys.weapon:DoWheelSpin( vehicle )
	local spin_r = (vehicle.VehicleData[ "spin_4" ] + vehicle.VehicleData[ "spin_6" ]) * 1.25
	local spin_l = (vehicle.VehicleData[ "spin_3" ] + vehicle.VehicleData[ "spin_5" ]) * 1.25
	
	net.Start( "simfphys_update_tracks", true )
		net.WriteEntity( vehicle )
		net.WriteFloat( spin_r ) 
		net.WriteFloat( spin_l ) 
	net.Broadcast()
	
	vehicle:SetPoseParameter("spin_wheels_right", spin_r)
	vehicle:SetPoseParameter("spin_wheels_left", spin_l )
end