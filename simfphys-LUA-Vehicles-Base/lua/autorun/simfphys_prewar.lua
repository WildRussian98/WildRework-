local light_table = {
	L_HeadLampPos = Vector(71.15,23.26,27.92),
	L_HeadLampAng = Angle(15,0,0),
	R_HeadLampPos = Vector(71.07,-23.15,27.95),
	R_HeadLampAng = Angle(15,0,0),

	L_RearLampPos = Vector(-72,26.5,29),
	L_RearLampAng = Angle(30,185,0),
	R_RearLampPos = Vector(-72,-26.5,29),
	R_RearLampAng = Angle(30,175,0),
	
	Headlight_sprites = { 
		Vector(71.15,23.26,27.92),
		Vector(71.07,-23.15,27.95)
	},
	Headlamp_sprites = { 
		{pos = Vector(71.15,23.26,27.92),size = 80, color = Color( 220,205,160,50)},
		{pos = Vector(71.07,-23.15,27.95),size = 80, color = Color( 220,205,160,50)},
	},
	Rearlight_sprites = {
		Vector(-72,22,29),Vector(-72,23.5,29),Vector(-72,25,29),Vector(-72,26.5,29),Vector(-72,28,29),Vector(-72,29.5,29),Vector(-72,31,29),
		Vector(-72,-22,29),Vector(-72,-23.5,29),Vector(-72,-25,29),Vector(-72,-26.5,29),Vector(-72,-28,29),Vector(-72,-29.5,29),Vector(-72,-31,29),
	},
	Brakelight_sprites = {
		Vector(-72,22,29),Vector(-72,23.5,29),Vector(-72,25,29),Vector(-72,26.5,29),Vector(-72,28,29),Vector(-72,29.5,29),Vector(-72,31,29),
		Vector(-72,-22,29),Vector(-72,-23.5,29),Vector(-72,-25,29),Vector(-72,-26.5,29),Vector(-72,-28,29),Vector(-72,-29.5,29),Vector(-72,-31,29),
	},
	
	Turnsignal_sprites = {
		Left = {
			Vector(-72.14,29.97,31.85),
			Vector(-72.14,27.97,31.85),
			Vector(-72.14,25.97,31.85),
			Vector(72.19,24.97,20.34),
		},
		Right = {
			Vector(-72.54,-30.32,31.81),
			Vector(-72.54,-28.32,31.81),
			Vector(-72.54,-26.32,31.81),
			Vector(72.19,-24.6,20.34),
		},
	},
}
list.Set( "simfphys_lights", "golf", light_table)

local light_table = {
	L_HeadLampPos = Vector(-36.74,121.35,45.43),
	L_HeadLampAng = Angle(15,90,0),
	R_HeadLampPos = Vector(32.15,118.88,45.13),
	R_HeadLampAng = Angle(15,90,0),
	
	L_RearLampPos = Vector(-47,-133.97,28.14),
	L_RearLampAng = Angle(30,-90,0),
	R_RearLampPos = Vector(44.13,-134.42,27.34),
	R_RearLampAng = Angle(30,-90,0),
	
	Headlight_sprites = { 
		{pos = Vector(-36.74,121.35,45.43),material = "sprites/light_ignorez",size = 40},
		{pos = Vector(-36.74,121.35,45.43),size = 55},
		
		{pos = Vector(32.15,118.88,45.13),material = "sprites/light_ignorez",size = 40},
		{pos = Vector(32.15,118.88,45.13),size = 55},
	},
	Headlamp_sprites = { 
		{pos = Vector(-36.74,121.35,45.43),size = 80},
		{pos = Vector(32.15,118.88,45.13),size = 80},
	},
	Rearlight_sprites = {
		Vector(-47,-133.97,28.14),
		Vector(44.13,-134.42,27.34),
	},
	Reverselight_sprites = {
		Vector(32.33,-134.11,27.34),
	},
	
	Turnsignal_sprites = {
		Left = {
			Vector(-39.88,119.03,66.5),
		},
		Right = {
			Vector(36.11,119.71,66.5),
		},
		
		TurnBrakeLeft = {
			Vector(-47,-133.97,28.14),
		},
		
		TurnBrakeRight = {
			Vector(44.13,-134.42,27.34),
		},
	},
}
list.Set( "simfphys_lights", "liaz", light_table)


