local function hmg_fire(ply,vehicle,shootOrigin,shootDirection)

	vehicle:EmitSound("tiger_fire_mg_new")
	
	local projectile = {}
		projectile.filter = vehicle.VehicleData["filter"]
		projectile.shootOrigin = shootOrigin
		projectile.shootDirection = shootDirection
		projectile.attacker = ply
		projectile.Tracer	= 1
		projectile.HullSize = 6
		projectile.attackingent = vehicle
		projectile.Spread = Vector(0.006,0.006,0.006)
		projectile.Damage = 10
		projectile.Force = 20
	
	simfphys.FireHitScan( projectile )
end

local function cannon_fire(ply,vehicle,shootOrigin,shootDirection)
	vehicle:EmitSound("simulated_vehicles/weapons/autocanon/apc_fire.ogg")

	vehicle:GetPhysicsObject():ApplyForceOffset( -shootDirection * 10000, shootOrigin )

	local projectile = {}
		projectile.filter = vehicle.VehicleData["filter"]
		projectile.shootOrigin = shootOrigin - (shootDirection * 100)
		projectile.shootDirection = shootDirection + (VectorRand() * 0.003)
		projectile.attacker = ply
		projectile.attackingent = vehicle
		projectile.Spread = Vector(0.006,0.006,0.006)
		projectile.Damage = 220
		projectile.Force = 20
		projectile.Tracer	= 1
		projectile.HullSize = 10

	simfphys.FireHitScan( projectile )
end

function simfphys.weapon:ValidClasses()
	return { "simfphys_btr80" }
end

function simfphys.weapon:Initialize( vehicle )
	net.Start( "simfphys_register_tank" )
		net.WriteEntity( vehicle )
		net.WriteString( "lav300" )
	net.Broadcast()

	if not istable( vehicle.PassengerSeats ) or not istable( vehicle.pSeat ) then return end

	simfphys.RegisterCamera( vehicle.pSeat[1], Vector(0,0,40), Vector(0,0,40), true )	
	simfphys.RegisterCamera( vehicle.pSeat[2], Vector(0,0,40), Vector(0,0,40), true )
	simfphys.RegisterCamera( vehicle.pSeat[3], Vector(0,0,40), Vector(0,0,40), true )	
	simfphys.RegisterCamera( vehicle.pSeat[4], Vector(0,0,40), Vector(0,0,40), true )
	simfphys.RegisterCamera( vehicle.pSeat[5], Vector(0,0,40), Vector(0,0,40), true )
	simfphys.RegisterCamera( vehicle.pSeat[6], Vector(0,0,40), Vector(0,0,40), true )	
	
	for i = 2, table.Count( vehicle.pSeat ) do
	simfphys.RegisterCrosshair( vehicle:GetDriverSeat(), { Attachment = "muzzle_KPVT", Type = 2 } )
	simfphys.RegisterCamera( vehicle:GetDriverSeat(), Vector(-50,-7,-15), Vector(20,40,60), true, "muzzle_KPVT" )
	end
	
end

function simfphys.weapon:GetForwardSpeed( vehicle )
	return vehicle.ForwardSpeed
end

function simfphys.weapon:IsOnGround( vehicle )
	return (vehicle.susOnGround == true)
end

