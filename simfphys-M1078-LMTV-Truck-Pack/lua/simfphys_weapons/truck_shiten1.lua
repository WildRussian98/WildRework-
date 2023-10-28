local function mg_fire(ply,vehicle,shootOrigin,shootDirection)

	vehicle:EmitSound("m1078_shiten")

	local projectile = {}
		projectile.filter = vehicle.VehicleData["filter"]
		projectile.shootOrigin = shootOrigin
		projectile.shootDirection = shootDirection
		projectile.attacker = ply
		projectile.Tracer	= 1
		projectile.HullSize = 5
		projectile.attackingent = vehicle
		projectile.Spread = Vector(0.008,0.008,0.008)
		projectile.Damage = 38
		projectile.Force = 12
	
	simfphys.FireHitScan( projectile )
end

function simfphys.weapon:ValidClasses()
	
	local classes = {
		"sim_fphys_crysis_cargotruck_short_mg"
	}
	
	return classes
end

function simfphys.weapon:Initialize( vehicle )
	local data = {}
	vehicle.pSeat[1]:SetParent(vehicle,vehicle:LookupAttachment("gunner"))

	simfphys.RegisterCrosshair( vehicle.pSeat[1] , { Attachment = "muzzle", Type = 1 } )
	simfphys.RegisterCamera( vehicle.pSeat[1], Vector(-60,0,10), Vector(0,0,30), true, "muzzle" )
	
	if not istable( vehicle.PassengerSeats ) or not istable( vehicle.pSeat ) then return end
	
end


function simfphys.weapon:AimWeapon( ply, vehicle, pod )	
	if not IsValid( pod ) then return end
	
	local Aimang = pod:WorldToLocalAngles( ply:EyeAngles() )
	Aimang:Normalize()
	
	local AimRate = 80
	
	local Angles = vehicle:WorldToLocalAngles( Aimang + Angle(-2.2,0,0) )
	
	vehicle.sm_ppmg_yaw = vehicle.sm_ppmg_yaw and math.ApproachAngle( vehicle.sm_ppmg_yaw, Angles.y, AimRate * FrameTime() ) or 0
	vehicle.sm_ppmg_pitch = vehicle.sm_ppmg_pitch and math.ApproachAngle( vehicle.sm_ppmg_pitch, Angles.p, AimRate * FrameTime() ) or 0
	
	local TargetAng = Angle(vehicle.sm_ppmg_pitch,vehicle.sm_ppmg_yaw,0)
	TargetAng:Normalize() 
	
	vehicle:SetPoseParameter("mg_aim_yaw", TargetAng.y )
	vehicle:SetPoseParameter("mg_aim_pitch", TargetAng.p )
end

function simfphys.weapon:Think( vehicle )
	if not istable( vehicle.PassengerSeats ) or not istable( vehicle.pSeat ) then return end
	
	local pod = vehicle.pSeat[1]
	
	if not IsValid( pod ) then return end
	
	local ply = pod:GetDriver()
	
	local curtime = CurTime()
	
	if not IsValid( ply ) then return end
	
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
	
	vehicle.wOldPos = vehicle.wOldPos or Vector(0,0,0)
	local deltapos = vehicle:GetPos() - vehicle.wOldPos
	vehicle.wOldPos = vehicle:GetPos()
	
	local AttachmentID = vehicle:LookupAttachment( "muzzle" )
	local Attachment = vehicle:GetAttachment( AttachmentID )
	
	local shootOrigin = Attachment.Pos + deltapos * engine.TickInterval()
	local shootDirection = Attachment.Ang:Forward()

	mg_fire( ply, vehicle, shootOrigin, shootDirection )
	
	self:SetNextPrimaryFire( vehicle, CurTime() + 0.1 )
end