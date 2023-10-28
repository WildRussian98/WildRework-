local ClipSize = 7

local function mg_fire(ply,vehicle,shootOrigin,shootDirection)

	vehicle:EmitSound("simulated_vehicles/weapons/missile.ogg", 130)

	vehicle:GetPhysicsObject():ApplyForceOffset( -shootDirection * 50000, shootOrigin )
	
	local projectile = {}
		projectile.filter = vehicle.VehicleData["filter"]
		projectile.shootOrigin = shootOrigin
		projectile.shootDirection = shootDirection + VectorRand() * 0.02
		projectile.attacker = ply
		projectile.attackingent = vehicle
		projectile.Damage = 5500
		projectile.Force = 5000
		projectile.Size = 50
		projectile.BlastRadius = 350
		projectile.BlastDamage = 1000
		projectile.BlastEffect = "simfphys_tankweapon_explosion"
		projectile.MuzzleVelocity = 70
	
	AVX.FirePhysProjectile( projectile )
end

function simfphys.weapon:ValidClasses()
	
	local classes = {
		"M142"
	}
	
	return classes
end

function simfphys.weapon:Initialize( vehicle )


	local data = {}
	data.Attachment = "middle"
	data.Direction = Vector(1,0,0)
	data.Attach_Start_Left = "muzzle_left"
	data.Attach_Start_Right = "muzzle_right"
	data.Type = 3

	simfphys.RegisterCrosshair( vehicle.pSeat[1] , { Attachment = "middle", Type = 5 } )
	simfphys.RegisterCamera( vehicle.pSeat[1], Vector(0,0,10), Vector(-20,20,50), true, "middle" )
	
	if not istable( vehicle.PassengerSeats ) or not istable( vehicle.pSeat ) then return end
	
end


function simfphys.weapon:AimWeapon( ply, vehicle, pod )	
	if not IsValid( pod ) then return end

	local ID = vehicle:LookupAttachment( "muzzle_left" )
	local Attachment = vehicle:GetAttachment( ID )
	
	local Aimang = pod:WorldToLocalAngles( ply:EyeAngles() )
	
	local Angles = vehicle:WorldToLocalAngles( Aimang )
	Angles:Normalize()
	
	vehicle.sm_dir  = vehicle.sm_dir or Vector(0,0,0)
	
	local L_Right = Angle(0,Aimang.y,0):Right()
	local La_Right = Angle(0,Attachment.Ang.y,0):Forward()
	local AimRate = 15
	local Yaw_Diff = math.Clamp( math.acos( math.Clamp( L_Right:Dot( La_Right ) ,-1,1) ) * (180 / math.pi) - 90,-AimRate,AimRate )
	
	local TargetPitch = Angles.p
	local TargetYaw = vehicle.sm_dir:Angle().y - Yaw_Diff
	
	vehicle.sm_dir = vehicle.sm_dir + (Angle(0,TargetYaw,0):Forward() - vehicle.sm_dir) * 0.05
	vehicle.sm_pitch = vehicle.sm_pitch and (vehicle.sm_pitch + (TargetPitch - vehicle.sm_pitch) * 0.05) or 0
	
	vehicle:SetPoseParameter("turret_yaw", vehicle.sm_dir:Angle().y )
	vehicle:SetPoseParameter("turret_pitch", vehicle.sm_pitch )
end

function simfphys.weapon:Think( vehicle )
	if not istable( vehicle.PassengerSeats ) or not istable( vehicle.pSeat ) then return end
	
	local pod = vehicle.pSeat[1]
	
	if not IsValid( pod ) then return end
	
	local ply = pod:GetDriver()
	
	local curtime = CurTime()
	
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
		self:SetNextSecondaryFire( vehicle, CurTime() + 5 )

		vehicle:EmitSound("t90ms_reload")

		timer.Simple( 10, function()
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
	if not self:CanPrimaryAttack( vehicle ) then return end

	vehicle.Clip = vehicle.Clip or ClipSize

	vehicle.Clip = vehicle.Clip - 1

	if vehicle.Clip <= 0 then
		vehicle.Clip = ClipSize
		self:SetNextPrimaryFire( vehicle, CurTime() + 12 )

		vehicle:EmitSound("t90ms_reload")

		timer.Simple( 10, function()
			if IsValid( vehicle ) then
				vehicle:EmitSound("simulated_vehicles/weapons/leopard_ready.wav")
			end
		end)

		return
	end
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
	
	mg_fire( ply, vehicle, shootOrigin, shootDirection )
	
	self:SetNextPrimaryFire( vehicle, CurTime() + 0.25 )
end
