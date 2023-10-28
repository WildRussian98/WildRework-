
AddCSLuaFile()

local light_table = {
	L_HeadLampPos = Vector(-30,128,48),
	L_HeadLampAng = Angle(0,90,0),

	R_HeadLampPos = Vector(30,128,48),
	R_HeadLampAng = Angle(0,90,0),

	L_RearLampPos = Vector(-40,-130,47),
	L_RearLampAng = Angle(0,-90,0),

	R_RearLampPos = Vector(40,-130,47),
	R_RearLampAng = Angle(0,-90,0),
	
	Headlight_sprites = { 
		Vector(-30,128,48.5),
		Vector(30,128,48.5),
	},
	Headlamp_sprites = { 
		Vector(-30,128,48.5),
		Vector(30,128,48.5),
	},
	FogLight_sprites = { 
		Vector(-30,128,48.5),
		Vector(30,128,48.5),
	},
	Rearlight_sprites = {
		{pos = Vector(-35,-128,37), color = Color(210, 0, 0, 230), size = 20},
		{pos = Vector(35,-128,37), color = Color(210, 0, 0, 230), size = 20},
	},
	Brakelight_sprites = {
		{pos = Vector(-35,-128,37), color = Color(210, 0, 0, 250), size = 20},
		{pos = Vector(35,-128,37), color = Color(210, 0, 0, 250), size = 20},
	},
	Turnsignal_sprites = {
		Left = {
		{pos = Vector(-34,78.5,62), size = 20},
		{pos = Vector(-35,-130,48), size = 30},
		},
		Right = {
		{pos = Vector(34,78.5,62), size = 20},
		{pos = Vector(35,-130,48), size = 30},
		},
	}
}
list.Set( "simfphys_lights", "opel_blitz", light_table)

local V = {
	Name = "Opel Blitz",
	Model = "models/opel_blitz/opel_blitz_rigged.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Грузовики",

	Members = {
		Mass = 3500,
		
		CustomMassCenter = Vector(0,0,17),
		EnginePos = Vector(0,80,40),
		
		SpeedoMax = 60,
		
		LightsTable = "opel_blitz",
		
		MaxHealth = 3800,
		
		CustomWheels = true,
		CustomSuspensionTravel = 20,
		
		CustomWheelModel = "models/opel_blitz/opel_f_wheel.mdl",
		CustomWheelModel_R = "models/opel_blitz/opel_r_wheel.mdl",
		CustomWheelPosFL = Vector(-39,100,20),
		CustomWheelPosFR = Vector(39,100,20),
		CustomWheelPosRL = Vector(-37.5,-65,20),	
		CustomWheelPosRR = Vector(37.5,-65,20),
		CustomWheelAngleOffset = Angle(0,0,0),
		
		CustomSteerAngle = 30,
		
		SeatOffset = Vector(42,-17,75),
		SeatPitch = 0,
		
		PassengerSeats = {
			{
				pos = Vector(17,42,40),
				ang = Angle(0,0,0)
			}
		},
		
				
		ExhaustPositions = {
			{
				pos = Vector(-23,-36,23),
				ang = Angle(-80,40,0)
			},
		},
		
		FuelFillPos = Vector(0,131,34.5),
		FuelType = FUELTYPE_DIESEL,
		FuelTankSize = 90,
		
		StrengthenSuspension = true,
		
		FrontHeight = 11,
		FrontConstant = 45000,
		FrontDamping = 2100,
		FrontRelativeDamping = 2100,
		
		RearHeight = 11,
		RearConstant = 45000,
		RearDamping = 2100,
		RearRelativeDamping = 2100,
		
		FastSteeringAngle = 30,
		SteeringFadeFastSpeed = 215,
		
		TurnSpeed = 4,
		
		MaxGrip = 60,
		Efficiency = 0.85,
		GripOffset = -1,
		BrakePower = 30,
		
		IdleRPM = 600,
		LimitRPM = 5000,
		PeakTorque = 80,
		PowerbandStart = 1000,
		PowerbandEnd = 4500,
		Turbocharged = false,
		Supercharged = false,
		
		PowerBias = 0,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/jeep/jeep_idle.wav",
		Sound_IdlePitch = 0.8,
		
		Sound_Mid = "simulated_vehicles/jeep/jeep_mid.wav",
		Sound_MidPitch = 0.8,
		Sound_MidVolume = 3,
		Sound_MidFadeOutRPMpercent = 57,		-- at wich percentage of limitrpm the sound fades out
		Sound_MidFadeOutRate = 0.476,                    --how fast it fades out   0 = instant       1 = never
		
		Sound_High = "simulated_vehicles/jeep/jeep_low.wav",
		Sound_HighPitch = 0.4,
		Sound_HighVolume = 7.0,
		Sound_HighFadeInRPMpercent = 30,
		Sound_HighFadeInRate = 0.19,
		
		Sound_Throttle = "",		-- mutes the default throttle sound
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "simulated_vehicles/horn_1.wav",
		
		DifferentialGear = 0.4,
		Gears = {-0.11,0,0.06,0.15,0.22}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_opel_blitz", V )