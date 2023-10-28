local function mg_fire(ply,vehicle,shootOrigin,shootDirection)

	vehicle:EmitSound("simulated_vehicles/weapons/autocanon/apc_fire.ogg")

	local projectile = {}
		projectile.filter = vehicle.VehicleData["filter"]
		projectile.shootOrigin = shootOrigin
		projectile.shootDirection = shootDirection
		projectile.attacker = ply
		projectile.Tracer	= 1
		projectile.HullSize = 5
		projectile.attackingent = vehicle
		projectile.Spread = Vector(0.002,0.002,0.002)
		projectile.Damage = 180
		projectile.Force = 12
	
	simfphys.FireHitScan( projectile )
end

simfphys.weapon.GunClipsize = 150

function simfphys.weapon:ValidClasses()
	
	local classes = {
		"sim_fphys_hummerh2_mg"
	}
	
	return classes
end

function simfphys.weapon:Initialize( vehicle )
	local data = {}
	data.Attachment = "mg_muzzle"
	data.Direction = Vector(1,0,0)
	data.Attach_Start_Left = "mg_muzzle"
	data.Attach_Start_Right = "mg_muzzle"
	data.Type = 3

	simfphys.RegisterCrosshair( vehicle.pSeat[1] , { Attachment = "mg_muzzle", Type = 5 } )
	simfphys.RegisterCamera( vehicle.pSeat[1], Vector(-60,0,7), Vector(0,0,30), true, "mg_muzzle" )
	
	if not istable( vehicle.PassengerSeats ) or not istable( vehicle.pSeat ) then return end
	
end


function simfphys.weapon:AimMachinegun( ply, vehicle, pod )	
	if not IsValid( pod ) then return end

	local Aimang = pod:WorldToLocalAngles( ply:EyeAngles() )
	
	local AimRate = 80
	
	local Angles = vehicle:WorldToLocalAngles( Aimang + Angle(-2.3,0,0) )
	
	vehicle.sm_ppmg_yaw = vehicle.sm_ppmg_yaw and math.ApproachAngle( vehicle.sm_ppmg_yaw, Angles.y, AimRate * FrameTime() ) or 0
	vehicle.sm_ppmg_pitch = vehicle.sm_ppmg_pitch and math.ApproachAngle( vehicle.sm_ppmg_pitch, Angles.p, AimRate * FrameTime() ) or 0
	
	local TargetAng = Angle(vehicle.sm_ppmg_pitch,vehicle.sm_ppmg_yaw,0)
	TargetAng:Normalize() 
	
	vehicle.sm_pp_yaw = vehicle.sm_pp_yaw or 0
	
	vehicle:SetPoseParameter("mg_aim_yaw", TargetAng.y - vehicle.sm_pp_yaw )
	vehicle:SetPoseParameter("mg_aim_pitch", TargetAng.p )
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
	
	local ID = vehicle:LookupAttachment( "mg_muzzle" )
	local Attachment = vehicle:GetAttachment( ID )
	
	self:AimMachinegun( ply, vehicle, pod )	
	
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
    self.GunClip = self.GunClip or self.GunClipsize

	if not self:CanPrimaryAttack( vehicle ) then return end
	
	vehicle.wOldPos = vehicle.wOldPos or Vector(0,0,0)
	local deltapos = vehicle:GetPos() - vehicle.wOldPos
	vehicle.wOldPos = vehicle:GetPos()

	if vehicle.swapMuzzle then
		vehicle.swapMuzzle = false
	else
		vehicle.swapMuzzle = true
	end
	
	if self.GunClip <= 0 then
		self.GunClip = self.GunClipsize
		vehicle:EmitSound("weapons/ar2/npc_ar2_reload.wav")
		self:SetNextPrimaryFire( vehicle, CurTime() + 5 )
		return
	end

	self.GunClip = self.GunClip - 1
	
	local AttachmentID = vehicle.swapMuzzle and vehicle:LookupAttachment( "mg_muzzle" ) or vehicle:LookupAttachment( "mg_muzzle" )
	local Attachment = vehicle:GetAttachment( AttachmentID )
	
	local shootOrigin = Attachment.Pos + deltapos * engine.TickInterval()
	local shootDirection = Attachment.Ang:Forward()

	mg_fire( ply, vehicle, shootOrigin, shootDirection )
	
	self:SetNextPrimaryFire( vehicle, CurTime() + 0.2 )
end