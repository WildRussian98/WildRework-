local V = {
	Name = "INS2 AAVP-7A1",
	Model = "models/avx/amtrac.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Средняя бронетехника",
	SpawnOffset = Vector(0,0,60),
	SpawnAngleOffset = 0,

	Members = {
		Mass = 10000,
		AirFriction = 0,
		Inertia = Vector(80000,20000,100000),

		OnSpawn = function(ent)
			ent.OnTakeDamage = AVX.TankTakeDamage
			ent:SetNWBool( "simfphys_NoRacingHud", true )
			ent:SetSkin(math.random(0,3))
		end,

		OnDestroyed =
			function(ent)
				if IsValid( ent.Gib ) then
					local yaw = ent.sm_pp_yaw or 0
					local pitch = ent.sm_pp_pitch or 0
					ent.Gib:SetPoseParameter("turret_yaw", yaw )
					ent.Gib:SetPoseParameter("turret_pitch", pitch )
				end
			end,

		MaxHealth = 8500,

		IsArmored = true,

		NoWheelGibs = true,

		FirstPersonViewPos = Vector(0,-50,15),

		FrontWheelRadius = 40,
		RearWheelRadius = 45,
		
		EnginePos = Vector(-168,15,106),
		
		CustomWheels = true,
		CustomSuspensionTravel = 5,
		
		CustomWheelModel = "models/props_junk/PopCan01a.mdl",
		
		CustomWheelPosRL = Vector(120,65,50),
		CustomWheelPosRR = Vector(120,-58,50),
		CustomWheelPosML = Vector(5,65,45),
		CustomWheelPosMR = Vector(5,-58,45),
		CustomWheelPosFL = Vector(-150,65,45),
		CustomWheelPosFR = Vector(-150,-58,45),
		CustomWheelAngleOffset = Angle(0,0,90),
		
		CustomMassCenter = Vector(0,0,5),
		
		CustomSteerAngle = 60,
		
		SeatOffset = Vector(0,0,55),
		SeatPitch = 0,
		SeatYaw = 90,
		
		ModelInfo = {
			WheelColor = Color(0,0,0,0),
		},

		PassengerSeats = {
			{
				pos = Vector(0,0,50),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(0,0,50),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(0,0,50),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(0,0,50),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(0,0,50),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(0,0,50),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(0,0,50),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(0,0,50),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(0,0,50),
				ang = Angle(0,-90,0)
			}
		},
		
		FrontHeight = 26,
		FrontConstant = 50000,
		FrontDamping = 30000,
		FrontRelativeDamping = 300000,
		
		RearHeight = 26,
		RearConstant = 50000,
		RearDamping = 30000,
		RearRelativeDamping = 30000,
		
		FastSteeringAngle = 14,
		SteeringFadeFastSpeed = 400,
		
		TurnSpeed = 5,
		
		MaxGrip = 800,
		Efficiency = 1,
		GripOffset = -300,
		BrakePower = 100,
		BulletProofTires = true,
		
		IdleRPM = 700,
		LimitRPM = 3800,
		PeakTorque = 130,
		PowerbandStart = 700,
		PowerbandEnd = 4800,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = true,
		DoNotStall = true,
		
		FuelFillPos = Vector(-111.88,-0.14,59.15),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 160,

		PowerBias = -0.3,

		EngineSoundPreset = 0,

		Sound_Idle = "simulated_vehicles/misc/nanjing_loop.wav",
		Sound_IdlePitch = 1,

		Sound_Mid = "simulated_vehicles/sherman/low.wav",
		Sound_MidPitch = 1,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 58,
		Sound_MidFadeOutRate = 0.476,

		Sound_High = "simulated_vehicles/sherman/high.wav",
		Sound_HighPitch = 0.75,
		Sound_HighVolume = 0.75,
		Sound_HighFadeInRPMpercent = 40,
		Sound_HighFadeInRate = 0.19,
		
		Sound_Throttle = "",
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "common/null.wav",
		
		ForceTransmission = 1,
		
		DifferentialGear = 0.3,
		Gears = {-0.082,0,0.08,0.1,0.12,0.14}
	}
}
list.Set( "simfphys_vehicles", "avx_amtrac", V )