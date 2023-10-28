local m5a2_susdata = {}
for i = 1,6 do
	m5a2_susdata[i] = { 
		attachment = "sus_left_attach_"..i,
		poseparameter = "suspension_left_"..i,
	}
	
	local ir = i + 6
	
	m5a2_susdata[ir] = { 
		attachment = "sus_right_attach_"..i,
		poseparameter = "suspension_right_"..i,
	}
end

simfphys.weapon.M240Clipsize = 200

local function hmg_fire(ply,vehicle,shootOrigin,shootDirection)

	vehicle:EmitSound("tiger_fire_mg")
	
	local projectile = {}
		projectile.filter = vehicle.VehicleData["filter"]
		projectile.shootOrigin = shootOrigin
		projectile.shootDirection = shootDirection
		projectile.attacker = ply
		projectile.Tracer	= 1
		projectile.HullSize = 6
		projectile.attackingent = vehicle
		projectile.Spread = Vector(0.005,0.005,0.005)
		projectile.Damage = 15
		projectile.Force = 12
	
	simfphys.FireHitScan( projectile )
end

local function mg_fire(ply,vehicle,shootOrigin,shootDirection)
vehicle:EmitSound("tiger_fire_mg")

	local projectile = {}
		projectile.filter = vehicle.VehicleData["filter"]
		projectile.shootOrigin = shootOrigin
		projectile.shootDirection = shootDirection
		projectile.attacker = ply
		projectile.Tracer	= 1
		projectile.HullSize = 5
		projectile.attackingent = vehicle
		projectile.Spread = Vector(0.008,0.008,0.008)
		projectile.Damage = 15
		projectile.Force = 12
	
	simfphys.FireHitScan( projectile )
end

local function cannon_fire(ply,vehicle,shootOrigin,shootDirection)
	vehicle:EmitSound("simulated_vehicles/weapons/leopard_cannon.ogg")
	
	timer.Simple( 6.5, function() 
		if IsValid( vehicle ) then 
			vehicle:EmitSound("simulated_vehicles/weapons/leopard_ready.wav")
		end
	end)
	
	local effectdata = EffectData()
		effectdata:SetEntity( vehicle )
	util.Effect( "simfphys_leopard_muzzle", effectdata )

	vehicle:GetPhysicsObject():ApplyForceOffset( -shootDirection * 600000, shootOrigin ) 
	
	local projectile = {}
		projectile.filter = vehicle.VehicleData["filter"]
		projectile.shootOrigin = shootOrigin
		projectile.shootDirection = shootDirection
		projectile.attacker = ply
		projectile.attackingent = vehicle
		projectile.Damage = 5000
		projectile.Force = 8000
		projectile.Size = 23
		projectile.DeflectAng = 1
		projectile.BlastRadius = 700
		projectile.BlastDamage = 2800
		projectile.MuzzleVelocity = 65
		projectile.BlastEffect = "simfphys_tac_explosion"
	
	AVX.FirePhysProjectile( projectile )
end

function simfphys.weapon:ValidClasses()
	return { "sim_fphys_m5" }
end

