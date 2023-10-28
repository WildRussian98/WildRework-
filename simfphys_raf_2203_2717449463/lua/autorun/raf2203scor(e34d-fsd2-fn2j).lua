local Category = "Автомобили"

AddCSLuaFile()
local light_table = {
	L_HeadLampPos = Vector(90.5,36,-13),
	L_HeadLampAng = Angle(10,0,0),
	
	R_HeadLampPos = Vector(90.5,-36,-13),
	R_HeadLampAng = Angle(10,0,0),

	L_RearLampPos = Vector(-126,37.7,-8.7),
	L_RearLampAng = Angle(0,180,0),

	R_RearLampPos = Vector(-126,-37.7,-8.7),
	R_RearLampAng = Angle(0,180,0),
	
	Headlight_sprites = { 
		Vector(90.5,36,-13),
		Vector(90.5,-36,-13),
	},
	Headlamp_sprites = { 
		Vector(90.5,36,-13),
		Vector(90.5,-36,-13),
	},
	Rearlight_sprites = {
		Vector(-126,37.7,-8.7),
		Vector(-126,-37.7,-8.7),
	},
	Brakelight_sprites = {
		Vector(-126,37.7,-17),
		Vector(-126,-37.7,-17),
	},
	Reverselight_sprites = {
		Vector(-126,37.7,-21),
		Vector(-126,-37.7,-21),
	},
	FogLight_sprites = {
	    Vector(43.5,28,45),
		Vector(43.5,-28,45),
		Vector(43.5,0,47),
		Vector(-111,30.5,43.5),
	},
		Turnsignal_sprites = {
		Left = {
		    Vector(-126,37.7,-13),
			Vector(90.5,32,-23),
			Vector(19,45.5,17),
		},
		Right = {
		    Vector(-126,-37.7,-13),
			Vector(90.5,-33,-23),
			Vector(19,-43,17),
		},
	},
	ems_sounds = {"simulated_vehicles/police/siren_1.wav","simulated_vehicles/police/siren_2.wav","simulated_vehicles/police/siren_3.wav"},
	ems_sprites = {
		{
			pos = Vector(22,0,52),
			material = "sprites/light_glow02_add_noz",
			size = 45,
			Colors = {Color(0,0,0,250),Color(0,109,250,255),Color(0,0,0,250)},
			Speed = 0.1,
		}
	}
}
list.Set( "simfphys_lights", "raf2203Skor(E34D-FSD2-FN2J)", light_table)

local V = {
	Name = "РАФ-2203 Скорая помощь",
	Model = "models/raf2203Skor(E34D-FSD2-FN2J).mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = Category,
	SpawnOffset = Vector(0,0,35),

	Members = {
		Mass = 1400,
		EnginePos = Vector(90,0,10),
		LightsTable = "raf2203Skor(E34D-FSD2-FN2J)",
		
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
				pos = Vector(6,-30,-22),
				ang = Angle(0,90,0)
			},
			{
				pos = Vector(6,30,-22),
				ang = Angle(0,135,0)
			},
			{
				pos = Vector(-47,-34,-22),
				ang = Angle(0,0,0)
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
list.Set( "simfphys_vehicles", "raf2203Skor(E34D-FSD2-FN2J)", V )

