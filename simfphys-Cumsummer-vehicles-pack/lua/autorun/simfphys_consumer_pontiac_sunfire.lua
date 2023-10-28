
AddCSLuaFile()

local light_table = {
	L_HeadLampPos = Vector(92,20,32),
	L_HeadLampAng = Angle(0,0,0),

	R_HeadLampPos = Vector(92,-20,32),
	R_HeadLampAng = Angle(0,0,0),

	L_RearLampPos = Vector(-97,20,38),
	L_RearLampAng = Angle(0,180,0),

	R_RearLampPos = Vector(-97,-20,38),
	R_RearLampAng = Angle(0,180,0),
	
	Headlight_sprites = { 
		Vector(92,20,32),
		Vector(92,21,31),
		
		Vector(92,-20,32),
		Vector(92,-21,31),
	},
	Headlamp_sprites = { 
		Vector(92,25,32),
		Vector(92,24,31),
		
		Vector(92,-25,32),
		Vector(92,-24,31),
	},
	FogLight_sprites = {
		Vector(93,22,28),
		Vector(93,24,28),
		
		Vector(93,-22,28),
		Vector(93,-24,28),
	},
	Rearlight_sprites = {
		{pos = Vector(-97,19,39), color = Color(210, 0, 0, 200), size = 30},
		{pos = Vector(-97,-19,39), color = Color(210, 0, 0, 200), size = 30},
		{pos = Vector(-97,19,38), color = Color(210, 0, 0, 200), size = 30},
		{pos = Vector(-97,-19,38), color = Color(210, 0, 0, 200), size = 30},
		{pos = Vector(-75,0,49), color = Color(210, 0, 0, 200), size = 30},
	},
	Brakelight_sprites = {
		{pos = Vector(-94,24,39), color = Color(210, 0, 0, 200), size = 25},
		{pos = Vector(-94,24,38), color = Color(210, 0, 0, 200), size = 25},
		
		{pos = Vector(-94,-24,39), color = Color(210, 0, 0, 200), size = 25},
		{pos = Vector(-94,-24,38), color = Color(210, 0, 0, 200), size = 25},
		
		{pos = Vector(-75,0,49), color = Color(210, 0, 0, 200), size = 15},
		{pos = Vector(-75,1,49), color = Color(210, 0, 0, 200), size = 15},
		{pos = Vector(-75,-1,49), color = Color(210, 0, 0, 200), size = 15},
		
		{pos = Vector(-100.5,19,23), color = Color(210, 0, 0, 200), size = 15},
		{pos = Vector(-100.5,-19,23), color = Color(210, 0, 0, 200), size = 15},
		{pos = Vector(-101,18,23), color = Color(210, 0, 0, 200), size = 15},
		{pos = Vector(-101,-18,23), color = Color(210, 0, 0, 200), size = 15},
		{pos = Vector(-100,20,23), color = Color(210, 0, 0, 200), size = 15},
		{pos = Vector(-100,-20,23), color = Color(210, 0, 0, 200), size = 15},
	},
	Reverselight_sprites = {
		Vector(-100.5,19,21),
		Vector(-100.5,-19,21),
		Vector(-101,17,21),
		Vector(-101,-17,21),
		Vector(-100,21,21),
		Vector(-100,-21,21),
	},
			Turnsignal_sprites = {
		Left = {
			Vector(95,28,22),
			Vector(94,29,22),
			Vector(93,30,22),
			Vector(92,31,22),
			Vector(91,32,22),
			Vector(90,33,22),
			Vector(89,34,22),
			Vector(88,35,22),
			
			{pos = Vector(-91,31,37.5), color = Color(220, 50, 0, 230), size = 32},
			{pos = Vector(-91,31,38.5), color = Color(220, 50, 0, 230), size = 32},
		},
		Right = {
			Vector(95,-28,22),
			Vector(94,-29,22),
			Vector(93,-30,22),
			Vector(92,-31,22),
			Vector(91,-32,22),
			Vector(90,-33,22),
			Vector(89,-34,22),
			Vector(88,-35,22),
			
			{pos = Vector(-91,-31,37.5), color = Color(220, 50, 0, 230), size = 32},
			{pos = Vector(-91,-31,38.5), color = Color(220, 50, 0, 230), size = 32},
		},
	}
}
list.Set( "simfphys_lights", "CP_PontiacSunfire", light_table)

