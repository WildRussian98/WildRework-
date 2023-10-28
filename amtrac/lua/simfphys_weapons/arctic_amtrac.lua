local tiger_susdata = {}
for i = 1,6 do
	tiger_susdata[i] = {
		attachment = "sus_left_attach_" .. i,
		poseparameter = "suspension_left_" .. i,
	}

	local ir = i + 6
	tiger_susdata[ir] = {
		attachment = "sus_right_attach_" .. i,
		poseparameter = "suspension_right_" .. i,
	}
end

local function m2_fire(ply,vehicle,shootOrigin,shootDirection)

	vehicle:EmitSound("tiger_fire_mg_new")

	local projectile = {}
		projectile.filter = vehicle.VehicleData["filter"]
		projectile.shootOrigin = shootOrigin
		projectile.shootDirection = shootDirection
		projectile.attacker = ply
		projectile.Tracer	= 1
		projectile.Spread = Vector(0.006,0.006,0.006)
		projectile.HullSize = 5
		projectile.attackingent = vehicle
		projectile.Damage = 20
		projectile.Force = 12
	simfphys.FireHitScan( projectile )

end

local function mk19_fire(ply,vehicle,shootOrigin,shootDirection)
	vehicle:EmitSound("simulated_vehicles/weapons/Mortar.ogg", 130, 100)

	local effectdata = EffectData()
		effectdata:SetEntity( vehicle )
	util.Effect( "arctic_amtrac_muzzle", effectdata, true, true )

	vehicle:GetPhysicsObject():ApplyForceOffset( -shootDirection * 16000, shootOrigin )

	local projectile = {}
		projectile.filter = vehicle.VehicleData["filter"]
		projectile.shootOrigin = shootOrigin
		projectile.shootDirection = shootDirection + (VectorRand() * 0.01)
		projectile.attacker = ply
		projectile.attackingent = vehicle
		projectile.Damage = 50
		projectile.Force = 5000
		projectile.Size = 2
		projectile.BlastRadius = 80
		projectile.BlastDamage = 255
		projectile.BlastEffect = "simfphys_tankweapon_explosion_small"
		projectile.MuzzleVelocity = 50

	AVX.FirePhysProjectile( projectile )
end

function simfphys.weapon:ValidClasses()

	local classes = {
		"avx_amtrac"
	}

	return classes
end