function simfphys.weapon:AimCannon( ply, vehicle, pod, Attachment )
	local Aimang = pod:WorldToLocalAngles( ply:EyeAngles() )
	local AimRate = 40
	
	local Angles = vehicle:WorldToLocalAngles( Aimang ) - Angle(0,0,0)
	
	vehicle.sm_pp_yaw = vehicle.sm_pp_yaw and math.ApproachAngle( vehicle.sm_pp_yaw, Angles.y, AimRate * FrameTime() ) or 0
	vehicle.sm_pp_pitch = vehicle.sm_pp_pitch and math.ApproachAngle( vehicle.sm_pp_pitch, Angles.p, AimRate * FrameTime() ) or 0
	
	local TargetAng = Angle(vehicle.sm_pp_pitch,vehicle.sm_pp_yaw,0)
	TargetAng:Normalize() 
	
	vehicle:SetPoseParameter("mg_aim_yaw", TargetAng.y )
	vehicle:SetPoseParameter("mg_aim_pitch", -TargetAng.p )
	
	return Aimang
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
	
	local ID = vehicle:LookupAttachment( "muzzle_KPVT" )
	local Attachment = vehicle:GetAttachment( ID )
	
	self:AimCannon( ply, vehicle, pod, Attachment )
	
	local DeltaP = deltapos * engine.TickInterval()
	
	local fire = ply:KeyDown( IN_ATTACK )
	local fire2 = ply:KeyDown( IN_ATTACK2 )
	
	if fire then
		self:PrimaryAttack( vehicle, ply, Attachment.Pos + DeltaP, Attachment )
	end
	
	if fire2 then
		self:SecondaryAttack( vehicle, ply, DeltaP, Attachment.Pos, Attachment.Ang )
	end
end

///

function simfphys.weapon:PrimaryAttack( vehicle, ply, shootOrigin, Attachment )
	if not self:CanPrimaryAttack( vehicle ) then return end
	
	local shootDirection = Attachment.Ang:Forward()
	
	cannon_fire( ply, vehicle, shootOrigin + shootDirection * 80, shootDirection )
	
	self:SetNextPrimaryFire( vehicle, CurTime() + 0.13 )
	
end

function simfphys.weapon:CanPrimaryAttack( vehicle )
	vehicle.NextShoot = vehicle.NextShoot or 0
	return vehicle.NextShoot < CurTime()
end

function simfphys.weapon:SetNextPrimaryFire( vehicle, time )
	vehicle.NextShoot = time
end


function simfphys.weapon:SecondaryAttack( vehicle, ply, deltapos, cPos, cAng )
	
	if not self:CanSecondaryAttack( vehicle ) then return end
	
	local ID = vehicle:LookupAttachment( "muzzle_PKT" )
	local Attachment = vehicle:GetAttachment( ID )
	
	local effectdata = EffectData()
		effectdata:SetOrigin( Attachment.Pos + deltapos )
		effectdata:SetAngles( Attachment.Ang + Angle(0,90,0) )
		effectdata:SetEntity( vehicle )
		effectdata:SetAttachment( ID )
		effectdata:SetScale( 4 )
	util.Effect( "CS_MuzzleFlash", effectdata, true, true )
	
	local trace = util.TraceLine( {
		start = cPos,
		endpos = cPos + cAng:Forward() * 50000,
		filter = vehicle.VehicleData["filter"]
	} )

	hmg_fire( ply, vehicle, Attachment.Pos, (trace.HitPos - Attachment.Pos):GetNormalized() )
	
	self:SetNextSecondaryFire( vehicle, CurTime() + 0.0925 )
end

function simfphys.weapon:CanSecondaryAttack( vehicle )
	vehicle.NextShoot2 = vehicle.NextShoot2 or 0
	return vehicle.NextShoot2 < CurTime()
end

function simfphys.weapon:SetNextSecondaryFire( vehicle, time )
	vehicle.NextShoot2 = time
end

function simfphys.weapon:ModPhysics( vehicle, wheelslocked )
	if wheelslocked and self:IsOnGround( vehicle ) then
		local phys = vehicle:GetPhysicsObject()
		phys:ApplyForceCenter( -vehicle:GetVelocity() * phys:GetMass() * 0.1 )
	end
end

function simfphys.weapon:Think( vehicle )
	if not IsValid( vehicle ) or not vehicle:IsInitialized() then return end
	
	vehicle.wOldPos = vehicle.wOldPos or Vector(0,0,0)
	local deltapos = vehicle:GetPos() - vehicle.wOldPos
	vehicle.wOldPos = vehicle:GetPos()
	
	local handbrake = vehicle:GetHandBrakeEnabled()
	
	self:ControlTurret( vehicle, deltapos )
	self:ModPhysics( vehicle, handbrake )
end
