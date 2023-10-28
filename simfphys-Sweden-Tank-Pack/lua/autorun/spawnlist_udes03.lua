local light_table = {
	L_HeadLampPos = Vector(-58,130,40),
	L_HeadLampAng = Angle(15,90,0),
	R_HeadLampPos = Vector(58,130,40),
	R_HeadLampAng = Angle(15,90,0),

	L_RearLampPos = Vector(-44.5,-114,48),
	L_RearLampAng = Angle(25,-90,0),
	R_RearLampPos = Vector(44.5,-114,48),
	R_RearLampAng = Angle(25,-90,0),	
}
list.Set( "simfphys_lights", "Udes", light_table)

local V = {
	Name = "Udes 03",
	Model = "models/wot/sweden/udes03/udes.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Истребители танков",
	SpawnOffset = Vector(0,0,30),
	SpawnAngleOffset = 90,

	Members = {
		Mass = 8000,
		AirFriction = 4,
		Inertia = Vector(14000,47000,48000),
		
		LightsTable = "Udes",

		
		OnSpawn = function(vehicle)

			vehicle.OldPassengers = {}
			
			function vehicle:CheckPlayer(ply,OldPly)
				if IsValid(ply) then
					ply:SetNoDraw(true)
					OldPly = ply
				else
					if OldPly != ply and IsValid(OldPly) then
						OldPly:SetNoDraw(false)
						OldPly = nil
					end
				end
				
				return OldPly
			end
		end,
		
		OnTick = function(vehicle)
			if vehicle.CheckPlayer then
				vehicle.OldDriver = vehicle:CheckPlayer(vehicle:GetDriver(),vehicle.OldDriver)
				
				if vehicle.pSeat then
					for k,v in pairs(vehicle.pSeat) do
						vehicle.OldPassengers[k] = vehicle:CheckPlayer(v:GetDriver(),vehicle.OldPassengers[k])
					end
				end
			end
		end,
		
		ApplyDamage = function( ent, damage, type ) 
			simfphys.TankApplyDamage(ent, damage, type)
		end,
		
		OnDestroyed =
			function(ent)
				if IsValid( ent.Gib ) then
					ent.Gib:PhysicsInit(6)
					ent.Gib:SetCollisionGroup(0)
					local pitch2 = ent.sm_ppb_pitch or 0
					local pitch = ent.sm_pp_pitch or 0
					ent.Gib:SetPoseParameter("body_aim_pitch", -pitch2 )
					ent.Gib:SetPoseParameter("cannon_aim_pitch", -pitch )
				end
			end,
		
		MaxHealth = 9000,
		
		OnSpawn = 
		function(ent) 
			ent:SetSkin(math.random(0,6))
		end,
		
		IsArmored = true,
		
		NoWheelGibs = true,
		
		FirstPersonViewPos = Vector(0,-50,50),
		
		FrontWheelRadius = 28,
		RearWheelRadius = 28,
		
		EnginePos = Vector(30,-70,60),
		
		CustomWheels = true,
		CustomSuspensionTravel = 20,
		
		CustomWheelModel = "models/props_c17/canisterchunk01g.mdl",
		
		CustomWheelPosFL = Vector(-60,74,27),
		CustomWheelPosFR = Vector(60,74,27),
		CustomWheelPosML = Vector(-60,0,27),
		CustomWheelPosMR = Vector(60,0,27),
		CustomWheelPosRL = Vector(-60,-66,27),
		CustomWheelPosRR = Vector(60,-66,27),
		CustomWheelAngleOffset = Angle(0,0,90),
		
		CustomMassCenter = Vector(0,0,4),
		
		CustomSteerAngle = 60,
		
		SeatOffset = Vector(-10,-30,50),
		SeatPitch = -15,
		SeatYaw = 0,
		
		ModelInfo = {
			WheelColor = Color(0,0,0,0),
		},
		
		PassengerSeats = {
			{
				pos = Vector(-30,-40,20),
				ang = Angle(0,0,40)
			},
		},
		
		FrontHeight = 15,
		FrontConstant = 40000,
		FrontDamping = 40000,
		FrontRelativeDamping = 40000,

		RearHeight = 15,
		RearConstant = 40000,
		RearDamping = 40000,
		RearRelativeDamping = 40000,

		FastSteeringAngle = 20,
		SteeringFadeFastSpeed = 400,
		
		TurnSpeed = 4,
		
		MaxGrip = 800,
		Efficiency = 1,
		GripOffset = -300,
		BrakePower = 80,
		BulletProofTires = true,
		
		IdleRPM = 500,
		LimitRPM = 4000,
		PeakTorque = 120,
		PowerbandStart = 500,
		PowerbandEnd = 5200,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = true,
		
		FuelFillPos = Vector(65,-146,71),
		FuelType = FUELTYPE_DIESEL,
		FuelTankSize = 250,
		
		PowerBias = -0.3,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/t90ms/idle.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/t90ms/low.wav",
		Sound_MidPitch = 1.7,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 100,
		Sound_MidFadeOutRate = 1,
		
		Sound_High = "simulated_vehicles/t90ms/high.wav",
		Sound_HighPitch = 1.7,
		Sound_HighVolume = 0.7,
		Sound_HighFadeInRPMpercent = 50,
		Sound_HighFadeInRate = 0.2,
		
		Sound_Throttle = "",
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "common/null.wav",
		ForceTransmission = 1,
		
		DifferentialGear = 0.3,
		Gears = {-0.13,0,0.05,0.08,0.11,0.14,0.16}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_tank_udes03", V )
