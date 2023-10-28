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
		"simphys_BRDM2"
	}
	
	return classes
end

function simfphys.weapon:Initialize( vehicle )
	local data = {}
	data.Attachment = "muzzle_left"
	data.Direction = Vector(1,0,0)
	data.Attach_Start_Left = "muzzle_left"
	data.Attach_Start_Right = "muzzle_right"
	data.Type = 4

	--simfphys.RegisterCrosshair( vehicle.pSeat[1], data )
	--simfphys.RegisterCamera( vehicle.pSeat[1], Vector(-13,0,50), Vector(-13,0,50), true )
	
	simfphys.RegisterCrosshair( vehicle:GetDriverSeat(), data )
	simfphys.RegisterCamera(  vehicle:GetDriverSeat(), Vector(0,52,45), Vector(10,100,60), true, "muzzle_cannon" )
	
	if not istable( vehicle.PassengerSeats ) or not istable( vehicle.pSeat ) then return end
	
	
	simfphys.RegisterCamera( vehicle.pSeat[1],Vector(-13,0,50), Vector(-13,0,50), true )
	simfphys.RegisterCamera( vehicle.pSeat[2],Vector(-13,0,50), Vector(-13,0,50), true )
	simfphys.RegisterCamera( vehicle.pSeat[3],Vector(-13,0,50), Vector(-13,0,50), true )
	simfphys.RegisterCamera( vehicle.pSeat[4],Vector(-13,0,50), Vector(-13,0,50), true )
	
	for i = 3, table.Count( vehicle.pSeat ) do
		simfphys.RegisterCamera( vehicle.pSeat[ i ], Vector(0,0,60), Vector(0,0,60) )
	end
end


function simfphys.weapon:AimWeapon( ply, vehicle, pod )	
	if not IsValid( pod ) then return end

	local ID = vehicle:LookupAttachment( "muzzle_right" )
	local Attachment = vehicle:GetAttachment( ID )
	
 
	local Aimang = pod:WorldToLocalAngles( ply:EyeAngles() )
	
	
	local Angles = vehicle:WorldToLocalAngles( Aimang )
	Angles:Normalize()
	
	//
	local safemode = ply:KeyDown( IN_WALK )

	if vehicle.ButtonSafeMode ~= safemode then
		vehicle.ButtonSafeMode = safemode
		
		if safemode then
			vehicle:SetNWBool( "TurretSafeMode", not vehicle:GetNWBool( "TurretSafeMode", true ) )
		end
	end
	
	if vehicle:GetNWBool( "TurretSafeMode", true ) then return end
	//
	
	vehicle.sm_dir  = vehicle.sm_dir or Vector(0,0,0)
	
	local L_Right = Angle(0,Aimang.y,0):Right()
	local La_Right = Angle(0,Attachment.Ang.y,0):Forward()
	local AimRate = 40  -- 100  -- 50
	local Yaw_Diff = math.Clamp( math.acos( math.Clamp( L_Right:Dot( La_Right ) ,-1,1) ) * (180 / math.pi) - 90,-AimRate,AimRate )
	
	local TargetPitch = Angles.p
	local TargetYaw = vehicle.sm_dir:Angle().y - Yaw_Diff
	
	vehicle.sm_dir = vehicle.sm_dir + (Angle(0,TargetYaw,0):Forward() - vehicle.sm_dir) * 0.05
	vehicle.sm_pitch = vehicle.sm_pitch and (vehicle.sm_pitch + (TargetPitch - vehicle.sm_pitch) * 0.05) or 0
	
	vehicle:SetPoseParameter("turret_yaw", vehicle.sm_dir:Angle().y )
	vehicle:SetPoseParameter("turret_pitch", -vehicle.sm_pitch )
	
	
	
end


function simfphys.weapon:Think( vehicle )
	local pod = vehicle:GetDriverSeat()
	--local pod = vehicle.pSeat[1]
	
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

function simfphys.weapon:CanSecondaryAttack( vehicle )
	vehicle.NextShoot2 = vehicle.NextShoot2 or 0
	return vehicle.NextShoot2 < CurTime()
end --

function simfphys.weapon:SetNextSecondaryFire( vehicle, time )
	vehicle.NextShoot2 = time
end --


function simfphys.weapon:PrimaryAttack( vehicle, ply )

   ///
   if not self:CanSecondaryAttack( vehicle ) then return end

	if not self:CanPrimaryAttack( vehicle ) then return end
	
	vehicle.wOldPos = vehicle.wOldPos or Vector(0,0,0)
	local deltapos = vehicle:GetPos() - vehicle.wOldPos
	vehicle.wOldPos = vehicle:GetPos()

	if vehicle.swapMuzzle then
		vehicle.swapMuzzle = false
	else
		vehicle.swapMuzzle = true
	end
	
	local AttachmentID = vehicle.swapMuzzle and vehicle:LookupAttachment( "muzzle_left" ) or vehicle:LookupAttachment( "muzzle_left" )
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
	
	self:SetNextPrimaryFire( vehicle, CurTime() + 0.12 )  -- 0.2 -- 0.12 ) (60/600) 
end
