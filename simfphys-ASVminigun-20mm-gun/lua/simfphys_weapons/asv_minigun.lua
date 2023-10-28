local function mg_fire(ply,vehicle,shootOrigin,shootDirection)
	local projectile = {}
		projectile.filter = vehicle.VehicleData["filter"]
		projectile.shootOrigin = shootOrigin
		projectile.shootDirection = shootDirection
		projectile.attacker = ply
		projectile.Tracer	= 1
		projectile.HullSize = 5
		projectile.attackingent = vehicle
		projectile.Spread = Vector(0.004,0.004,0.004)
		projectile.Damage = 15
		projectile.Force = 12
	
	simfphys.FireHitScan( projectile )
end

function simfphys.weapon:ValidClasses()
	
	local classes = {
		"sim_fphys_asv_minigun"
	}	
	return classes
end

function simfphys.weapon:Initialize( vehicle )
	local data = {}
	simfphys.RegisterCrosshair( vehicle.pSeat[1] , { Attachment = "minigun_muzzle", Type = 1 } )
	simfphys.RegisterCamera( vehicle.pSeat[1], Vector(-34,-15,2), Vector(-20,0,50), true, "minigun_muzzle" )
	
	if not istable( vehicle.PassengerSeats ) or not istable( vehicle.pSeat ) then return end
	
end


function simfphys.weapon:AimWeapon( ply, vehicle, pod )	
	if not IsValid( pod ) then return end

	local ID = vehicle:LookupAttachment( "minigun_muzzle" )
	local Attachment = vehicle:GetAttachment( ID )
	
	local Aimang = pod:WorldToLocalAngles( ply:EyeAngles() )
	Aimang:Normalize()
	
	local AimRate = 100
	
	local Angles = vehicle:WorldToLocalAngles( Aimang + Angle(-2.2,0,0) )
	
	vehicle.sm_pp_yaw = vehicle.sm_pp_yaw and math.ApproachAngle( vehicle.sm_pp_yaw, Angles.y, AimRate * FrameTime() ) or 0
	vehicle.sm_pp_pitch = vehicle.sm_pp_pitch and math.ApproachAngle( vehicle.sm_pp_pitch, Angles.p, AimRate * FrameTime() ) or 0
	
	local TargetAng = Angle(vehicle.sm_pp_pitch,vehicle.sm_pp_yaw,0)
	TargetAng:Normalize() 

	vehicle:SetPoseParameter("cannon_aim_yaw", TargetAng.y)
	vehicle:SetPoseParameter("cannon_aim_pitch", -TargetAng.p)
end

function simfphys.weapon:Think( vehicle )
	if not istable( vehicle.PassengerSeats ) or not istable( vehicle.pSeat ) then return end
	
	local pod = vehicle.pSeat[1]
	
	if not IsValid( pod ) then return end
	
	local ply = pod:GetDriver()
	
	local curtime = CurTime()
	
	if not IsValid(ply) then
		if vehicle.wpn then
			vehicle.wpn:Stop()
			vehicle.wpn = nil
		end
		return
	end
	
	self:AimWeapon( ply, vehicle, pod )
	
	local fire = ply:KeyDown( IN_ATTACK )
	
	vehicle.smoothaltfire = vehicle.smoothaltfire and (vehicle.smoothaltfire + ((fire and 500 or 0) - vehicle.smoothaltfire) * 0.1) or 0
	vehicle.minigunspin = vehicle.minigunspin and (vehicle.minigunspin + vehicle.smoothaltfire) or 0
	vehicle:SetPoseParameter("turret_barrel_spin", vehicle.minigunspin )
	
	if fire then
		self:PrimaryAttack( vehicle, ply, shootOrigin )
		vehicle.wpn = CreateSound( vehicle, "asv_minigun_loop" )
		vehicle.wpn:Play()
		vehicle:CallOnRemove( "stop_fire_sounds", function( vehicle )
			if vehicle.wpn then
				vehicle.wpn:Stop()
				vehicle.wpn = nil
			end
		end)
	else
		if vehicle.wpn then
			vehicle.wpn:Stop()
			vehicle.wpn = nil
			vehicle:EmitSound( "asv_minigun_loop_down" )
		end
	end
end

function simfphys.weapon:CanPrimaryAttack( vehicle )
	vehicle.NextShoot = vehicle.NextShoot or 0
	return vehicle.NextShoot < CurTime()
end

function simfphys.weapon:SetNextPrimaryFire( vehicle, time )
	vehicle.NextShoot = time
end

function simfphys.weapon:PrimaryAttack( vehicle, ply )

	if not self:CanPrimaryAttack( vehicle ) then return end
	
	vehicle.wOldPos = vehicle.wOldPos or Vector(0,0,0)
	local deltapos = vehicle:GetPos() - vehicle.wOldPos
	vehicle.wOldPos = vehicle:GetPos()
	
	local AttachmentID = vehicle:LookupAttachment( "minigun_muzzle" )
	local Attachment = vehicle:GetAttachment( AttachmentID )
	
	local shootOrigin = Attachment.Pos + deltapos * engine.TickInterval()
	local shootDirection = Attachment.Ang:Forward()

	mg_fire( ply, vehicle, shootOrigin, shootDirection )
	
	self:SetNextPrimaryFire( vehicle, CurTime() + 0.04 )
end