local Category = "Автомобили"

AddCSLuaFile()


local V = {
	Name = "РАФ-2203 Пассажирский",
	Model = "models/raf2203Sit(E34D-FSD2-FN2J).mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = Category,
	SpawnOffset = Vector(0,0,35),

	Members = {
		Mass = 1400,
		EnginePos = Vector(90,0,10),
		LightsTable = "raf2203(E34D-FSD2-FN2J)",
		
		CustomWheels = true,
		CustomSuspensionTravel = 15,
		
		CustomWheelModel = "models/raf2203w(E34D-FSD2-FN2J).mdl",
		CustomWheelPosFL = Vector(38,41,-34),
		CustomWheelPosFR = Vector(38,-41,-34),
		CustomWheelPosRL = Vector(-80,41,-34),	
		CustomWheelPosRR = Vector(-80,-41,-34),
		CustomWheelAngleOffset = Angle(0,0,0),
		
		CustomMassCenter = Vector(2,0,-1),
		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(34,-25,13),
		SeatPitch = -2,
		SeatYaw = 90,
		
		PassengerSeats = {
			{
				pos = Vector(46,-24,-16),
				ang = Angle(0,-90,20)
			},
			{
				pos = Vector(-7.5,28,-18),
				ang = Angle(0,90,20)
			},
			{
				pos = Vector(-7.5,4,-18),
				ang = Angle(0,90,20)
			},
			{
				pos = Vector(-36.5,28,-18),
				ang = Angle(0,-90,20)
			},
			{
				pos = Vector(-36.5,4,-18),
				ang = Angle(0,-90,20)
			},
			{
				pos = Vector(-75.5,28,-18),
				ang = Angle(0,-90,20)
			},
			{
				pos = Vector(-75.5,0,-18),
				ang = Angle(0,-90,20)
			},
			{
				pos = Vector(-75.5,-26,-18),
				ang = Angle(0,-90,20)
			}
		},
		ExhaustPositions = {
			{
				pos = Vector(-126,-22.5,-30.5),
				ang = Angle(120,165,0)
			},
		},
		
		FrontHeight = 8.5,
		FrontConstant = 25000,
		FrontDamping = 2500,
		FrontRelativeDamping = 1500,
		
		RearHeight = 8.5,
		RearConstant = 25000,
		RearDamping = 2500,
		RearRelativeDamping = 1500,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 400,
		
		TurnSpeed = 8,
		
		MaxGrip = 35,
		Efficiency = 1,
		GripOffset = -1.5,
		BrakePower = 38,
		
		IdleRPM = 750,
		LimitRPM = 7250,
		PeakTorque = 60,
		PowerbandStart = 2000,
		PowerbandEnd = 6950,
		Turbocharged = false,
		Supercharged = false,
		
		FuelFillPos = Vector(-114,45,-18),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 80,
		
		PowerBias = 1,
		
		EngineSoundPreset = -1,
		
		EngineSoundPreset = -1,
		
		snd_pitch = 1,
		snd_idle = "simulated_vehicles/generic3/generic3_idle.wav",
		
		snd_low = "simulated_vehicles/generic3/generic3_low.wav",
		snd_low_revdown = "simulated_vehicles/generic3/generic3_revdown.wav",
		snd_low_pitch = 0.9,
		
		snd_mid = "simulated_vehicles/generic3/generic3_mid.wav",
		snd_mid_gearup = "simulated_vehicles/generic3/generic3_second.wav",
		snd_mid_pitch = 1,
		
		DifferentialGear = 0.45,
		Gears = {-0.1,0,0.1,0.17,0.24,0.3,0.37,0.41}
	}
}
list.Set( "simfphys_vehicles", "raf2203Sit(E34D-FSD2-FN2J)", V )

