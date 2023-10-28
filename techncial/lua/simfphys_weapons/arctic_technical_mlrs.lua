local ClipSize = 20

local function rocket_fire(ply,vehicle,shootOrigin,shootDirection)

	vehicle:EmitSound("simulated_vehicles/weapons/missile.ogg", 130)

	vehicle:GetPhysicsObject():ApplyForceOffset( -shootDirection * 50000, shootOrigin )

	local projectile = {}
		projectile.filter = vehicle.VehicleData["filter"]
		projectile.shootOrigin = shootOrigin
		projectile.shootDirection = shootDirection + VectorRand() * 0.05
		projectile.attacker = ply
		projectile.attackingent = vehicle
		projectile.Damage = 250
		projectile.Force = 4000
		projectile.Size = 10
		projectile.BlastRadius = 450
		projectile.BlastDamage = 100
		projectile.BlastEffect = "simfphys_tankweapon_explosion"
		projectile.MuzzleVelocity = 50

	AVX.FirePhysProjectile( projectile )
end

function simfphys.weapon:ValidClasses()

	local classes = {
		"avx_technical_mlrs"
	}

	return classes
end

function simfphys.weapon:Initialize( vehicle )
	local data = {}
	data.Attachment = "rocket_muzzle_1"
	data.Direction = Vector(0,0,-1)
	data.Attach_Start = "rocket_muzzle_1"
	data.Type = 3

	simfphys.RegisterCrosshair( vehicle:GetDriverSeat(), data )
	simfphys.RegisterCamera( vehicle:GetDriverSeat(), Vector(4, 0, 8), Vector(28, 60, 64), true )

	if not istable( vehicle.PassengerSeats ) or not istable( vehicle.pSeat ) then return end
end

function simfphys.weapon:AimWeapon( ply, vehicle, pod )
	local Aimang = pod:WorldToLocalAngles( ply:EyeAngles() )
	local AimRate = 20

	local Angles = vehicle:WorldToLocalAngles( Aimang )

	vehicle.sm_pp_pitch = vehicle.sm_pp_pitch and math.ApproachAngle( vehicle.sm_pp_pitch, -Angles.p, AimRate * FrameTime() ) or 0

	local TargetAng = Angle(vehicle.sm_pp_pitch,vehicle.sm_pp_yaw,0)
	TargetAng:Normalize()

	vehicle:SetPoseParameter("rocket_pitch", TargetAng.p )
end

function simfphys.weapon:Think( vehicle )
	local pod = vehicle:GetDriverSeat()
	if not IsValid( pod ) then return end

	local ply = pod:GetDriver()

	if not IsValid( ply ) then
		if vehicle.wpn then
			vehicle.wpn:Stop()
			vehicle.wpn = nil
		end

		return
	end

	self:AimWeapon( ply, vehicle, pod )

	local fire = ply:KeyDown( IN_ATTACK )

	if fire then
		self:PrimaryAttack( vehicle, ply )
	end

	vehicle.Clip = vehicle.Clip or ClipSize

	if ply:KeyDown( IN_ATTACK2 ) and vehicle.Clip < ClipSize and self:CanSecondaryAttack(vehicle) then
		vehicle.Clip = ClipSize
		self:SetNextSecondaryFire( vehicle, CurTime() + 10 )

		vehicle:EmitSound("tiger_reload")

		timer.Simple( 9.5, function()
			if IsValid( vehicle ) then
				vehicle:EmitSound("simulated_vehicles/weapons/leopard_ready.wav")
			end
		end)

		return
	end
end

function simfphys.weapon:CanPrimaryAttack( vehicle )
	vehicle.NextShoot = vehicle.NextShoot or 0
	return vehicle.NextShoot < CurTime()
end

function simfphys.weapon:SetNextPrimaryFire( vehicle, time )
	vehicle.NextShoot = time
end

function simfphys.weapon:CanSecondaryAttack( vehicle )
	vehicle.NextShoot2 = vehicle.NextShoot2 or 0
	return vehicle.NextShoot2 < CurTime()
end

function simfphys.weapon:SetNextSecondaryFire( vehicle, time )
	vehicle.NextShoot2 = time
end

function simfphys.weapon:PrimaryAttack( vehicle, ply )
	if not self:CanSecondaryAttack( vehicle ) then return end

	vehicle.Clip = vehicle.Clip or ClipSize

	vehicle.Clip = vehicle.Clip - 1

	if vehicle.Clip <= 0 then
		vehicle.Clip = ClipSize
		self:SetNextSecondaryFire( vehicle, CurTime() + 12 )

		vehicle:EmitSound("tiger_reload")

		timer.Simple( 9.5, function()
			if IsValid( vehicle ) then
				vehicle:EmitSound("simulated_vehicles/weapons/leopard_ready.wav")
			end
		end)

		return
	end

	vehicle.wOldPos = vehicle.wOldPos or vehicle:GetPos()
	local deltapos = vehicle:GetPos() - vehicle.wOldPos
	vehicle.wOldPos = vehicle:GetPos()

	local AttachmentID = vehicle:LookupAttachment( "rocket_muzzle_" .. tostring(math.fmod(ClipSize - vehicle.Clip, 20) + 1) )
	local Attachment = vehicle:GetAttachment( AttachmentID )
	local ang = Attachment.Ang

	local shootOrigin = Attachment.Pos + deltapos * engine.TickInterval()
	local shootDirection = -ang:Up()

	local effectdata = EffectData()
		effectdata:SetEntity( vehicle )
		effectdata:SetAttachment( AttachmentID )
	util.Effect( "arctic_technical_muzzle", effectdata, true, true )

	rocket_fire( ply, vehicle, shootOrigin, shootDirection )

	self:SetNextSecondaryFire( vehicle, CurTime() + (60 / 600) )
end