local Category = "Автобусы"

local V = {
	Name = "ЛиАЗ 5256",
	Model = "models/RusCars/liaz5256/liaz5256_skin.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = Category,
    SpawnAngleOffset = 90,

	Members = {
		Mass = 9600,
		
		LightsTable = "liaz5256",		
		EnginePos = Vector(-210,0,12),
		CustomWheels = true,
		CustomSuspensionTravel = 15,
		
	    MaxHealth = 4500,
		
		CustomWheelModel = "models/RusCars/ikarus260/ikarus260wh.mdl",
		CustomWheelModel_R = "models/RusCars/ikarus260/ikarus260wh2.mdl",
		CustomWheelPosFL = Vector(148.5,43.5,9),
		CustomWheelPosFR = Vector(148.5,-45.5,9),
		CustomWheelPosRL = Vector(-127,42,9),
		CustomWheelPosRR = Vector(-127,-44,9),	
		CustomWheelAngleOffset = Angle(0,90,0),
		
		CustomMassCenter = Vector(0,0,1),
		
		CustomSteerAngle = 47,
		SeatOffset = Vector(205,-37.5,100),
		SeatPitch = 5,
		SeatYaw = 90,

		
		PassengerSeats = {
			{
				pos = Vector(162,-45,40),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(134,-22,40),
				ang = Angle(0,90,0)
			},
			{
				pos = Vector(66,-22,40),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(86,43,40),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(-71,-22,40),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(-138,-45,52),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(-116,43,44),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(-240,-3,63),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(-240,36,63),
				ang = Angle(0,-90,0)
			},	
		},

		Attachments = {
				{
				model = "models/RusCars/liaz5256/liaz5256c.mdl",
				useVehicleColor = true,
				pos = Vector(0,0,0),
				ang = Angle(0,0,0),
				nosolid = true
			},
			{
				model = "models/RusCars/liaz5256/liaz5256z.mdl",
				useVehicleColor = true,
				pos = Vector(0,0,0),
				ang = Angle(0,0,0),
				nosolid = true
			},
			{
				model = "models/RusCars/liaz5256/liaz5256p.mdl",
				useVehicleColor = true,
				pos = Vector(0,0,0),
				ang = Angle(0,0,0),
				nosolid = true
			},
		},	
		
		ExhaustPositions = {
			{
				pos = Vector(-270,30,9),
				ang = Angle(90,135,0)
			}
		},

        StrengthenSuspension = true,
		
		FrontHeight = 10,
		FrontConstant = 999999,
		FrontDamping = 99999,
		FrontRelativeDamping = 99999,
		
		RearHeight = 10,
		RearConstant = 999999,
		RearDamping = 99999,
		RearRelativeDamping = 99999,
		
		FastSteeringAngle = 11,
		SteeringFadeFastSpeed = 430,
		
		TurnSpeed = 2.0,
		
		MaxGrip = 1700,
		Efficiency = 0.9,
		GripOffset = -21,
		BrakePower = 100,
		
		IdleRPM = 600,
		LimitRPM = 3000,
		PeakTorque = 650,
		PowerbandStart = 800,
		PowerbandEnd = 2200,
		Turbocharged = false,
		Supercharged = false,
		
		PowerBias = 1,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "SMRCars/engines/liaz677/idle.wav",
		Sound_IdlePitch = 1.05,
		
		Sound_Mid = "SMRCars/engines/liaz677/low.wav",
		Sound_MidPitch = 1.3,
		
		Sound_High = "SMRCars/engines/liaz677/medium.wav",		
		Sound_HighPitch = 1.1,
		
		Sound_Throttle = "SMRCars/engines/liaz677/high.wav",
		Sound_ThrottlePitch = 1.1,
		Sound_ThrottleVolume = 5,
		
		DifferentialGear = 0.40,
		Gears = {-0.1,0,0.1,0.2,0.3,0.4}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_liaz5256", V )