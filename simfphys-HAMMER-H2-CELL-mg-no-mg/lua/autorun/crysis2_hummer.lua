
local light_table = {
	L_HeadLampPos = Vector(102,20,12),
	L_HeadLampAng = Angle(15,0,0),
	R_HeadLampPos = Vector(102,-20,12),
	R_HeadLampAng = Angle(15,0,0),

	L_RearLampPos = Vector(-99,39,14),
	L_RearLampAng = Angle(40,180,0),
	R_RearLampPos = Vector(-99,-39,14),
	R_RearLampAng = Angle(40,180,0),
	
	Headlight_sprites = { 
		Vector(102,20,14),Vector(102,20,12),
		Vector(102,-20,14),Vector(102,-20,12),
	},
	Headlamp_sprites = { 
		Vector(102,23,14),Vector(100,25,14),Vector(98,27,14),Vector(96,29,14),
		Vector(102,-23,14),Vector(100,-25,14),Vector(98,-27,14),Vector(96,-29,14),
	},
	Rearlight_sprites = {
		Vector(-99,39,12),Vector(-99,39,14),Vector(-99,39,16),
		Vector(-99,-39,12),Vector(-99,-39,14),Vector(-99,-39,16),
		-------
		Vector(-99,39,18),Vector(-98,39,20),Vector(-97,39,22),
		Vector(-99,-39,18),Vector(-98,-39,20),Vector(-97,-39,22),
	},
	Brakelight_sprites = {
		Vector(-99,39,12),Vector(-99,39,14),Vector(-99,39,16),
		Vector(-99,-39,12),Vector(-99,-39,14),Vector(-99,-39,16),
		-------
		Vector(-99,39,18),Vector(-98,39,20),Vector(-97,39,22),
		Vector(-99,-39,18),Vector(-98,-39,20),Vector(-97,-39,22),
	}
}
list.Set( "simfphys_lights", "hummerh2", light_table)


