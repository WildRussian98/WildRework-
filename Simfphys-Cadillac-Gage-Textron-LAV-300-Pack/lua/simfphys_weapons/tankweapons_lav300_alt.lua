
local function hmg_fire(ply,vehicle,shootOrigin,shootDirection)

	vehicle:EmitSound("tiger_fire_mg_new")
	
	local projectile = {}
		projectile.filter = vehicle.VehicleData["filter"]
		projectile.shootOrigin = shootOrigin
		projectile.shootDirection = shootDirection
		projectile.attacker = ply
		projectile.Tracer	= 2
		projectile.HullSize = 4
		projectile.attackingent = vehicle
		projectile.Damage = 20
		projectile.Force = 12
	
	simfphys.FireHitScan( projectile )
end

local function cannon_fire(ply,vehicle,shootOrigin,shootDirection)
	vehicle:EmitSound("leopard_fire")
	
	timer.Simple( 1.8, function() 
		if IsValid( vehicle ) then 
			vehicle:EmitSound("simulated_vehicles/weapons/leopard_ready.ogg")
		end
	end)
	
	local effectdata = EffectData()
		effectdata:SetEntity( vehicle )
	util.Effect( "simfphys_leopard_muzzle", effectdata )
	
	vehicle:GetPhysicsObject():ApplyForceOffset( -shootDirection * 400000, shootOrigin ) 
	
	local projectile = {}
		projectile.filter = vehicle.VehicleData["filter"]
		projectile.shootOrigin = shootOrigin
		projectile.shootDirection = shootDirection
		projectile.attacker = ply
		projectile.attackingent = vehicle
		projectile.Damage = 1400
		projectile.Force = 4500
		projectile.Size = 10
		projectile.BlastRadius = 255
		projectile.BlastDamage = 80
		projectile.BlastEffect = "simfphys_tankweapon_explosion"
	
	simfphys.FirePhysProjectile( projectile )
	
end

function simfphys.weapon:ValidClasses()
	return { "sim_fphys_tfre_lav300_2" }
end

function simfphys.weapon:Initialize( vehicle )
	net.Start( "simfphys_register_tank" )
		net.WriteEntity( vehicle )
		net.WriteString( "lav300" )
	net.Broadcast()

	if not istable( vehicle.PassengerSeats ) or not istable( vehicle.pSeat ) then return end
	
	for i = 2, table.Count( vehicle.pSeat ) do
	simfphys.RegisterCrosshair( vehicle:GetDriverSeat(), { Attachment = "muzzle_left", Type = 2 } )
	simfphys.RegisterCamera( vehicle:GetDriverSeat(), Vector(0,0,0), Vector(13,75,70), true, "muzzle_right" )
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
	local AimRate = 35
	
	local Angles = vehicle:WorldToLocalAngles( Aimang ) - Angle(0,180,0)
	
	vehicle.sm_pp_yaw = vehicle.sm_pp_yaw and math.ApproachAngle( vehicle.sm_pp_yaw, Angles.y, AimRate * FrameTime() ) or 0
	vehicle.sm_pp_pitch = vehicle.sm_pp_pitch and math.ApproachAngle( vehicle.sm_pp_pitch, Angles.p, AimRate * FrameTime() ) or 0
	
	local TargetAng = Angle(vehicle.sm_pp_pitch,vehicle.sm_pp_yaw,0)
	TargetAng:Normalize() 
	
	vehicle:SetPoseParameter("turret_yaw", TargetAng.y )
	vehicle:SetPoseParameter("turret_pitch", TargetAng.p )
	
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
	
	local ID = vehicle:LookupAttachment( "muzzle_left" )
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
	
	self:SetNextPrimaryFire( vehicle, CurTime() + 2 )
	
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
	
	local ID = vehicle:LookupAttachment( "muzzle_right" )
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
	
	self:SetNextSecondaryFire( vehicle, CurTime() + 0.063 )
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
		phys:ApplyForceCenter( -vehicle:GetVelocity() * phys:GetMass() * 0.04 )
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
