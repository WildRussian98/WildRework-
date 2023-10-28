
local light_table = {
	L_HeadLampPos = Vector(96,8,28),
	L_HeadLampAng = Angle(15,0,0),
	R_HeadLampPos = Vector(96,-8,28),
	R_HeadLampAng = Angle(15,0,0),

	L_RearLampPos = Vector(-96,21,29),
	L_RearLampAng = Angle(40,180,0),
	R_RearLampPos = Vector(-96,-21,29),
	R_RearLampAng = Angle(40,180,0),
	
	Headlight_sprites = { 
		Vector(96,8,28),Vector(96,12,28),
		Vector(96,-8,28),Vector(96,-12,28),
	},
	Headlamp_sprites = { 
		Vector(-10,0,63),Vector(-10,5,63),Vector(-10,7,63),
		Vector(-10,0,63),Vector(-10,-5,63),Vector(-10,-7,63),
--------
		Vector(-10,15,63),Vector(-10,17,63),Vector(-10,19,63),
		Vector(-10,-15,63),Vector(-10,-17,63),Vector(-10,-19,63),

	},
	Rearlight_sprites = {
		Vector(-96,21,29),Vector(-95.5,22,31),Vector(-94.5,23,33),
		Vector(-96,-21,29),Vector(-95.5,-22,31),Vector(-94.5,-23,33),
	},
	Brakelight_sprites = {
		Vector(-96,21,29),Vector(-95.5,22,31),Vector(-94.5,23,33),
		Vector(-96,-21,29),Vector(-95.5,-22,31),Vector(-94.5,-23,33),
	}
}
list.Set( "simfphys_lights", "c3", light_table)


local V = {
	Name = "Пехотный багги MLRS",
	Model = "models/crysis3/assaul_buggy.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Артиллерия",
	SpawnOffset = Vector(0,0,60),
	SpawnAngleOffset = 90,

	Members = {
		Mass = 3000,
		
		MaxHealth = 3000,
		
		EnginePos = Vector(63.64,0,32),
		
		LightsTable = "c3",
		
		CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		FrontWheelRadius = 23,
		RearWheelRadius = 23,
		
		CustomWheelModel = "models/crysis3/wheel_buggy.mdl",
		CustomWheelPosFL = Vector(73,48,1),
		CustomWheelPosFR = Vector(73,-48,1),
		CustomWheelPosRL = Vector(-81,48,3),
		CustomWheelPosRR = Vector(-81,-48,3),
		CustomWheelAngleOffset = Angle(180,90,180),
		
		CustomMassCenter = Vector(0,0,3.5),
		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(-18,-15,41),
		SeatPitch = -5,
		SeatYaw = 90,
		
		PassengerSeats = {		
			{
				pos = Vector(-10,-15,6),
				ang = Angle(0,-90,24)
			},
		},
		
		FrontHeight = 10,
		FrontConstant = 27000,
		FrontDamping = 2800,
		FrontRelativeDamping = 2800,
		
		RearHeight = 10,
		RearConstant = 32000,
		RearDamping = 2900,
		RearRelativeDamping = 2900,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 4,
		
		MaxGrip = 160,
		Efficiency = 1,
		GripOffset = 0,
		BrakePower = 60,
		BulletProofTires = true,
		
		IdleRPM = 750,
		LimitRPM = 6500,
		PeakTorque = 140,
		PowerbandStart = 2200,
		PowerbandEnd = 6300,
		
		FuelFillPos = Vector(17.64,-14.55,30.06),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 65,
		
		PowerBias = 0.5,
		
		EngineSoundPreset = -1,
		
		snd_pitch = 1,
		snd_idle = "simulated_vehicles/jeep/jeep_idle.wav",
		
		snd_low = "simulated_vehicles/jeep/jeep_low.wav",
		snd_low_revdown = "simulated_vehicles/jeep/jeep_revdown.wav",
		snd_low_pitch = 0.9,
		
		snd_mid = "simulated_vehicles/jeep/jeep_mid.wav",
		snd_mid_gearup = "simulated_vehicles/jeep/jeep_second.wav",
		snd_mid_pitch = 1,
		
		snd_horn = "simulated_vehicles/horn_1.wav",
		
		ForceTransmission = 1,
		DifferentialGear = 0.3,
		Gears = {-0.1,0,0.1,0.15,0.2,0.25,0.3}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_c3_buggy", V )

local V = {
	Name = "Пехотный багги",
	Model = "models/crysis3/assaul_buggy1.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Бронемашины",
	SpawnOffset = Vector(0,0,60),
	SpawnAngleOffset = 90,

	Members = {
		Mass = 3000,
		
		MaxHealth = 3000,
		
		EnginePos = Vector(63.64,0,32),
		
		LightsTable = "c3",
		
		CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		FrontWheelRadius = 23,
		RearWheelRadius = 23,
		
		CustomWheelModel = "models/crysis3/wheel_buggy.mdl",
		CustomWheelPosFL = Vector(73,48,1),
		CustomWheelPosFR = Vector(73,-48,1),
		CustomWheelPosRL = Vector(-81,48,3),
		CustomWheelPosRR = Vector(-81,-48,3),
		CustomWheelAngleOffset = Angle(180,90,180),
		
		CustomMassCenter = Vector(0,0,3.5),
		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(-18,-15,41),
		SeatPitch = -5,
		SeatYaw = 90,
		
		PassengerSeats = {		
			{
				pos = Vector(-10,-15,6),
				ang = Angle(0,-90,24)
			},
		},
		
		FrontHeight = 10,
		FrontConstant = 27000,
		FrontDamping = 2800,
		FrontRelativeDamping = 2800,
		
		RearHeight = 10,
		RearConstant = 32000,
		RearDamping = 2900,
		RearRelativeDamping = 2900,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 4,
		
		MaxGrip = 160,
		Efficiency = 1.337,
		GripOffset = 0,
		BrakePower = 70,
		BulletProofTires = true,
		
		IdleRPM = 750,
		LimitRPM = 6500,
		PeakTorque = 140,
		PowerbandStart = 2200,
		PowerbandEnd = 6300,
		
		FuelFillPos = Vector(17.64,-14.55,30.06),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 65,
		
		PowerBias = 0.5,
		
		EngineSoundPreset = -1,
		
		snd_pitch = 1,
		snd_idle = "simulated_vehicles/jeep/jeep_idle.wav",
		
		snd_low = "simulated_vehicles/jeep/jeep_low.wav",
		snd_low_revdown = "simulated_vehicles/jeep/jeep_revdown.wav",
		snd_low_pitch = 0.9,
		
		snd_mid = "simulated_vehicles/jeep/jeep_mid.wav",
		snd_mid_gearup = "simulated_vehicles/jeep/jeep_second.wav",
		snd_mid_pitch = 1,
		
		snd_horn = "simulated_vehicles/horn_1.wav",
		
		ForceTransmission = 1,
		DifferentialGear = 0.3,
		Gears = {-0.15,0,0.15,0.25,0.35,0.45}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_c3_buggy1", V )