function simfphys.weapon:Initialize( vehicle )
	net.Start( "avx_misc_register_tank" )
		net.WriteEntity( vehicle )
		net.WriteString( "m5a2" )
	net.Broadcast()
	
	vehicle:SetNWBool( "SpecialCam_Loader", true )
	vehicle:SetNWFloat( "SpecialCam_LoaderTime", 7 )
	
	local data = {}
	vehicle.pSeat[1]:SetParent(vehicle,vehicle:LookupAttachment("com"))

	simfphys.RegisterCrosshair( vehicle:GetDriverSeat(), { Attachment = "cannon_muzzle", Type = 2 } )
	simfphys.RegisterCamera( vehicle:GetDriverSeat(), Vector(-30,22,5), Vector(-10,60,120), true, "mg_muzzle" )
	
	simfphys.RegisterCrosshair( vehicle.pSeat[1] , { Attachment = "muzzle", Type = 1 } )
	simfphys.RegisterCamera( vehicle.pSeat[1], Vector(-70,0,10), Vector(0,0,60), true, "muzzle" )
	
	if not istable( vehicle.PassengerSeats ) or not istable( vehicle.pSeat ) then return end
	
	simfphys.RegisterCamera( vehicle.pSeat[2], Vector(88,27,45), Vector(0,60,120), true, "mg_muzzle" )
	
	timer.Simple( 1, function()
		if not IsValid( vehicle ) then return end
		if not vehicle.VehicleData["filter"] then print("[simfphys Armed Vehicle Pack] ERROR:TRACE FILTER IS INVALID. PLEASE UPDATE SIMFPHYS BASE") return end
		
		vehicle.WheelOnGround = function( ent )
			ent.FrontWheelPowered = ent:GetPowerDistribution() ~= 1
			ent.RearWheelPowered = ent:GetPowerDistribution() ~= -1
			
			for i = 1, table.Count( ent.Wheels ) do
				local Wheel = ent.Wheels[i]		
				if IsValid( Wheel ) then
					local dmgMul = Wheel:GetDamaged() and 0.5 or 1
					local surfacemul = simfphys.TractionData[Wheel:GetSurfaceMaterial():lower()]
					
					ent.VehicleData[ "SurfaceMul_" .. i ] = (surfacemul and math.max(surfacemul,0.001) or 1) * dmgMul
					
					local WheelPos = ent:LogicWheelPos( i )
					
					local WheelRadius = WheelPos.IsFrontWheel and ent.FrontWheelRadius or ent.RearWheelRadius
					local startpos = Wheel:GetPos()
					local dir = -ent.Up
					local len = WheelRadius + math.Clamp(-ent.Vel.z / 50,2.5,6)
					local HullSize = Vector(WheelRadius,WheelRadius,0)
					local tr = util.TraceHull( {
						start = startpos,
						endpos = startpos + dir * len,
						maxs = HullSize,
						mins = -HullSize,
						filter = ent.VehicleData["filter"]
					} )
					
					local onground = self:IsOnGround( vehicle ) and 1 or 0
					Wheel:SetOnGround( onground )
					ent.VehicleData[ "onGround_" .. i ] = onground
					
					if tr.Hit then
						Wheel:SetSpeed( Wheel.FX )
						Wheel:SetSkidSound( Wheel.skid )
						Wheel:SetSurfaceMaterial( util.GetSurfacePropName( tr.SurfaceProps ) )
					end
				end
			end
			
			local FrontOnGround = math.max(ent.VehicleData[ "onGround_1" ],ent.VehicleData[ "onGround_2" ])
			local RearOnGround = math.max(ent.VehicleData[ "onGround_3" ],ent.VehicleData[ "onGround_4" ])
			
			ent.DriveWheelsOnGround = math.max(ent.FrontWheelPowered and FrontOnGround or 0,ent.RearWheelPowered and RearOnGround or 0)
		end
	end)
end

function simfphys.weapon:GetForwardSpeed( vehicle )
	return vehicle.ForwardSpeed
end

function simfphys.weapon:IsOnGround( vehicle )
	return (vehicle.susOnGround == true)
end

function simfphys.weapon:AimMachinegun( ply, vehicle, pod )	
	if not IsValid( pod ) then return end

	local Aimang = pod:WorldToLocalAngles( ply:EyeAngles() )
	
	local AimRate = 15
	
	local Angles = vehicle:WorldToLocalAngles( Aimang + Angle(-2.3,-90,0) )
	
	vehicle.sm_ppmg_yaw = vehicle.sm_ppmg_yaw and math.Clamp(math.ApproachAngle( vehicle.sm_ppmg_yaw, Angles.y - 180 - vehicle.sm_pp_yaw + 180, 150 * FrameTime() ), -45, 45) or 0
	vehicle.sm_ppmg_pitch = vehicle.sm_ppmg_pitch and math.ApproachAngle( vehicle.sm_ppmg_pitch, Angles.p, AimRate * FrameTime() ) or 0
	
	local TargetAng = Angle(vehicle.sm_ppmg_pitch,vehicle.sm_ppmg_yaw,0)
	TargetAng:Normalize() 
	
	vehicle.sm_pp_yaw = vehicle.sm_pp_yaw or 0
	
	vehicle:SetPoseParameter("mg_aim_yaw", -vehicle.sm_ppmg_yaw )
	vehicle:SetPoseParameter("mg_aim_pitch", -TargetAng.p )