local V = {
	Name = "Pontiac Sunfire",
	Model = "models/consumerpack/pontiac_sunfire/1995_pontiac_sunfire_rigged.mdl",
	ModelOffset = Angle(0,90,0),
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Автомобили",
	SpawnAngleOffset = 90,
	
	Members = {
		Mass = 1182,
		
		CustomMassCenter = Vector(3,0,8),
		EnginePos = Vector(45,0,20),
		
		SpeedoMax = 140,
		
		OnSpawn = 
		function(ent) 
			ent:SetSkin(math.random(0,12))
		end,
		
		LightsTable = "CP_PontiacSunfire",
		
		CustomWheels = true,
		CustomSuspensionTravel = 11,
		
		CustomWheelModel = "models/consumerpack/pontiac_sunfire/pontiac_sunfire_wheel.mdl",
	    CustomWheelPosFL = Vector(59,34,15),
		CustomWheelPosFR = Vector(59,-34,15),
		CustomWheelPosRL = Vector(-60,34,15),	
		CustomWheelPosRR = Vector(-60,-34,15),
		CustomWheelAngleOffset = Angle(0,0,0),
		
		CustomSteerAngle = 30,
		
		SeatOffset = Vector(-5,-15,47),
        SeatPitch = 0,
		SeatYaw = 90,
		
		PassengerSeats = {
			{
				pos = Vector(0,-15,13),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(-36,-15,13),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(-36,15,13),
				ang = Angle(0,-90,0)
			},
		},
				
		ExhaustPositions = {
			{
				pos = Vector(-100,18,14),
				ang = Angle(0,-90,90)
			},
			{
				pos = Vector(-100,21,14),
				ang = Angle(0,-90,90)
			},
		},
		
		FuelFillPos = Vector(-72,-35,37),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 60,
		
		StrengthenSuspension = false,
		
		FrontHeight = 6,
		FrontConstant = 28000,
		FrontDamping = 1000,
		FrontRelativeDamping = 1000,
		
		RearHeight = 6,
		RearConstant = 28000,
		RearDamping = 1000,
		RearRelativeDamping = 1000,
		
		FastSteeringAngle = 30,
		SteeringFadeFastSpeed = 245,
		
		TurnSpeed = 3,
		
		MaxGrip = 45,
		Efficiency = 0.82,
		GripOffset = -2,
		BrakePower = 20,
		
		IdleRPM = 700,
		LimitRPM = 7000,
		PeakTorque = 140,
		PowerbandStart = 2000,
		PowerbandEnd = 6000,
		Turbocharged = false,
		Supercharged = false,
		
		PowerBias = -1,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/generic3/generic3_idle.wav",
		Sound_IdlePitch = 1.1,
		
		Sound_Mid = "simulated_vehicles/generic1/generic1_low.wav",
		Sound_MidPitch = 0.7,
		Sound_MidVolume = 4,
		Sound_MidFadeOutRPMpercent = 70,		-- at wich percentage of limitrpm the sound fades out
		Sound_MidFadeOutRate = 0.77,                    --how fast it fades out   0 = instant       1 = never
		
		Sound_High = "simulated_vehicles/generic1/generic1_mid.wav",
		Sound_HighPitch = 0.8,
		Sound_HighVolume = 3.0,
		Sound_HighFadeInRPMpercent = 45,
		Sound_HighFadeInRate = 0.54,
		
		Sound_Throttle = "",		-- mutes the default throttle sound
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "simulated_vehicles/horn_3.wav",
		
		DifferentialGear = 0.55,
		Gears = {-0.11,0,0.11,0.20,0.29,0.37,0.44}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_cp_sunfire", V )