
AddCSLuaFile()

local light_table = {
	L_HeadLampPos = Vector(94,25,18),
	L_HeadLampAng = Angle(0,0,0),

	R_HeadLampPos = Vector(94,-25,18),
	R_HeadLampAng = Angle(0,0,0),

	L_RearLampPos = Vector(-89,36,22),
	L_RearLampAng = Angle(0,180,0),

	R_RearLampPos = Vector(-89,-36,22),
	R_RearLampAng = Angle(0,180,0),
	
	Headlight_sprites = { 
		Vector(94,30,18),
		Vector(94,-30,18),
	},
	Headlamp_sprites = { 
		Vector(94,30,18),
		Vector(94,-30,18),
		Vector(94,29,20),
		Vector(94,-29,20),
		Vector(94,31,18),
		Vector(94,-31,18),
	},
	FogLight_sprites = {
        Vector(94,30,13),
		Vector(94,-30,13),
		Vector(94,32,13),
		Vector(94,-32,13),
		Vector(94,28,13),
		Vector(94,-28,13),
	},
	Rearlight_sprites = {
		{pos = Vector(-88,38,22), color = Color(210, 0, 0, 200), size = 15},
		{pos = Vector(-88,-38,22), color = Color(210, 0, 0, 200), size = 15},
		{pos = Vector(-88,37,22), color = Color(210, 0, 0, 200), size = 15},
		{pos = Vector(-88,-37,22), color = Color(210, 0, 0, 200), size = 15},
		{pos = Vector(-88,36,22), color = Color(210, 0, 0, 200), size = 15},
		{pos = Vector(-88,-36,22), color = Color(210, 0, 0, 200), size = 15},
	},
	Brakelight_sprites = {
		{pos = Vector(-88,38,19), color = Color(210, 0, 0, 200), size = 15},
		{pos = Vector(-88,-38,19), color = Color(210, 0, 0, 200), size = 15},
		{pos = Vector(-88,37,19), color = Color(210, 0, 0, 200), size = 15},
		{pos = Vector(-88,-37,19), color = Color(210, 0, 0, 200), size = 15},
		{pos = Vector(-88,36,19), color = Color(210, 0, 0, 200), size = 15},
		{pos = Vector(-88,-36,19), color = Color(210, 0, 0, 200), size = 15},
	},
	Reverselight_sprites = {
		Vector(-89,35.5,12),
		Vector(-89,-35.5,12),
		Vector(-89,37.5,12),
		Vector(-89,-37.5,12),
	},
	Turnsignal_sprites = {
		Left = {
		Vector(92,38.5,13),
		Vector(92,38.5,15),
		Vector(92,38.5,17),
		Vector(92,38.5,19),
		Vector(92,38.5,21),
		Vector(92,38.5,23),
		
		Vector(-89,36,14),
		Vector(-89,36,16),
		Vector(-89,38,14),
		Vector(-89,38,16),
		Vector(-87,40,14),
		Vector(-87,40,16),
		Vector(-87,40,12),
		},
		Right = {
		Vector(92,-38.5,13),
		Vector(92,-38.5,15),
		Vector(92,-38.5,17),
		Vector(92,-38.5,19),
		Vector(92,-38.5,21),
		Vector(92,-38.5,23),
		
		Vector(-89,-36,14),
		Vector(-89,-36,16),
		Vector(-89,-38,14),
		Vector(-89,-38,16),
		Vector(-87,-40,14),
		Vector(-87,-40,16),
		Vector(-87,-40,12),
		},
	}
}
list.Set( "simfphys_lights", "CP_JCV", light_table)

local V = {
	Name = "Jeep Cherokee",
	Model = "models/bms_jcv/jcv_rigged.mdl",
	ModelOffset = Angle(0,90,20),
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Автомобили",
	SpawnAngleOffset = 90,
	
	Members = {
		Mass = 1900,
		
		CustomMassCenter = Vector(3,0,10),
		EnginePos = Vector(45,0,10),
		
		SpeedoMax = 140,
		
		OnSpawn = 
		function(ent) 
			ent:SetSkin(math.random(0,2))
		end,
		
		LightsTable = "CP_JCV",
		
		CustomWheels = true,
		CustomSuspensionTravel = 15,
		
		CustomWheelModel = "models/bms_jcv/jcv_wheel.mdl",
	    CustomWheelPosFL = Vector(69,39,0),
		CustomWheelPosFR = Vector(69,-39,0),
		CustomWheelPosRL = Vector(-51,39,0),	
		CustomWheelPosRR = Vector(-51,-39,0),
		CustomWheelAngleOffset = Angle(0,180,0),
		
		CustomSteerAngle = 30,
		
		SeatOffset = Vector(0,-20,40),
        SeatPitch = 0,
		SeatYaw = 90,
		
		PassengerSeats = {
			{
				pos = Vector(0,-20,5),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(-30,17,5),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(-30,0,5),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(-30,-17,5),
				ang = Angle(0,-90,0)
			},
		},
				
		ExhaustPositions = {
			{
				pos = Vector(-90,-19,-2),
				ang = Angle(-110,0,0)
			},
		},
		
		FuelFillPos = Vector(-72,40,22),
		FuelType = FUELTYPE_DIESEL,
		FuelTankSize = 80,
		
		StrengthenSuspension = false,
		
		FrontHeight = 10,
		FrontConstant = 38000,
		FrontDamping = 2000,
		FrontRelativeDamping = 2000,
		
		RearHeight = 10,
		RearConstant = 38000,
		RearDamping = 2000,
		RearRelativeDamping = 2000,
		
		FastSteeringAngle = 30,
		SteeringFadeFastSpeed = 245,
		
		TurnSpeed = 5,
		
		MaxGrip = 65,
		Efficiency = 0.85,
		GripOffset = -2,
		BrakePower = 35,
		
		IdleRPM = 700,
		LimitRPM = 7000,
		PeakTorque = 130,
		PowerbandStart = 1000,
		PowerbandEnd = 6000,
		Turbocharged = false,
		Supercharged = false,
		
		PowerBias = 0,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/alfaromeo/alfons_idle.wav",
		Sound_IdlePitch = 0.8,
		
		Sound_Mid = "simulated_vehicles/alfaromeo/alfaromeo_low.wav",
		Sound_MidPitch = 0.7,
		Sound_MidVolume = 3,
		Sound_MidFadeOutRPMpercent = 40,		-- at wich percentage of limitrpm the sound fades out
		Sound_MidFadeOutRate = 0.34,                    --how fast it fades out   0 = instant       1 = never
		
		Sound_High = "simulated_vehicles/alfaromeo/alfaromeo_mid.wav",
		Sound_HighPitch = 0.6,
		Sound_HighVolume = 4.0,
		Sound_HighFadeInRPMpercent = 25,
		Sound_HighFadeInRate = 0.24,
		
		Sound_Throttle = "",		-- mutes the default throttle sound
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "simulated_vehicles/horn_3.wav",
		
		DifferentialGear = 0.50,
		Gears = {-0.11,0,0.06,0.14,0.22,0.30,0.37}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_bms_jcv", V )