end

function simfphys.weapon:AimCannon( ply, vehicle, pod, Attachment )	
	if not IsValid( pod ) then return end

	local Aimang = pod:WorldToLocalAngles( ply:EyeAngles() )
	Aimang:Normalize()
	
	local AimRate = 7
	
	local Angles = vehicle:WorldToLocalAngles( Aimang + Angle(-2.2,-90,0) )
	
	vehicle.sm_pp_yaw = vehicle.sm_pp_yaw and math.ApproachAngle( vehicle.sm_pp_yaw, Angles.y, AimRate * FrameTime() ) or 0
	vehicle.sm_pp_pitch = vehicle.sm_pp_pitch and math.ApproachAngle( vehicle.sm_pp_pitch, Angles.p, AimRate * FrameTime() ) or 0
	
	local TargetAng = Angle(vehicle.sm_pp_pitch,vehicle.sm_pp_yaw,0)
	TargetAng:Normalize() 

	vehicle:SetPoseParameter("cannon_aim_yaw", TargetAng.y )
	
	local pclamp = math.Clamp( (math.cos( math.rad(TargetAng.y + 180) ) - 0.465) * 3,0,1) ^ 2 * 6
	vehicle:SetPoseParameter("cannon_aim_pitch", math.Clamp(-TargetAng.p,-7 + pclamp,38) )
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
	
	local ID = vehicle:LookupAttachment( "cannon_muzzle" )
	local Attachment = vehicle:GetAttachment( ID )
	
	self:AimCannon( ply, vehicle, pod, Attachment )
	
	local DeltaP = deltapos * engine.TickInterval()
	
	local fire = ply:KeyDown( IN_ATTACK )
	local fire2 = ply:KeyDown( IN_ATTACK2 )
	
	if fire then
		self:PrimaryAttack( vehicle, ply, Attachment.Pos + DeltaP, Attachment )
	end
	

end

function simfphys.weapon:ControlMachinegun( vehicle, deltapos )

	if not istable( vehicle.PassengerSeats ) or not istable( vehicle.pSeat ) then return end
	
	local pod = vehicle.pSeat[1]
	
	if not IsValid( pod ) then return end
	
	local ply = pod:GetDriver()
	
	if not IsValid( ply ) then return end
	
	self:AimMachinegun( ply, vehicle, pod )
	
	local ID = vehicle:LookupAttachment( "muzzle" )
	local Attachment = vehicle:GetAttachment( ID )

	local shootOrigin = Attachment.Pos + deltapos * engine.TickInterval()
	
	local fire = ply:KeyDown( IN_ATTACK )
	
	if fire then
		self:Attack( vehicle, ply, shootOrigin, Attachment, ID )
	end
end

function simfphys.weapon:Attack( vehicle, ply, shootOrigin, Attachment, ID )

	self.M240Clip = self.M240Clip or self.M240Clipsize
	
	if not self:CanAttack( vehicle ) then return end

	if self.M240Clip <= 0 then
		self.M240Clip = self.M240Clipsize
		vehicle:EmitSound("weapons/ar2/npc_ar2_reload.wav")
		self:SetNextFire( vehicle, CurTime() + 7 )
		return
	end

	self.M240Clip = self.M240Clip - 1
	
	local shootDirection = Attachment.Ang:Forward()
	
	hmg_fire( ply, vehicle, shootOrigin, shootDirection )
	
	self:SetNextFire( vehicle, CurTime() + 0.1 )
end

function simfphys.weapon:CanAttack( vehicle )
	vehicle.NextShoot3 = vehicle.NextShoot3 or 0
	return vehicle.NextShoot3 < CurTime()
end

function simfphys.weapon:SetNextFire( vehicle, time )
	vehicle.NextShoot3 = time
end