local V = {
	Name = "Volkswagen Golf",
	Model = "models/blu/hatchback/pw_hatchback.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Автомобили",
	SpawnAngleOffset = 90,

	Members = {
		Mass = 800,
		
		OnSpawn = 
		function(ent) 
			ent:SetSkin(math.random(0,4))
		end,
		
		EnginePos = Vector(54.27,0,37.26),
		
		LightsTable = "golf",
		
		CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		CustomWheelModel = "models/salza/hatchback/hatchback_wheel.mdl",
		CustomWheelPosFL = Vector(44.5,28,12),
		CustomWheelPosFR = Vector(44.5,-28,12),
		CustomWheelPosRL = Vector(-46,29.5,12),
		CustomWheelPosRR = Vector(-46,-29.5,12),
		CustomWheelAngleOffset = Angle(0,90,0),
		
		CustomMassCenter = Vector(0,0,2),
		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(-8.5,-16,44),
		SeatPitch = 0,
		SeatYaw = 90,
		
		PassengerSeats = {
			{
				pos = Vector(5,-16,14),
				ang = Angle(0,-90,20)
			},
			{
				pos = Vector(-24,-16,14),
				ang = Angle(0,-90,20)
			},
			{
				pos = Vector(-24,16,14),
				ang = Angle(0,-90,20)
			}
		},
		
		FrontHeight = 6.5,
		FrontConstant = 20000,
		FrontDamping = 1000,
		FrontRelativeDamping = 500,
		
		RearHeight = 6.5,
		RearConstant = 20000,
		RearDamping = 1000,
		RearRelativeDamping = 500,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 400,
		
		TurnSpeed = 8,
		
		MaxGrip = 23,
		Efficiency = 1,
		GripOffset = -0.7,
		BrakePower = 25,
		
		IdleRPM = 750,
		LimitRPM = 6200,
		PeakTorque = 75,
		PowerbandStart = 1750,
		PowerbandEnd = 5700,
		Turbocharged = false,
		Supercharged = false,
		
		FuelFillPos = Vector(-61.59,32.11,31.83),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 65,
		
		PowerBias = -1,
		
		EngineSoundPreset = -1,
		
		snd_pitch = 1,
		snd_idle = "simulated_vehicles/4banger/4banger_idle.wav",
		
		snd_low = "simulated_vehicles/4banger/4banger_low.wav",
		snd_low_pitch = 0.9,
		
		snd_mid = "simulated_vehicles/4banger/4banger_mid.wav",
		snd_mid_gearup = "simulated_vehicles/4banger/4banger_second.wav",
		snd_mid_pitch = 0.8,
		
		snd_horn = "simulated_vehicles/horn_3.wav",
		
		DifferentialGear = 0.78,
		Gears = {-0.08,0,0.08,0.18,0.26,0.33}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_pwhatchback", V )

local V = {
	Name = "Skoda-Liaz 706MT",
	Model = "models/blu/skoda_liaz/skoda_liaz.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Грузовики",

	Members = {
		Mass = 3000,
		
        MaxHealth = 4000,
		
		EnginePos = Vector(-1.75,-0.56,51.17),
		
		LightsTable = "liaz",
		
		CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		FirstPersonViewPos =  Vector(0,-10,12),
		
		CustomWheelModel = "models/salza/skoda_liaz/skoda_liaz_fwheel.mdl",
		CustomWheelModel_R = "models/salza/skoda_liaz/skoda_liaz_rwheel.mdl",
		CustomWheelPosFL = Vector(-44,57,25),
		CustomWheelPosFR = Vector(40,57,25),
		CustomWheelPosRL = Vector(-50,-98,25),
		CustomWheelPosRR = Vector(47,-98,25),
		CustomWheelAngleOffset = Angle(0,180,0),
		
		CustomMassCenter = Vector(0,30,10),
		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(40,-27,100),
		SeatPitch = 10,
		SeatYaw = 0,
		
		PassengerSeats = {
			{
				pos = Vector(27,58,60),
				ang = Angle(0,0,5)
			}
		},
		
		StrengthenSuspension = false,
		
		FrontHeight = 16,
		FrontConstant = 32000,
		FrontDamping = 4000,
		FrontRelativeDamping = 4000,
		
		RearHeight = 13.5,
		RearConstant = 20000,
		RearDamping = 3000,
		RearRelativeDamping = 2000,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 600,
		
		TurnSpeed = 8,
		
		MaxGrip = 75,
		Efficiency = 2,
		GripOffset = -5,
		BrakePower = 80,
		
		IdleRPM = 600,
		LimitRPM = 5000,
		PeakTorque = 80,
		PowerbandStart = 1000,
		PowerbandEnd = 4500,
		Turbocharged = false,
		Supercharged = false,
		
		FuelFillPos = Vector(-17.8,2.09,51.93),
		FuelType = FUELTYPE_DIESEL,
		FuelTankSize = 140,
		
		PowerBias = 1,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "vehicles/crane/crane_startengine1.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/alfaromeo/alfaromeo_low.wav",
		Sound_MidPitch = 0.5,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 100,
		Sound_MidFadeOutRate = 1,
		
		Sound_High = "",
		
		Sound_Throttle = "",
		
		DifferentialGear = 0.22,
		Gears = {-0.1,0,0.1,0.15,0.2,0.25}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_pwliaz", V )
