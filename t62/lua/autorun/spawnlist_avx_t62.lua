local V = {
	Name = "Т-62",
	Model = "models/avx/t62.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Тяжелая бронетехника",
	SpawnOffset = Vector(0,0,60),
	SpawnAngleOffset = 0,

	Members = {
		Mass = 24000,
		AirFriction = 0,
		Inertia = Vector(20000,80000,100000),

		OnSpawn = function(ent)
			ent.OnTakeDamage = AVX.TankTakeDamage
			ent:SetNWBool( "simfphys_NoRacingHud", true )
			ent:SetSkin(math.random(0,1))
		end,

		OnDestroyed =
			function(ent)
				if IsValid( ent.Gib ) then
					local yaw = ent.sm_pp_yaw or 0
					local pitch = ent.sm_pp_pitch or 0
					ent.Gib:SetPoseParameter("cannon_aim_yaw", -yaw )
					ent.Gib:SetPoseParameter("cannon_aim_pitch", -pitch )
				end
			end,

		MaxHealth = 9200,

		IsArmored = true,

		NoWheelGibs = true,

		FirstPersonViewPos = Vector(0,-50,15),

		FrontWheelRadius = 45,
		RearWheelRadius = 55,
		
		EnginePos = Vector(130,0.69,66),
		
		CustomWheels = true,
		CustomSuspensionTravel = 15,
		
		CustomWheelModel = "models/props_c17/canisterchunk01g.mdl",
		
		CustomWheelPosRL = Vector(120,65,40),
		CustomWheelPosRR = Vector(120,-58,40),
		CustomWheelPosML = Vector(5,65,35),
		CustomWheelPosMR = Vector(5,-58,35),
		CustomWheelPosFL = Vector(-130,65,35),
		CustomWheelPosFR = Vector(-130,-58,35),
		CustomWheelAngleOffset = Angle(0,0,-90),
		
		CustomMassCenter = Vector(0,0,0),
		
		CustomSteerAngle = 60,
		
		SeatOffset = Vector(0,0,55),
		SeatPitch = 0,
		SeatYaw = 90,
		
		ModelInfo = {
			WheelColor = Color(0,0,0,0),
		},
		
		FrontHeight = 1,
		FrontConstant = 50000,
		FrontDamping = 30000,
		FrontRelativeDamping = 300000,

		RearHeight = 1,
		RearConstant = 50000,
		RearDamping = 20000,
		RearRelativeDamping = 20000,

		FastSteeringAngle = 20,
		SteeringFadeFastSpeed = 300,

		TurnSpeed = 3,

		MaxGrip = 3000,
		Efficiency = 1,
		GripOffset = -500,
		BrakePower = 400,
		BulletProofTires = true,

		IdleRPM = 800,
		LimitRPM = 3000,
		PeakTorque = 300,
		PowerbandStart = 600,
		PowerbandEnd = 2600,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = true,

		FuelFillPos = Vector(139.42,-3.68,38.38),
		FuelType = FUELTYPE_DIESEL,
		FuelTankSize = 220,
		
		PowerBias = -0.3,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/t90ms/idle.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/t90ms/low.wav",
		Sound_MidPitch = 1.5,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 100,
		Sound_MidFadeOutRate = 1,
		
		Sound_High = "simulated_vehicles/t90ms/high.wav",
		Sound_HighPitch = 1.5,
		Sound_HighVolume = 0.7,
		Sound_HighFadeInRPMpercent = 50,
		Sound_HighFadeInRate = 0.2,
		
		Sound_Throttle = "",
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "common/null.wav",
		ForceTransmission = 1,
		
		DifferentialGear = 0.4,
		Gears = {-0.03,0,0.03,0.06,0.08}
	}
}
list.Set( "simfphys_vehicles", "avx_t62", V )