function simfphys.weapon:PrimaryAttack( vehicle, ply, shootOrigin, Attachment )
	if not self:CanPrimaryAttack( vehicle ) then return end
	
	local shootDirection = Attachment.Ang:Forward()
	
	vehicle:PlayAnimation( "fire" )
	cannon_fire( ply, vehicle, shootOrigin + shootDirection * 80, shootDirection )
	
	self:SetNextPrimaryFire( vehicle, CurTime() + 7 )
end

function simfphys.weapon:CanPrimaryAttack( vehicle )
	vehicle.NextShoot = vehicle.NextShoot or 0
	return vehicle.NextShoot < CurTime()
end

function simfphys.weapon:SetNextPrimaryFire( vehicle, time )
	vehicle.NextShoot = time
	
	vehicle:SetNWFloat( "SpecialCam_LoaderNext", time )
end

function simfphys.weapon:SecondaryAttack( vehicle, ply, deltapos, cPos, cAng )

	self.M240Clip = self.M240Clip or self.M240Clipsize
	
	if not self:CanSecondaryAttack( vehicle ) then return end
	
	if self.M240Clip <= 0 then
		self.M240Clip = self.M240Clipsize
		vehicle:EmitSound("weapons/ar2/npc_ar2_reload.wav")
		self:SetNextSecondaryFire( vehicle, CurTime() + 10 )
		return
	end

	self.M240Clip = self.M240Clip - 1
	
	local ID = vehicle:LookupAttachment( "mg_muzzle" )
	local Attachment = vehicle:GetAttachment( ID )

	local trace = util.TraceLine( {
		start = cPos,
		endpos = cPos + cAng:Forward() * 50000,
		filter = vehicle.VehicleData["filter"]
	} )
	
	mg_fire( ply, vehicle, Attachment.Pos, (trace.HitPos - Attachment.Pos):GetNormalized() )
	
	self:SetNextSecondaryFire( vehicle, CurTime() + 0.09 )
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

function simfphys.weapon:ControlTrackSounds( vehicle, wheelslocked ) 
	local speed = math.abs( self:GetForwardSpeed( vehicle ) )
	local fastenuf = speed > 20 and not wheelslocked and self:IsOnGround( vehicle )
	
	if fastenuf ~= vehicle.fastenuf then
		vehicle.fastenuf = fastenuf
		
		if fastenuf then
			vehicle.track_snd = CreateSound( vehicle, "simulated_vehicles/sherman/tracks.wav" )
			vehicle.track_snd:PlayEx(0,0)
			vehicle:CallOnRemove( "stopmesounds", function( vehicle )
				if vehicle.track_snd then
					vehicle.track_snd:Stop()
				end
			end)
		else
			if vehicle.track_snd then
				vehicle.track_snd:Stop()
				vehicle.track_snd = nil
			end
		end
	end
	
	if vehicle.track_snd then
		vehicle.track_snd:ChangePitch( math.Clamp(70 + speed / 40,0,150) ) 
		vehicle.track_snd:ChangeVolume( math.min( math.max(speed - 20,0) / 200,1) ) 
	end
end

