local function mg_fire(ply,vehicle,shootOrigin,shootDirection)

	vehicle:EmitSound("bf4_vehicles/pkp_fire.ogg")

	local projectile = {}
		projectile.filter = vehicle.VehicleData["filter"]
		projectile.shootOrigin = shootOrigin
		projectile.shootDirection = shootDirection
		projectile.attacker = ply
		projectile.Tracer	= 1
		projectile.HullSize = 1
		projectile.attackingent = vehicle
		projectile.Spread = Vector(0.008,0.008,0.008)
		projectile.Damage = 35
		projectile.Force = 10
	
	simfphys.FireHitScan( projectile )
end

function simfphys.weapon:ValidClasses()
	
	local classes = {
		"bf4_vdv_buggy"
	}
	
	return classes
end

function simfphys.weapon:Initialize( vehicle )
	local data = {}
	data.Attachment = "pkp_muzzle"
	data.Direction = Vector(0,0,0)
	data.Attach_Start_Left = "pkp_muzzle"
	data.Attach_Start_Right = "pkp_muzzle"
	data.Type = 3

	simfphys.RegisterCrosshair( vehicle.pSeat[1] , { Attachment = "pkp_muzzle", Type = 5 } )
	simfphys.RegisterCamera( vehicle.pSeat[1], Vector(-92,-0,8), Vector(0,60,30), true, "pkp_muzzle" )
	
	if not istable( vehicle.PassengerSeats ) or not istable( vehicle.pSeat ) then return end
	
end


function simfphys.weapon:AimWeapon( ply, vehicle, pod )	
	if not IsValid( pod ) then return end

	local ID = vehicle:LookupAttachment( "pkp_muzzle" )
	local Attachment = vehicle:GetAttachment( ID )
	
	local Aimang = pod:WorldToLocalAngles( ply:EyeAngles() )
	
	local Angles = vehicle:WorldToLocalAngles( Aimang )
	Angles:Normalize()
	
	vehicle.sm_dir  = vehicle.sm_dir or Vector(0,90,0)
	
	local L_Right = Angle(0,Aimang.y,0):Right()
	local La_Right = Angle(0,Attachment.Ang.y,0):Forward()
	local AimRate = 40
	local Yaw_Diff = math.Clamp( math.acos( math.Clamp( L_Right:Dot( La_Right ) ,-1,1) ) * (180 / math.pi) - 90,-AimRate,AimRate )
	
	local TargetPitch = Angles.p
	local TargetYaw = vehicle.sm_dir:Angle().y - Yaw_Diff
	
	vehicle.sm_dir = vehicle.sm_dir + (Angle(0,TargetYaw,0):Forward() - vehicle.sm_dir) * 0.05
	vehicle.sm_pitch = vehicle.sm_pitch and (vehicle.sm_pitch + (TargetPitch - vehicle.sm_pitch) * 0.50) or 0
	
	vehicle:SetPoseParameter("mg_aim_yaw", vehicle.sm_dir:Angle().y )
	vehicle:SetPoseParameter("mg_aim_pitch", -vehicle.sm_pitch )
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

	if vehicle.swapMuzzle then
		vehicle.swapMuzzle = false
	else
		vehicle.swapMuzzle = true
	end
	
	local AttachmentID = vehicle.swapMuzzle and vehicle:LookupAttachment( "pkp_muzzle" ) or vehicle:LookupAttachment( "pkp_muzzle" )
	local Attachment = vehicle:GetAttachment( AttachmentID )
	
	local shootOrigin = Attachment.Pos + deltapos * engine.TickInterval()
	local shootDirection = Attachment.Ang:Forward()

	mg_fire( ply, vehicle, shootOrigin, shootDirection )
	
	self:SetNextPrimaryFire( vehicle, CurTime() + 0.12 )
end