local Category = "Бронемашины"

local IV = {
	Name = "Arhan",
	Model = "models/arhanp51/arhanp51.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = Category,
	SpawnOffset = Vector(0,0,50),

	Members = {
		Mass = 1500,
		MaxHealth = 4500,		

		LightsTable = "arhanp51",

           GibModels = {
			"models/arhanp51/arhanp51.mdl",
		},
		
		CustomWheels = true,
		EnginePos = Vector(80,-0.2,60),
		IsArmored = true,
		CustomSuspensionTravel = 15,
		
		CustomWheelModel = "models/arhanp51/arhanp51_wheel.mdl",
		CustomWheelPosFL = Vector(72,-35,29.5),
		CustomWheelPosFR = Vector(72,35,29.5),
		CustomWheelPosRL = Vector(-44,-35,24.5),
           CustomWheelPosRR = Vector(-44,35,24.5),
		
		CustomWheelAngleOffset = Angle(0,-90,0),
		
		CustomMassCenter = Vector(2,0,-1),
		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(15,-19,75),
		SeatPitch = 0,
		SeatYaw = 90,
		
		PassengerSeats = {
			{
				pos = Vector(21,-20,43),
				ang = Angle(0,-90,10)
			},
			{
				pos = Vector(-15,-20,43),
				ang = Angle(0,-90,10)
			},
			{
				pos = Vector(-15,20,43),
				ang = Angle(0,-90,10)
			},
			{
				pos = Vector(-41,20,43),
				ang = Angle(0,-180,10)
			},
			{
				pos = Vector(-61,20,43),
				ang = Angle(0,-180,10)
			},

			},
		ExhaustPositions = {
			{
				pos = Vector(-50,-20,25.5),
				ang = Angle(90,165,0)
			},

		},
		
		FrontHeight = 6,
		FrontConstant = 40000,
		FrontDamping = 2200,
		FrontRelativeDamping = 2200,

		RearHeight = 1,
		RearConstant = 40000,
		RearDamping = 2200,
		RearRelativeDamping = 2200,

		TurnSpeed = 4,
		
		FastSteeringAngle = 1000,
		SteeringFadeFastSpeed = 535,

           MaxHealth = 3600,

		
		MaxGrip = 37,
		Efficiency = 1.0,
		GripOffset = -2,
		BrakePower = 40,
		
		IdleRPM = 650,
		LimitRPM = 4200,
		PeakTorque = 40,
		Revlimiter = false,
		PowerbandStart = 1000,
		PowerbandEnd = 4000,
		Turbocharged = false,
		BulletProofTires = true,

		FuelFillPos = Vector(-60,40,60),
		FuelType = FUELTYPE_DIESEL,
		FuelTankSize = 100,

		
		PowerBias = 0,
		
		EngineSoundPreset = -1, 

		
		snd_pitch = 1,
		snd_idle = "simulated_vehicles/jeep/jeep_idle.wav",
		
		snd_low = "simulated_vehicles/jeep/jeep_low.wav",
		snd_low_revdown = "simulated_vehicles/jeep/jeep_revdown.wav",
		snd_low_pitch = 0.9,
		
		snd_mid = "simulated_vehicles/jeep/jeep_mid.wav",
		snd_mid_gearup = "simulated_vehicles/jeep/jeep_second.wav", 
		snd_mid_pitch = 1,
		

		
		DifferentialGear = 0.8,
		Gears = {-0.1,0,0.03,0.06,0.08,0.1}
	}
}
list.Set( "simfphys_vehicles", "simfphys_arhanp51", IV )

local light_table = {
	L_HeadLampPos = Vector(102,30,53),
	L_HeadLampAng = Angle(0,0,0),

	R_HeadLampPos = Vector(102,-28,53),
	R_HeadLampAng = Angle(0,0,0),
	
	Headlight_sprites = { 
		Vector(102,30,53),
		Vector(102,-28,53),
	},
	Headlamp_sprites = { 
		Vector(102,30,53),
		Vector(102,-28,53),
	},
	
	Rearlight_sprites = {
		Vector(-76,27,39.4),
		Vector(-76,23,39.4),
		Vector(-76,-27,39.4),
		Vector(-76,-23,39.4),
	},
	Brakelight_sprites = {
		Vector(-76,27,39.4),
		Vector(-76,23,39.4),
		Vector(-76,-27,39.4),
		Vector(-76,-23,39.4),
	},
	Reverselight_sprites = {
		Vector(-76,19.3,39.8),
		Vector(-76,-18.7,39.8),
	},
}
list.Set( "simfphys_lights", "arhanp51", light_table)