function simfphys.weapon:Think( vehicle )
	if not IsValid( vehicle ) or not vehicle:IsInitialized() then return end
	
	vehicle.wOldPos = vehicle.wOldPos or Vector(0,0,0)
	local deltapos = vehicle:GetPos() - vehicle.wOldPos
	vehicle.wOldPos = vehicle:GetPos()
	
	local handbrake = vehicle:GetHandBrakeEnabled()

	self:UpdateSuspension( vehicle )
	self:DoWheelSpin( vehicle )
	self:ControlTurret( vehicle, deltapos )
	self:ControlMachinegun( vehicle, deltapos )
	self:ControlTrackSounds( vehicle, handbrake )
	self:ModPhysics( vehicle, handbrake )
	local trackss
	local gear = vehicle:GetGear()
    local mass = vehicle:GetPhysicsObject():GetMass()
    local TrackTurnRate = 30
    local TrackMultRate = 60
    local AntiFrictionRate = 0.1
    trackss= CreateSound( vehicle, "simulated_vehicles/sherman/tracks.wav")
	if vehicle:EngineActive() and gear == 2 and vehicle.PressedKeys["A"] == true and vehicle.susOnGround == true then
        if vehicle:GetPhysicsObject():GetAngleVelocity().z <= TrackTurnRate then
            vehicle:GetPhysicsObject():ApplyTorqueCenter( Vector(0,0, mass * TrackMultRate ))
            vehicle:GetPhysicsObject():ApplyForceCenter( Vector( 0,0, mass * AntiFrictionRate ))
			trackss:Play()
			trackss:ChangePitch( math.Clamp(50+TrackTurnRate / 80,0,150) ) 
			trackss:ChangeVolume( math.min( math.max(222 - 20,0) / 600,1) ) 
			vehicle:CallOnRemove( "stopmesounds", function( vehicle )
				if trackss then
					trackss:Stop()
				end
			end)
        end
    elseif vehicle:EngineActive() and gear == 2 and vehicle.PressedKeys["A"] == false and vehicle.susOnGround == false then
		trackss:Stop()
    end
    if vehicle:EngineActive() and gear == 2 and vehicle.PressedKeys["D"] == true and vehicle.susOnGround == true then
        if math.abs(vehicle:GetPhysicsObject():GetAngleVelocity().z) <= TrackTurnRate then
            vehicle:GetPhysicsObject():ApplyTorqueCenter( Vector(0,0, -mass * TrackMultRate  ))
            vehicle:GetPhysicsObject():ApplyForceCenter( Vector( 0,0, mass * AntiFrictionRate ))
			trackss:Play()
			trackss:ChangePitch( math.Clamp(50+TrackTurnRate / 80,0,150) ) 
			trackss:ChangeVolume( math.min( math.max(222 - 20,0) / 600,1) ) 
			vehicle:CallOnRemove( "stopmesounds", function( vehicle )
				if trackss then
					trackss:Stop()
				end
			end)
        end
    elseif vehicle:EngineActive() and gear == 2 and vehicle.PressedKeys["D"] == false and vehicle.susOnGround == false then
		trackss:Stop()
	end	
end

function simfphys.weapon:UpdateSuspension( vehicle )
	if not vehicle.filterEntities then
		vehicle.filterEntities = player.GetAll()
		table.insert(vehicle.filterEntities, vehicle)
		
		for i, wheel in pairs( ents.FindByClass( "gmod_sent_vehicle_fphysics_wheel" ) ) do
			table.insert(vehicle.filterEntities, wheel)
		end
	end
	
	vehicle.oldDist = istable( vehicle.oldDist ) and vehicle.oldDist or {}
	
	vehicle.susOnGround = false
	local Up = vehicle:GetUp()
	
	for i, v in pairs( m5a2_susdata ) do
		local pos = vehicle:GetAttachment( vehicle:LookupAttachment( m5a2_susdata[i].attachment ) ).Pos + Up * -4
		
		local trace = util.TraceHull( {
			start = pos,
			endpos = pos + Up * - 100,
			maxs = Vector(10,10,0),
			mins = -Vector(10,10,0),
			filter = vehicle.filterEntities,
		} )
		local Dist = (pos - trace.HitPos):Length() - 38
		
		if trace.Hit then
			vehicle.susOnGround = true
		end
		
		vehicle.oldDist[i] = vehicle.oldDist[i] and (vehicle.oldDist[i] + math.Clamp(Dist - vehicle.oldDist[i],-5,1)) or 0
		
		vehicle:SetPoseParameter(m5a2_susdata[i].poseparameter, vehicle.oldDist[i] )
	end
end

function simfphys.weapon:DoWheelSpin( vehicle )
	local spin_r = (vehicle.VehicleData[ "spin_4" ] + vehicle.VehicleData[ "spin_6" ])
	local spin_l = (vehicle.VehicleData[ "spin_3" ] + vehicle.VehicleData[ "spin_5" ])
	
	net.Start( "simfphys_update_tracks", true )
		net.WriteEntity( vehicle )
		net.WriteFloat( spin_r ) 
		net.WriteFloat( spin_l ) 
	net.Broadcast()
	
	vehicle:SetPoseParameter("spin_wheels_right", spin_r)
	vehicle:SetPoseParameter("spin_wheels_left", spin_l )
end