function simfphys.weapon:Initialize( vehicle )
	net.Start( "avx_misc_register_tank" )
		net.WriteEntity( vehicle )
		net.WriteString( "amtrac" )
	net.Broadcast()

	simfphys.RegisterCrosshair( vehicle:GetDriverSeat(), { Attachment = "muzzle_agl", Type = 3 } )
	simfphys.RegisterCamera( vehicle:GetDriverSeat(), Vector(-20,15,0), Vector(0,-40,125), true, "muzzle_agl" )

	if not istable( vehicle.PassengerSeats ) or not istable( vehicle.pSeat ) then return end

	simfphys.RegisterCamera( vehicle.pSeat[1], Vector(0,0,55), Vector(0,0,55), true )
	simfphys.RegisterCamera( vehicle.pSeat[2], Vector(0,0,55), Vector(0,0,55), true )
	simfphys.RegisterCamera( vehicle.pSeat[3], Vector(0,0,55), Vector(0,0,55), true )
	simfphys.RegisterCamera( vehicle.pSeat[4], Vector(0,0,55), Vector(0,0,55), true )
	simfphys.RegisterCamera( vehicle.pSeat[5], Vector(0,0,55), Vector(0,0,55), true )
	simfphys.RegisterCamera( vehicle.pSeat[6], Vector(0,0,55), Vector(0,0,55), true )
	simfphys.RegisterCamera( vehicle.pSeat[7], Vector(0,0,55), Vector(0,0,55), true )
	simfphys.RegisterCamera( vehicle.pSeat[8], Vector(0,0,55), Vector(0,0,55), true )
	simfphys.RegisterCamera( vehicle.pSeat[9], Vector(0,0,55), Vector(0,0,55), true )

	timer.Simple( 1, function()
		if not IsValid( vehicle ) then return end
		if not vehicle.VehicleData["filter"] then print("[simfphys Armed Vehicle Pack] ERROR:TRACE FILTER IS INVALID. PLEASE UPDATE SIMFPHYS BASE") return end

		vehicle.WheelOnGround = function( ent )
			ent.FrontWheelPowered = ent:GetPowerDistribution() ~= 1
			ent.RearWheelPowered = ent:GetPowerDistribution() ~= -1

			local physEnt = ent:GetPhysicsObject()
			physEnt:SetBuoyancyRatio(2.4)

			for i = 1, table.Count( ent.Wheels ) do
				local Wheel = ent.Wheels[i]
				local physWheel = Wheel:GetPhysicsObject()

				physWheel:SetBuoyancyRatio(0)

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

function simfphys.weapon:ControlTurret( vehicle, deltapos )
	local pod = vehicle:GetDriverSeat()

	if not IsValid( pod ) then return end

	local ply = pod:GetDriver()

	if not IsValid( ply ) then return end

	local ID = vehicle:LookupAttachment( "muzzle_agl" )
	local Attachment = vehicle:GetAttachment( ID )

	self:AimCannon( ply, vehicle, pod, Attachment )

	local shootOrigin = Attachment.Pos + deltapos * engine.TickInterval()

	local ID2 = vehicle:LookupAttachment( "muzzle_coax" )
	local Attachment2 = vehicle:GetAttachment( ID2 )
	local shootOrigin2 = Attachment2.Pos + deltapos * engine.TickInterval()

	local fire = ply:KeyDown( IN_ATTACK )
	local fire2 = ply:KeyDown( IN_ATTACK2 )

	if fire then
		self:PrimaryAttack( vehicle, ply, shootOrigin, Attachment )
	end

	if fire2 then
		self:SecondaryAttack( vehicle, ply, shootOrigin2, Attachment2, ID2 )
	end
end

function simfphys.weapon:GetForwardSpeed( vehicle )
	return vehicle.ForwardSpeed
end

function simfphys.weapon:IsOnGround( vehicle )
	return vehicle.susOnGround == true
end

function simfphys.weapon:ModPhysics( vehicle, wheelslocked )
	local phys = vehicle:GetPhysicsObject()

	if wheelslocked and self:IsOnGround( vehicle ) then
		phys:ApplyForceCenter( -vehicle:GetVelocity() * phys:GetMass() * 0.04 )
	end

	if bit.band( util.PointContents( vehicle:GetPos() ), CONTENTS_WATER ) == CONTENTS_WATER then
		phys:ApplyForceCenter( vehicle:GetAngles():Forward() * 1000 )
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
			vehicle:CallOnRemove( "stopmesounds", function( veh )
				if veh.track_snd then
					veh.track_snd:Stop()
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
		vehicle.track_snd:ChangePitch( math.Clamp(60 + speed / 80,0,150) )
		vehicle.track_snd:ChangeVolume( math.min( math.max(speed - 20,0) / 600,1) )
	end
end

function simfphys.weapon:Think( vehicle )
	if not IsValid( vehicle ) or not vehicle:IsInitialized() then return end

	vehicle.wOldPos = vehicle.wOldPos or Vector(0,0,0)
	local deltapos = vehicle:GetPos() - vehicle.wOldPos
	vehicle.wOldPos = vehicle:GetPos()

	local handbrake = vehicle:GetHandBrakeEnabled()

	self:UpdateSuspension( vehicle )
	self:DoWheelSpin( vehicle )
	self:ControlTurret( vehicle, deltapos )
	self:ControlTrackSounds( vehicle, handbrake )
	self:ModPhysics( vehicle, handbrake )
end

function simfphys.weapon:PrimaryAttack( vehicle, ply, shootOrigin, Attachment )
	if not self:CanPrimaryAttack( vehicle ) then return end

	mk19_fire( ply, vehicle, shootOrigin, Attachment.Ang:Forward() )

	self:SetNextPrimaryFire( vehicle, CurTime() + (200 / 360) )
end

function simfphys.weapon:SecondaryAttack( vehicle, ply, shootOrigin, Attachment, ID )

	if not self:CanSecondaryAttack( vehicle ) then return end

	local effectdata = EffectData()
		effectdata:SetOrigin( shootOrigin )
		effectdata:SetAngles( Attachment.Ang )
		effectdata:SetEntity( vehicle )
		effectdata:SetAttachment( ID )
		effectdata:SetScale( 1 )
	util.Effect( "CS_MuzzleFlash_X", effectdata, true, true )

	m2_fire( ply, vehicle, shootOrigin, Attachment.Ang:Forward() )

	self:SetNextSecondaryFire( vehicle, CurTime() + (60 / 500) )
end

function simfphys.weapon:AimCannon( ply, vehicle, pod, Attachment )
	if not IsValid( pod ) then return end

	local Aimang = pod:WorldToLocalAngles( ply:EyeAngles() ) + Angle(0, 180, 0)

	local AimRate = 40

	local Angles = vehicle:WorldToLocalAngles( Aimang )

	vehicle.sm_pp_yaw = vehicle.sm_pp_yaw and math.ApproachAngle( vehicle.sm_pp_yaw, Angles.y, AimRate * FrameTime() ) or 0
	vehicle.sm_pp_pitch = vehicle.sm_pp_pitch and math.ApproachAngle( vehicle.sm_pp_pitch, Angles.p + 28, AimRate * FrameTime() ) or 0

	local TargetAng = Angle(vehicle.sm_pp_pitch,vehicle.sm_pp_yaw,0)
	TargetAng:Normalize()

	vehicle:SetPoseParameter("turret_yaw", TargetAng.y )
	vehicle:SetPoseParameter("cannon_aim_yaw", TargetAng.y )
	vehicle:SetPoseParameter("cannon_aim_pitch", TargetAng.p )
end

function simfphys.weapon:CanPrimaryAttack( vehicle )
	vehicle.NextShoot = vehicle.NextShoot or 0
	return vehicle.NextShoot < CurTime()
end

function simfphys.weapon:CanSecondaryAttack( vehicle )
	vehicle.NextShoot2 = vehicle.NextShoot2 or 0
	return vehicle.NextShoot2 < CurTime()
end

function simfphys.weapon:SetNextPrimaryFire( vehicle, time )
	vehicle.NextShoot = time
end

function simfphys.weapon:SetNextSecondaryFire( vehicle, time )
	vehicle.NextShoot2 = time
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

	for i, v in pairs( tiger_susdata ) do
		local att = vehicle:LookupAttachment( tiger_susdata[i].attachment )
		local pos = vehicle:GetAttachment( att ).Pos

		local trace = util.TraceHull( {
			start = pos,
			endpos = pos + vehicle:GetUp() * - 100,
			maxs = Vector(15,15,0),
			mins = -Vector(15,15,0),
			filter = vehicle.filterEntities,
		} )
		local Dist = (pos - trace.HitPos):Length() - 45

		if trace.Hit then
			vehicle.susOnGround = true
		end

		vehicle.oldDist[i] = vehicle.oldDist[i] and (vehicle.oldDist[i] + math.Clamp(Dist - vehicle.oldDist[i],-10,1)) or 0

		vehicle:SetPoseParameter(tiger_susdata[i].poseparameter, vehicle.oldDist[i] )
	end
end

function simfphys.weapon:DoWheelSpin( vehicle )
	local spin_r = vehicle.VehicleData[ "spin_4" ] + vehicle.VehicleData[ "spin_6" ]
	local spin_l = vehicle.VehicleData[ "spin_3" ] + vehicle.VehicleData[ "spin_5" ]

	vehicle:SetPoseParameter("spin_wheels_right", spin_r)
	vehicle:SetPoseParameter("spin_wheels_left", spin_l )

	net.Start( "simfphys_update_tracks", true )
		net.WriteEntity( vehicle )
		net.WriteFloat( spin_r )
		net.WriteFloat( spin_l )
	net.Broadcast()
end