local V = {
	Name = "Hummer H2",
	Model = "models/hummer_h2.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Бронемашины",
	SpawnOffset = Vector(0,0,60),
	SpawnAngleOffset = 90,

	Members = {
		Mass = 2000,
		MaxHealth = 4500,	
		EnginePos = Vector(63.64,0,32),
		
		LightsTable = "hummerh2",
		
		CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		FrontWheelRadius = 20,
		RearWheelRadius = 20,
		
		CustomWheelModel = "models/hummer_h2_wheel.mdl",
		CustomWheelPosFL = Vector(68,42,-16),
		CustomWheelPosFR = Vector(68,-42,-16),
		CustomWheelPosRL = Vector(-60,42,-16),
		CustomWheelPosRR = Vector(-60,-42,-16),
		CustomWheelAngleOffset = Angle(180,90,180),
		
		CustomMassCenter = Vector(0,0,3.5),
		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(-3,-27,32),
		SeatPitch = 5,
		SeatYaw = 90,
		
		--[[
		ModelInfo = {
			Skin = 1
		},
		]]--
		
		PassengerSeats = {
			{
				pos = Vector(4,-27,0),
				ang = Angle(0,-90,5)
			},
			
			{
				pos = Vector(-54,-34,16),
				ang = Angle(0,0,-7)
			},
			{
				pos = Vector(-54,34,16),
				ang = Angle(0,180,-7)
			},
		},
		
		FrontHeight = 6.5,
		FrontConstant = 45000,
		FrontDamping = 4000,
		FrontRelativeDamping = 3000,
		
		RearHeight = 6.5,
		RearConstant = 45000,
		RearDamping = 4000,
		RearRelativeDamping = 3000,
		
		FastSteeringAngle = 20,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 4,
		
		MaxGrip = 100,
		Efficiency = 1,
		GripOffset = -1,
		BrakePower = 80,
		
		IdleRPM = 4000,
		LimitRPM = 7000,
		PeakTorque = 145,
		PowerbandStart = 700,
		PowerbandEnd = 6500,
		Turbocharged = false,
		Supercharged = false,
		
		FuelFillPos = Vector(-110,-42,4),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 65,
		
		PowerBias = 1,
		
		EngineSoundPreset = -1,
		
		snd_pitch = 1,
		snd_idle = "simulated_vehicles/generic3/generic3_idle.wav",
		
		snd_low = "simulated_vehicles/generic3/generic3_low.wav",
		snd_low_revdown = "simulated_vehicles/generic3/generic3_revdown.wav",
		snd_low_pitch = 0.9,
		
		snd_mid = "simulated_vehicles/generic3/generic3_mid.wav",
		snd_mid_gearup = "simulated_vehicles/generic3/generic3_second.wav",
		snd_mid_pitch = 0.9,
		
		DifferentialGear = 0.42,
		Gears = {-0.1,0,0.1,0.17,0.24,0.3,0.37,0.41}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_hummerh2", V )

local V = {
	Name = "Hummer H2 HMG",
	Model = "models/hummer_h2_mg.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Легкая бронетехника",
	SpawnOffset = Vector(0,0,60),
	SpawnAngleOffset = 90,

	Members = {
		Mass = 2000,
	    MaxHealth = 4500,	
		EnginePos = Vector(63.64,0,32),
		
		LightsTable = "hummerh2",
		
		CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		FrontWheelRadius = 20,
		RearWheelRadius = 20,
		
		CustomWheelModel = "models/hummer_h2_wheel.mdl",
		CustomWheelPosFL = Vector(68,42,-16),
		CustomWheelPosFR = Vector(68,-42,-16),
		CustomWheelPosRL = Vector(-60,42,-16),
		CustomWheelPosRR = Vector(-60,-42,-16),
		CustomWheelAngleOffset = Angle(180,90,180),
		
		CustomMassCenter = Vector(0,0,3.5),
		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(-3,-27,32),
		SeatPitch = 5,
		SeatYaw = 90,
		
		--[[
		ModelInfo = {
			Skin = 1
		},
		]]--
		
		PassengerSeats = {
			{
				pos = Vector(-32,0,22),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(4,-27,0),
				ang = Angle(0,-90,5)
			},
			
			{
				pos = Vector(-54,-34,16),
				ang = Angle(0,0,-7)
			},
			{
				pos = Vector(-54,34,16),
				ang = Angle(0,180,-7)
			},
		},
		
		FrontHeight = 6.5,
		FrontConstant = 45000,
		FrontDamping = 4000,
		FrontRelativeDamping = 3000,
		
		RearHeight = 6.5,
		RearConstant = 45000,
		RearDamping = 4000,
		RearRelativeDamping = 3000,
		
		FastSteeringAngle = 20,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 4,
		
		MaxGrip = 120,
		Efficiency = 1,
		GripOffset = -1,
		BrakePower = 80,
		
		IdleRPM = 4000,
		LimitRPM = 7000,
		PeakTorque = 100,
		PowerbandStart = 700,
		PowerbandEnd = 6500,
		Turbocharged = false,
		Supercharged = false,
		
		FuelFillPos = Vector(-110,-42,4),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 65,
		
		PowerBias = 1,
		
		EngineSoundPreset = -1,
		
		snd_pitch = 1,
		snd_idle = "simulated_vehicles/generic3/generic3_idle.wav",
		
		snd_low = "simulated_vehicles/generic3/generic3_low.wav",
		snd_low_revdown = "simulated_vehicles/generic3/generic3_revdown.wav",
		snd_low_pitch = 0.9,
		
		snd_mid = "simulated_vehicles/generic3/generic3_mid.wav",
		snd_mid_gearup = "simulated_vehicles/generic3/generic3_second.wav",
		snd_mid_pitch = 0.9,
		
		DifferentialGear = 0.42,
		Gears = {-0.1,0,0.1,0.17,0.24,0.3,0.37,0.41}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_hummerh2_mg", V )

