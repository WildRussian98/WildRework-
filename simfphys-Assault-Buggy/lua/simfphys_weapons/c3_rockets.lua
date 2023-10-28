local function rocket_fire(ply,vehicle,shootOrigin,shootDirection)
	vehicle:EmitSound("simulated_vehicles/weapons/missile.ogg")

	vehicle:GetPhysicsObject():ApplyForceOffset( -shootDirection * 10000, shootOrigin ) 
	
	local projectile = {}
		projectile.filter = vehicle.VehicleData["filter"]
		projectile.shootOrigin = shootOrigin
		projectile.shootDirection = shootDirection
		projectile.attacker = ply
		projectile.attackingent = vehicle
		projectile.Damage = 150
		projectile.Force = 1000
		projectile.Size = 8
		projectile.BlastRadius = 100
		projectile.BlastDamage = 50
		projectile.BlastEffect = "simfphys_explosion"
	
	simfphys.FirePhysProjectile( projectile )
					
end

simfphys.weapon.ATGMClipsize = 8

function simfphys.weapon:ValidClasses()
	
	local classes = {
		"sim_fphys_c3_buggy"
	}
	
	return classes
end

function simfphys.weapon:Initialize( vehicle )
	local data = {}
	data.Attachment = "muzzle_l"
	data.Direction = Vector(1,0,0)
	data.Attach_Start_Left = "muzzle_l"
	data.Attach_Start_Right = "muzzle_l"
	data.Type = 3

	simfphys.RegisterCrosshair( vehicle:GetDriverSeat() , { Attachment = "muzzle_l", Type = 5 } )
	simfphys.RegisterCamera( vehicle:GetDriverSeat(), Vector(0,0,11), Vector(0,0,30), true )
	
	if not istable( vehicle.PassengerSeats ) or not istable( vehicle.pSeat ) then return end
	
end


function simfphys.weapon:AimWeapon( ply, vehicle, pod )	
	if not IsValid( pod ) then return end

	local ID = vehicle:LookupAttachment( "muzzle_l" )
	local Attachment = vehicle:GetAttachment( ID )
	
	local Aimang = pod:WorldToLocalAngles( ply:EyeAngles() )
	Aimang:Normalize()

	local AimRate = 10
	
	local Angles = vehicle:WorldToLocalAngles( Aimang + Angle(-2.3,0,0) )

	vehicle.sm_pp_yaw = vehicle.sm_pp_yaw and math.ApproachAngle( vehicle.sm_pp_yaw, Angles.y, AimRate * FrameTime() ) or 90
	vehicle.sm_pp_pitch = vehicle.sm_pp_pitch and math.ApproachAngle( vehicle.sm_pp_pitch, -Angles.p, AimRate * FrameTime() ) or 0

	local TargetAng = Angle(vehicle.sm_pp_pitch,vehicle.sm_pp_yaw,90)
	TargetAng:Normalize()
	
	vehicle:SetPoseParameter("mg_aim_yaw", TargetAng.y )
	vehicle:SetPoseParameter("mg_aim_pitch", -TargetAng.p )
end

function simfphys.weapon:Think( vehicle )
	if not istable( vehicle.PassengerSeats ) or not istable( vehicle.pSeat ) then return end
	
	local pod = vehicle:GetDriverSeat()
	
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
		self:PrimaryAttack( vehicle, ply, shootOrigin )
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
	
   self.ATGMClip = self.ATGMClip or self.ATGMClipsize
	
	vehicle.wOldPos = vehicle.wOldPos or Vector(0,0,0)
	local deltapos = vehicle:GetPos() - vehicle.wOldPos
	vehicle.wOldPos = vehicle:GetPos()
	
	if self.ATGMClip <= 0 then
		self.ATGMClip = self.ATGMClipsize
		vehicle:EmitSound("tiger_reload")
		self:SetNextPrimaryFire( vehicle, CurTime() + 15 )
		return
	end

	self.ATGMClip = self.ATGMClip - 1

	if vehicle.swapMuzzle then
		vehicle.swapMuzzle = false
	else
		vehicle.swapMuzzle = true
	end
	
	local AttachmentID = vehicle.swapMuzzle and vehicle:LookupAttachment( "muzzle_l" ) or vehicle:LookupAttachment( "muzzle_r" )
	local Attachment = vehicle:GetAttachment( AttachmentID )
	
	local shootOrigin = Attachment.Pos + deltapos * engine.TickInterval()
	local shootDirection = Attachment.Ang:Forward()

	rocket_fire( ply, vehicle, shootOrigin, shootDirection )
	
	self:SetNextPrimaryFire( vehicle, CurTime() + 0.15 )
end