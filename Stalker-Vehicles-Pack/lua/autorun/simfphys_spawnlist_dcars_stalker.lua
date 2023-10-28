
local V = {
	Name = "ВАЗ-2103",
	Model = "models/DiggerCars/stalker/lada.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Автомобили",

	Members = {
		Mass = 1450,
		LightsTable = "stalkerlada",			
		EnginePos = Vector(60,0,33.6),
		
		OnSpawn = 
			function(ent) 
				ent:SetSkin(math.random(0,3))
		end,
		
		FirstPersonViewPos =  Vector(0,-8,6),
		
		AirFriction = -8000,
		
		CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		CustomWheelModel = "models/DiggerCars/stalker/lada_wheel.mdl",
		CustomWheelPosFL = Vector(57.4,29,15),
		CustomWheelPosFR = Vector(57.4,-29,15),
		CustomWheelPosRL = Vector(-48.6,29,16),	
		CustomWheelPosRR = Vector(-48.6,-29,16),
		CustomWheelAngleOffset = Angle(0,90,0),
		
		CustomMassCenter = Vector(0,0,3),
		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(0,-15,45),
		SeatPitch = 0,
		SeatYaw = 90,
		
		PassengerSeats = {
			{
				pos = Vector(15,-14.5,15),
				ang = Angle(0,-90,20)
			},
			{
				pos = Vector(-26,-14.5,15),
				ang = Angle(0,-90,20)
			},
			{
				pos = Vector(-26,0,15),
				ang = Angle(0,-90,20)
			},
			{
				pos = Vector(-26,14.5,15),
				ang = Angle(0,-90,20)
			},
		},
		
		FrontHeight = 7,
		FrontConstant = 40000,
		FrontDamping = 2800,
		FrontRelativeDamping = 2800,
		
		RearHeight = 7,
		RearConstant = 40000,
		RearDamping = 3800,
		RearRelativeDamping = 3800,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 400,
		
		TurnSpeed = 4,
		
		MaxGrip = 35,
		Efficiency = 1.0,
		GripOffset = -1,
		BrakePower = 30,
		
		IdleRPM = 600,
		LimitRPM = 6500,
		PeakTorque = 85,
		PowerbandStart = 2000,
		PowerbandEnd = 6000,
		Turbocharged = false,
		Supercharged = false,
		
		FuelFillPos = Vector(-63,-33.1,35),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 65,
		
		PowerBias = 1,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/4banger/4banger_idle.wav",
		Sound_IdlePitch = 1.05,
		
		Sound_Mid = "simulated_vehicles/4banger/4banger_mid.wav",
		Sound_MidPitch = 0.8,
		Sound_MidVolume = 2,
		Sound_MidFadeOutRPMpercent = 100,
		Sound_MidFadeOutRate = 1,
		
		Sound_High = "",
		
		Sound_Throttle = "",
		
		DifferentialGear = 0.5,
		Gears = {-0.1,0,0.1,0.2,0.28,0.34,0.4}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_stalkerlada", V )

local light_table = {
		L_HeadLampPos = Vector( 80, 25, 40 ),
	L_HeadLampAng = Angle(10,5,0),
	R_HeadLampPos = Vector( 80, -25, 40 ),
	R_HeadLampAng = Angle(10,-5,0),
	
	L_RearLampPos = Vector(-80,30,32),
	L_RearLampAng = Angle(25,180,0),
	R_RearLampPos = Vector(-80,-30,32),
	R_RearLampAng = Angle(25,180,0),

	Headlight_sprites = {
{pos =Vector(78,17.4,28),size = 55}, 
{pos =Vector(78,-17.4,28),size = 55}, 
{pos =Vector(77.5,25.26,28),size = 55}, 
{pos =Vector(77.5,-25.26,28),size = 55}, 
	},
	Headlamp_sprites = { 
{pos =Vector(78,17.4,28),size = 55}, 
{pos =Vector(78,-17.4,28),size = 55}, 
{pos =Vector(77.5,25.26,28),size = 55}, 
{pos =Vector(77.5,-25.26,28),size = 55}, 
	},
	Rearlight_sprites = { 
 {pos =Vector(-87.25,26.47,31.5),size = 25},
 {pos =Vector(-87.25,-26.47,31.5),size = 25},
	},
	Brakelight_sprites = {
 {pos =Vector(-87.35,18.5,30.5),size = 25},
 {pos =Vector(-87.35,-18.5,30.5),size = 25},
	},
	SubMaterials = {
		off = {
			Base = {
				[1] = "",
				[4] = "",
				[5] = "",
				[6] = "",
			},
			Brake = {
				[1] = "models/diggercars/stalker/veh_lada9_b",
				[4] = "models/diggercars/stalker/veh_lada1_b",
				[5] = "models/diggercars/stalker/veh_lada_br_b",
				[6] = "models/diggercars/stalker/veh_lada_br2_b",
			},
		},
		on_lowbeam = {
			Base = {
				[1] = "models/diggercars/stalker/veh_lada9_l",
				[4] = "models/diggercars/stalker/veh_lada1_l",
				[5] = "models/diggercars/stalker/veh_lada_br_l",
				[6] = "models/diggercars/stalker/veh_lada_br2_l",
			},
			Brake = {
				[1] = "models/diggercars/stalker/veh_lada9_lb",
				[4] = "models/diggercars/stalker/veh_lada1_lb",
				[5] = "models/diggercars/stalker/veh_lada_br_lb",
				[6] = "models/diggercars/stalker/veh_lada_br2_lb",
			},
		},
		on_highbeam = {
			Base = {
				[1] = "models/diggercars/stalker/veh_lada9_l",
				[4] = "models/diggercars/stalker/veh_lada1_l",
				[5] = "models/diggercars/stalker/veh_lada_br_l",
				[6] = "models/diggercars/stalker/veh_lada_br2_l",
			},
			Brake = {
				[1] = "models/diggercars/stalker/veh_lada9_lb",
				[4] = "models/diggercars/stalker/veh_lada1_lb",
				[5] = "models/diggercars/stalker/veh_lada_br_lb",
				[6] = "models/diggercars/stalker/veh_lada_br2_lb",
			},
		},
	},

	DelayOn = 0.5,
	DelayOff = 0.25,

}
list.Set( "simfphys_lights", "stalkerlada", light_table)

local V = {
	Name = "Т-40",
	Model = "models/DiggerCars/stalker/tractor.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Грузовики",

	Members = {
		Mass = 3000,
		
		EnginePos = Vector(26,0,54),
		LightsTable = "stalkertractor",			
		FirstPersonViewPos =  Vector(0,-8,3),
		
		OnSpawn = 
			function(ent) 
			ent:SetSkin(math.random(0,2))
		end,
		
		AirFriction = -8000,
		
		CustomWheels = true,
		CustomSuspensionTravel = 10,
		CustomWheelModel_R = "models/DiggerCars/stalker/tractor_wheelr.mdl",		
		CustomWheelModel = "models/DiggerCars/stalker/tractor_wheelf.mdl",
		CustomWheelPosFL = Vector(55,29,20),
		CustomWheelPosFR = Vector(55,-29,20),
		CustomWheelPosRL = Vector(-37.6,29,40),	
		CustomWheelPosRR = Vector(-37.6,-29,40),
		CustomWheelAngleOffset = Angle(0,-90,0),
		RearWheelRadius	= 35,	
		CustomMassCenter = Vector(0,0,3),
           	MaxHealth = 2200,		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(-36,0,90),
		SeatPitch = 0,
		SeatYaw = 90,
	
		ExhaustPositions = {
			{
				pos = Vector(40,20.3,97),
				ang = Angle(30,90,0)
			},
			{
				pos = Vector(40,20.3,97),
				ang = Angle(30,90,0)
			},
			{
				pos = Vector(40,20.3,97),
				ang = Angle(30,90,0)
			},
			{
				pos = Vector(40,20.3,97),
				ang = Angle(30,90,0)
			},
		},
		
		FrontHeight = 10,
		FrontConstant = 170000,
		FrontDamping = 7800,
		FrontRelativeDamping = 7800,
		
		RearHeight = 14,
		RearConstant = 190000,
		RearDamping = 7800,
		RearRelativeDamping = 7800,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 400,
		
		TurnSpeed = 1,
		
		MaxGrip = 80,
		Efficiency = 2.0,
		GripOffset = -1,
		BrakePower = 30,
		
		IdleRPM = 450,
		LimitRPM = 2500,
		PeakTorque = 30,
		PowerbandStart = 900,
		PowerbandEnd = 2000,
		Turbocharged = false,
		Supercharged = false,
		
		FuelFillPos = Vector(-55,-15,69),
		FuelType = FUELTYPE_DIESEL,
		FuelTankSize = 50,
		
		PowerBias = 1,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/tractor/car_traktor_start2.wav",
		Sound_IdlePitch = 1.05,
		
		Sound_Mid = "simulated_vehicles/tractor/car_traktor2.wav",
		Sound_MidPitch = 1,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 100,
		Sound_MidFadeOutRate = 1,
		
		Sound_High = "",
		
		Sound_Throttle = "",

		DifferentialGear = 0.2,
		Gears = {-0.03,0,0.05,0.14,0.3}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_stalkertractor", V )


local light_table = {
		L_HeadLampPos = Vector( 70, 25, 40 ),
	L_HeadLampAng = Angle(10,5,0),
	R_HeadLampPos = Vector( 70, -25, 40 ),
	R_HeadLampAng = Angle(10,-5,0),
	
	L_RearLampPos = Vector(-70,22,42),
	L_RearLampAng = Angle(25,180,0),
	R_RearLampPos = Vector(-70,-22,42),
	R_RearLampAng = Angle(25,180,0),

	Headlight_sprites = {
{pos =Vector(60,18.7,49),size = 55}, 
{pos =Vector(60,-18.7,49),size = 55}, 
	},
	Headlamp_sprites = { 
{pos =Vector(60,18.7,49),size = 55}, 
{pos =Vector(60,-18.7,49),size = 55}, 
	},
	Rearlight_sprites = { 
 {pos =Vector(-66.6,25.5,65.6),size = 25},
 {pos =Vector(-66.6,-25.5,65.6),size = 25},
	},
	Brakelight_sprites = {
 {pos =Vector(-66.6,25.5,65.6),size = 25},
 {pos =Vector(-66.6,-25.5,65.6),size = 25},
	},

	DelayOn = 0.5,
	DelayOff = 0.25,

}
list.Set( "simfphys_lights", "stalkertractor", light_table)


local V = {
	Name = "Лада нива",
	Model = "models/DiggerCars/stalker/niva.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Автомобили",

	Members = {
		Mass = 1550,
		LightsTable = "stalkerniva",			
		EnginePos = Vector(57,0,40),
		
		OnSpawn = 
			function(ent) 
			ent:SetSkin(math.random(0,4))
		end,
		
		FirstPersonViewPos =  Vector(0,-4,5),
		
		AirFriction = -8000,
		
		CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		CustomWheelModel = "models/DiggerCars/stalker/niva_wheel.mdl",
		CustomWheelPosFL = Vector(58,30,18),
		CustomWheelPosFR = Vector(58,-30,18),
		CustomWheelPosRL = Vector(-37,30,18),	
		CustomWheelPosRR = Vector(-37,-30,18),
		CustomWheelAngleOffset = Angle(0,90,0),
           	MaxHealth = 1500,		
		CustomMassCenter = Vector(0,0,3),
		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(-3,-16,54),
		SeatPitch = 0,
		SeatYaw = 90,
		
		PassengerSeats = {
			{
				pos = Vector(8,-17,19),
				ang = Angle(0,-90,20)
			},
		},
		
		FrontHeight = 7,
		FrontConstant = 40000,
		FrontDamping = 1800,
		FrontRelativeDamping = 2800,
		
		RearHeight = 7,
		RearConstant = 40000,
		RearDamping = 2800,
		RearRelativeDamping = 2800,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 400,
		
		TurnSpeed = 4,
		
		MaxGrip = 45,
		Efficiency = 1.0,
		GripOffset = -1,
		BrakePower = 30,
		
		IdleRPM = 600,
		LimitRPM = 6500,
		PeakTorque = 85,
		PowerbandStart = 2000,
		PowerbandEnd = 6000,
		Turbocharged = false,
		Supercharged = false,
		
		FuelFillPos = Vector(-17,-35,35),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 42,
		
		PowerBias = 0,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/generic5/generic5_idle.wav",
		Sound_IdlePitch = 1.05,
		
		Sound_Mid = "simulated_vehicles/generic5/generic5_mid.wav",
		Sound_MidPitch = 0.8,
		Sound_MidVolume = 2,
		Sound_MidFadeOutRPMpercent = 100,
		Sound_MidFadeOutRate = 1,
		
		Sound_High = "",
		
		Sound_Throttle = "",

		
		DifferentialGear = 0.4,
		Gears = {-0.1,0,0.1,0.2,0.28,0.32,0.35}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_stalkerniva", V )






local V = {
	Name = "КАМАЗ 4310 Кузов",
	Model = "models/DiggerCars/stalker/kamaz_full.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Грузовики",

	Members = {
		Mass = 7000,
		OnSpawn = 
			function(ent) 
			ent:SetSkin(math.random(0,6))
		end,
		EnginePos = Vector(76,0,47),
		
		FirstPersonViewPos =  Vector(0,-8,6),
		
		AirFriction = -8000,
		LightsTable = "stalkerkamaz",			
		CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		CustomWheelModel_R = "models/salza/skoda_liaz/skoda_liaz_rwheel.mdl",		
		CustomWheelModel = "models/salza/skoda_liaz/skoda_liaz_fwheel.mdl",
		CustomWheelPosFL = Vector(107.1,44,26),
		CustomWheelPosFR = Vector(107.1,-44,26),
		CustomWheelPosML = Vector(-37.5,37,26),
		CustomWheelPosMR = Vector(-37.5,-37,26),
		CustomWheelPosRL = Vector(-96,38,26),	
		CustomWheelPosRR = Vector(-96,-38,26),
		CustomWheelAngleOffset = Angle(0,180,0),
		RearWheelMass = 300,		
		CustomMassCenter = Vector(2,0,4),
           	MaxHealth = 4500,		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(114,-29,95),
		SeatPitch = 0,
		SeatYaw = 90,
		
		PassengerSeats = {
			{
				pos = Vector(123,-25,64),
				ang = Angle(0,-90,20)
			},
			{
				pos = Vector(93,0,69),
				ang = Angle(0,-90,20)
			},
		},
		ExhaustPositions = {
			{
				pos = Vector(73,31,135),
				ang = Angle(135,180,0)
			},
			{
				pos = Vector(73,31,135),
				ang = Angle(135,180,0)
			},
			{
				pos = Vector(73,31,135),
				ang = Angle(135,180,0)
			},
		},
		
		FrontHeight = 15,
		FrontConstant = 900000,
		FrontDamping = 28000,
		FrontRelativeDamping = 28000,
		
		RearHeight = 12,
		RearConstant = 900000,
		RearDamping = 28000,
		RearRelativeDamping = 28000,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 400,
		
		TurnSpeed = 1,
		
		MaxGrip = 90,
		Efficiency = 1.4,
		GripOffset = -1,
		BrakePower = 30,
		
		IdleRPM = 400,
		LimitRPM = 4500,
		PeakTorque = 85,
		PowerbandStart = 2000,
		PowerbandEnd = 4000,
		Turbocharged = false,
		Supercharged = false,
		
		FuelFillPos = Vector(28.4746,-44.41,47.5),
		FuelType = FUELTYPE_DIESEL,
		FuelTankSize = 210,
		
		PowerBias = 1,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "vehicles/crane/crane_startengine1.wav",
		Sound_IdlePitch = 1.05,
		
		Sound_Mid = "simulated_vehicles/alfaromeo/alfaromeo_low.wav",
		Sound_MidPitch = 1,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 100,
		Sound_MidFadeOutRate = 1,

		Sound_High = "",
		
		Sound_Throttle = "",
		
		DifferentialGear = 0.3,
		Gears = {-0.16,0,0.15,0.2,0.25,0.32}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_stalkerkamaztent", V )

local light_table = {
		L_HeadLampPos = Vector( 170, 65, 55 ),
	L_HeadLampAng = Angle(10,5,0),
	R_HeadLampPos = Vector( 170, -65, 55 ),
	R_HeadLampAng = Angle(10,-5,0),
	
	L_RearLampPos = Vector(-180,34,50),
	L_RearLampAng = Angle(25,180,0),
	R_RearLampPos = Vector(-180,-34,50),
	R_RearLampAng = Angle(25,180,0),

	Headlight_sprites = {
{pos =Vector(161,36,57),size = 55}, 
{pos =Vector(161,-36,57),size = 55},
	},
	Headlamp_sprites = { 
{pos =Vector(161,36,57),size = 55}, 
{pos =Vector(161,-36,57),size = 55},
	},
	Rearlight_sprites = { 
 {pos =Vector(-176.3,34,51),size = 25},
 {pos =Vector(-176.3,-34,51),size = 25},
	},
	Brakelight_sprites = {
 {pos =Vector(-176.3,34,51),size = 25},
 {pos =Vector(-176.3,-34,51),size = 25},
	},

	DelayOn = 0.5,
	DelayOff = 0.25,

}
list.Set( "simfphys_lights", "stalkerkamaz", light_table)

local V = {
	Name = "ГАЗ 52",
	Model = "models/DiggerCars/stalker/molokovoz.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Грузовики",

	Members = {
		Mass = 4000,
		
		EnginePos = Vector(100,0,57),
		
		FirstPersonViewPos =  Vector(0,-8,6),
		
		AirFriction = -8000,	
		CustomWheels = true,
		CustomSuspensionTravel = 10,
		LightsTable = "stalkergaz52",		
		CustomWheelModel = "models/DiggerCars/stalker/molokovoz_wheelf.mdl",
		CustomWheelModel_R = "models/DiggerCars/stalker/molokovoz_wheelr.mdl",
		CustomWheelPosFL = Vector(99,37,18),
		CustomWheelPosFR = Vector(99,-37,18),
		CustomWheelPosRL = Vector(-67.3,35,18),	
		CustomWheelPosRR = Vector(-67.3,-35,18),
		CustomWheelAngleOffset = Angle(0,-90,0),
		RearWheelMass = 200,		
		CustomMassCenter = Vector(2,0,24),
        MaxHealth = 4000,		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(38,-16,72),
		SeatPitch = 0,
		SeatYaw = 90,
		
		PassengerSeats = {
			{
				pos = Vector(50,-16,43),
				ang = Angle(0,-90,20)
			},

		},
		
		FrontHeight = 13,
		FrontConstant = 50000,
		FrontDamping = 5000,
		FrontRelativeDamping = 5000,
		
		RearHeight = 13,
		RearConstant = 50000,
		RearDamping = 5000,
		RearRelativeDamping = 5000,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 400,
		
		TurnSpeed = 1,
		
		MaxGrip = 90,
		Efficiency = 1.4,
		GripOffset = -1,
		BrakePower = 30,
		
		IdleRPM = 400,
		LimitRPM = 4500,
		PeakTorque = 85,
		PowerbandStart = 2000,
		PowerbandEnd = 4000,
		Turbocharged = false,
		Supercharged = false,
		
		FuelFillPos = Vector(-8,-45,34.6),
		FuelType = FUELTYPE_DIESEL,
		FuelTankSize = 210,
		
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
		
		Sound_Throttle = "simulated_vehicles/alfaromeo/alfaromeo_mid.wav",
		
		snd_horn = "simulated_vehicles/horn_2.wav",
		
		DifferentialGear = 0.3,
		Gears = {-0.1,0,0.1,0.2,0.28,0.32}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_stalkergaz52", V )


local light_table = {
		L_HeadLampPos = Vector( 130, 33, 70 ),
	L_HeadLampAng = Angle(10,5,0),
	R_HeadLampPos = Vector( 130, -33, 70 ),
	R_HeadLampAng = Angle(10,-5,0),

	Headlight_sprites = {
{pos =Vector(124,51.4,66.6),size = 55}, 
{pos =Vector(124,-51.4,66.6),size = 55}, 
{pos =Vector(114.7,43.8,75.5),size = 55}, 
{pos =Vector(114.7,-43.8,75.5),size = 55}, 
	},
	Headlamp_sprites = { 
{pos =Vector(124,51.4,66.6),size = 55}, 
{pos =Vector(124,-51.4,66.6),size = 55}, 
{pos =Vector(114.7,43.8,75.5),size = 55}, 
{pos =Vector(114.7,-43.8,75.5),size = 55}, 
	},

	DelayOn = 0.5,
	DelayOff = 0.25,

}
list.Set( "simfphys_lights", "stalkerbtr", light_table)


local light_table = {

	R_HeadLampPos = Vector( 120, -35, 40 ),
	R_HeadLampAng = Angle(10,-5,0),
	L_HeadLampPos = Vector( 120, 35, 40 ),
	L_HeadLampAng = Angle(10,5,0),	
	L_RearLampPos = Vector(-100,35,30),
	L_RearLampAng = Angle(25,180,0),
	R_RearLampPos = Vector(-100,-35,30),
	R_RearLampAng = Angle(25,180,0),

	Headlight_sprites = {
{pos =Vector(113.8,-35.6,40.7),size = 55}, 
{pos =Vector(113.8,35.6,40.7),size = 55}, 
	},
	Headlamp_sprites = { 
{pos =Vector(113.8,-35.6,40.7),size = 55}, 
{pos =Vector(113.8,35.6,40.7),size = 55}, 
	},
	Rearlight_sprites = { 
 {pos =Vector(-93.35,35.86,32.9),size = 25},
 {pos =Vector(-93.35,-35.86,32.9),size = 25},
	},
	Brakelight_sprites = {
 {pos =Vector(-93.35,35.86,32.9),size = 25},
 {pos =Vector(-93.35,-35.86,32.9),size = 25},
	},
	DelayOn = 0.5,
	DelayOff = 0.25,

}
list.Set( "simfphys_lights", "stalkerzil", light_table)


local V = {
	Name = "РАФ-2203 Кузов",
	Model = "models/DiggerCars/stalker/raf.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Грузовики",

	Members = {
		Mass = 2050,
		LightsTable = "stalkerraf",			
		EnginePos = Vector(104,0,26),
		OnSpawn = 
			function(ent) 
			ent:SetSkin(math.random(0,1))
		end,
		FirstPersonViewPos =  Vector(0,-4,5),
		
		AirFriction = -8000,
		
		CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		CustomWheelModel = "models/DiggerCars/stalker/raf_wheel.mdl",
		CustomWheelPosFL = Vector(66.8,35,8),
		CustomWheelPosFR = Vector(66.8,-35,8),
		CustomWheelPosRL = Vector(-37,35,8),	
		CustomWheelPosRR = Vector(-37,-35,8),
		CustomWheelAngleOffset = Angle(0,-90,0),
           	MaxHealth = 3000,		
		CustomMassCenter = Vector(0,0,3),
		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(60,-21,52),
		SeatPitch = 0,
		SeatYaw = 90,
		
		PassengerSeats = {
			{
				pos = Vector(73,-19,18),
				ang = Angle(0,-90,20)
			},
		},
		
		FrontHeight = 7,
		FrontConstant = 50000,
		FrontDamping = 3800,
		FrontRelativeDamping = 3800,
		
		RearHeight = 7,
		RearConstant = 50000,
		RearDamping = 3800,
		RearRelativeDamping = 3800,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 400,
		
		TurnSpeed = 2,
		
		MaxGrip = 55,
		Efficiency = 1.2,
		GripOffset = -1,
		BrakePower = 30,
		
		IdleRPM = 600,
		LimitRPM = 6500,
		PeakTorque = 45,
		PowerbandStart = 2000,
		PowerbandEnd = 6000,
		Turbocharged = false,
		Supercharged = false,
		
		FuelFillPos = Vector(28,-38,18),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 80,
		
		PowerBias = 1,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/generic2/generic2_idle.wav",
		Sound_IdlePitch = 1.05,
		
		Sound_Mid = "simulated_vehicles/generic2/generic2_mid.wav",
		Sound_MidPitch = 0.8,
		Sound_MidVolume = 2,
		Sound_MidFadeOutRPMpercent = 100,
		Sound_MidFadeOutRate = 1,
		
		Sound_High = "",
		
		Sound_Throttle = "",
		
		DifferentialGear = 0.4,
		Gears = {-0.1,0,0.1,0.2,0.28,0.32,0.35}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_stalkerraf", V )


local light_table = {

	R_HeadLampPos = Vector( 120, -25, 30 ),
	R_HeadLampAng = Angle(10,-5,0),
	L_HeadLampPos = Vector( 120, 25, 30 ),
	L_HeadLampAng = Angle(10,5,0),	
	L_RearLampPos = Vector(-90,22,30),
	L_RearLampAng = Angle(25,180,0),
	R_RearLampPos = Vector(-90,-22,30),
	R_RearLampAng = Angle(25,180,0),

	Headlight_sprites = {
{pos =Vector(112,-28.3,26),size = 55}, 
{pos =Vector(112,28.3,26),size = 55}, 
	},
	Headlamp_sprites = { 
{pos =Vector(112,-28.3,26),size = 55}, 
{pos =Vector(112,28.3,26),size = 55}, 
	},
	Rearlight_sprites = { 
 {pos =Vector(-88,21,17.7),size = 25},
 {pos =Vector(-88,-21,17.7),size = 25},
	},
	Brakelight_sprites = {
 {pos =Vector(-88,21,17.7),size = 25},
 {pos =Vector(-88,-21,17.7),size = 25},
	},
	DelayOn = 0.5,
	DelayOff = 0.25,

}
list.Set( "simfphys_lights", "stalkerraf", light_table)
