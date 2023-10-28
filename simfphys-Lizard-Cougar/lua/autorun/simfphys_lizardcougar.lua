
local Category = "Грузовики"

local IV = {
	Name = "Lizard Cougar",
	Model = "models/lizard_cougar/lizard_cougar.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = Category,
	SpawnOffset = Vector(0,0,50),

	Members = {
		Mass = 1200,
		LightsTable = "lizardcougar",

           GibModels = {
			"models/lizard_cougar/lizard_cougar.mdl",
		},

		
		CustomWheels = true,
		EnginePos = Vector(70,-0.2,65.55),
		IsArmored = false,
		CustomSuspensionTravel = 15,
		
		CustomWheelModel = "models/lizard_cougar/lizard_cougarwheel.mdl",
		CustomWheelPosFL = Vector(40,-36,24.5),
		CustomWheelPosFR = Vector(40,36,24.5),
		CustomWheelPosRL = Vector(-102,-36,20.5),
           CustomWheelPosRR = Vector(-102,36,20.5),
		
		CustomWheelAngleOffset = Angle(0,-90,0),
		
		CustomMassCenter = Vector(2,0,-1),
		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(7,-21,95),
		SeatPitch = 0,
		SeatYaw = 90,
		
		PassengerSeats = {
	{
				pos = Vector(14,-20,63),
				ang = Angle(0,-90,10)
			},

			},
		ExhaustPositions = {
			{
				pos = Vector(-16,43,140.5),
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

		TurnSpeed = 6,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 535,

           MaxHealth = 4000,

		
		MaxGrip = 44,
		Efficiency = 0.5,
		GripOffset = 0,
		BrakePower = 40,
		
		IdleRPM = 500,
		LimitRPM = 5000,
		PeakTorque = 100,
		PowerbandStart = 650,
		PowerbandEnd = 4500,
		Turbocharged = false,
		Supercharged = false,
		
		FuelFillPos = Vector(-28,-42,51),
		FuelType = FUELTYPE_PETROL,
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

		
		DifferentialGear = 0.45,
		Gears = {-0.1,0,0.08,0.1,0.12,0.15}
	}
}
list.Set( "simfphys_vehicles", "simfphys_lizardcougar", IV )

local light_table = {
	L_HeadLampPos = Vector(82,29.5,37),
	L_HeadLampAng = Angle(0,0,0),

	R_HeadLampPos = Vector(82,-29.5,37),
	R_HeadLampAng = Angle(0,0,0),
	
	Headlight_sprites = { 
		Vector(82,29.5,37),
		Vector(82,-29.5,37),
	},
	Headlamp_sprites = { 
		Vector(47,36.5,85),
		Vector(47,-36.5,85),
	},
	
	Rearlight_sprites = {
		Vector(-125,29.5,51),
		Vector(-125,-29.5,51),
	},
	Brakelight_sprites = {
		Vector(-125,29.5,51),
		Vector(-125,-29.5,51),
	},
	Reverselight_sprites = {
		Vector(-125,26.5,51),
		Vector(-125,-26.5,51),
	},
}
list.Set( "simfphys_lights", "lizardcougar", light_table)

