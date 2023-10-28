AddCSLuaFile()

local light_table = {
	L_HeadLampPos = Vector(103,30,32),
	L_HeadLampAng = Angle(0,0,0),

	R_HeadLampPos = Vector(103,-30,32),
	R_HeadLampAng = Angle(0,0,0),

	L_RearLampPos = Vector(-105,36,43),
	L_RearLampAng = Angle(0,180,0),

	R_RearLampPos = Vector(-105,-36,43),
	R_RearLampAng = Angle(0,180,0),
	
	Headlight_sprites = { 
		Vector(101,30,32),
		Vector(101,29,32),
		
		Vector(101,-30,32),
		Vector(101,-29,32),
	},
	Headlamp_sprites = { 
		Vector(103,25,32),
		Vector(104,24,32),
		
		Vector(103,-25,32),
		Vector(104,-24,32),
	},
	FogLight_sprites = {
		Vector(101,28,32),
		Vector(101,-28,32),
	},
	Rearlight_sprites = {
		{pos = Vector(-105,36,43), color = Color(190, 0, 0, 200), size = 25},
		{pos = Vector(-104,37,43), color = Color(190, 0, 0, 200), size = 25},
		
		{pos = Vector(-105,-36,43), color = Color(190, 0, 0, 200), size = 25},
		{pos = Vector(-104,-37,43), color = Color(190, 0, 0, 200), size = 25},
		
		{pos = Vector(-108,1,52), color = Color(190, 0, 0, 200), size = 10},
		{pos = Vector(-108,0,52), color = Color(190, 0, 0, 200), size = 10},
		{pos = Vector(-108,-1,52), color = Color(190, 0, 0, 200), size = 10},
	},
	Brakelight_sprites = {
		{pos = Vector(-105,36,39), color = Color(190, 0, 0, 200), size = 25},
		{pos = Vector(-104,37,39), color = Color(190, 0, 0, 200), size = 25},
		
		{pos = Vector(-105,-36,39), color = Color(190, 0, 0, 200), size = 25},
		{pos = Vector(-104,-37,39), color = Color(190, 0, 0, 200), size = 25},
		
		{pos = Vector(-108,2,52), color = Color(190, 0, 0, 200), size = 10},
		{pos = Vector(-108,1,52), color = Color(190, 0, 0, 200), size = 10},
		{pos = Vector(-108,0,52), color = Color(190, 0, 0, 200), size = 10},
		{pos = Vector(-108,-1,52), color = Color(190, 0, 0, 200), size = 10},
		{pos = Vector(-108,-2,52), color = Color(190, 0, 0, 200), size = 10},
	},
	Reverselight_sprites = {
		{pos = Vector(-105,36,34), color = Color(250, 250, 250, 190), size = 10},
		{pos = Vector(-104,37,34), color = Color(250, 250, 250, 190), size = 10},
		{pos = Vector(-103,38,34), color = Color(250, 250, 250, 190), size = 10},
		{pos = Vector(-102,39,34), color = Color(250, 250, 250, 190), size = 10},
		
		{pos = Vector(-105,-36,34), color = Color(250, 250, 250, 190), size = 10},
		{pos = Vector(-104,-37,34), color = Color(250, 250, 250, 190), size = 10},
		{pos = Vector(-103,-38,34), color = Color(250, 250, 250, 190), size = 10},
		{pos = Vector(-102,-39,34), color = Color(250, 250, 250, 190), size = 10},
	},
			Turnsignal_sprites = {
		Left = {
			{pos = Vector(98,35,33), size = 30},
			{pos = Vector(97,36,33), size = 30},
			{pos = Vector(96,37,33), size = 30},
			{pos = Vector(95,38,33), size = 30},
		    --///--- Rear Lights
			{pos = Vector(-102,39,39), color = Color(160, 0, 0, 190), size = 20},
			{pos = Vector(-102,39,38), color = Color(160, 0, 0, 190), size = 20},
			{pos = Vector(-102,39,37), color = Color(160, 0, 0, 190), size = 20},
		},
		Right = {
			{pos = Vector(98,-35,33), size = 30},
			{pos = Vector(97,-36,33), size = 30},
			{pos = Vector(96,-37,33), size = 30},
			{pos = Vector(95,-38,33), size = 30},
			---///--- Rear Lights
			{pos = Vector(-102,-39,39), color = Color(160, 0, 0, 190), size = 20},
			{pos = Vector(-102,-39,38), color = Color(160, 0, 0, 190), size = 20},
			{pos = Vector(-102,-39,37), color = Color(160, 0, 0, 190), size = 20},
		},
	}
}
list.Set( "simfphys_lights", "CP_GrandVoyager", light_table)

local V = {
	Name = "Plymouth Grand",
	Model = "models/consumerpack/grand_voyager/1996_plymouth_grand_voyager_rigged.mdl",
	ModelOffset = Angle(0,90,0),
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Автомобили",
	SpawnAngleOffset = 90,
	
	Members = {
		Mass = 1704,
		
		CustomMassCenter = Vector(3,0,10),
		EnginePos = Vector(45,0,20),
		
		SpeedoMax = 140,
		
		LightsTable = "CP_GrandVoyager",
		
		OnSpawn = 
		function(ent) 
			ent:SetSkin(math.random(0,13))
		end,
		
		CustomWheels = true,
		CustomSuspensionTravel = 11,
		
		CustomWheelModel = "models/consumerpack/grand_voyager/grand_voyager_wheel.mdl",
	    CustomWheelPosFL = Vector(72,36,13),
		CustomWheelPosFR = Vector(72,-36,13),
		CustomWheelPosRL = Vector(-64,36,13),	
		CustomWheelPosRR = Vector(-64,-36,13),
		CustomWheelAngleOffset = Angle(0,0,0),
		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(10,-21,60),
        SeatPitch = 0,
		SeatYaw = 90,
		
		PassengerSeats = {
			{
				pos = Vector(10,-21,25),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(-32,-8,25),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(-32,21,25),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(-60,21,25),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(-60,-20,25),
				ang = Angle(0,-90,0)
			},
		},
				
		ExhaustPositions = {
			{
				pos = Vector(-97,-20,12),
				ang = Angle(0,-90,90)
			},
			{
				pos = Vector(-97,20,12),
				ang = Angle(0,-90,90)
			},
		},
		
		FuelFillPos = Vector(-52.5,40,37),
		FuelType = FUELTYPE_DIESEL,
		FuelTankSize = 65,
		
		StrengthenSuspension = false,
		
		FrontHeight = 7,
		FrontConstant = 30000,
		FrontDamping = 1100,
		FrontRelativeDamping = 1100,
		
		RearHeight = 7,
		RearConstant = 30000,
		RearDamping = 1100,
		RearRelativeDamping = 1100,
		
		FastSteeringAngle = 30,
		SteeringFadeFastSpeed = 245,
		
		TurnSpeed = 4,
		
		MaxGrip = 55,
		Efficiency = 0.85,
		GripOffset = -2,
		BrakePower = 20,
		
		IdleRPM = 600,
		LimitRPM = 6000,
		PeakTorque = 140,
		PowerbandStart = 2000,
		PowerbandEnd = 5000,
		Turbocharged = false,
		Supercharged = false,
		
		PowerBias = -1,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/alfaromeo/alfaromeo_idle.wav",
		Sound_IdlePitch = 0.9,
		
		Sound_Mid = "simulated_vehicles/alfaromeo/alfons_low.wav",
		Sound_MidPitch = 1.0,
		Sound_MidVolume = 4,
		Sound_MidFadeOutRPMpercent = 55,		-- at wich percentage of limitrpm the sound fades out
		Sound_MidFadeOutRate = 0.74,                    --how fast it fades out   0 = instant       1 = never
		
		Sound_High = "simulated_vehicles/generic3/generic3_mid.wav",
		Sound_HighPitch = 1.0,
		Sound_HighVolume = 3.0,
		Sound_HighFadeInRPMpercent = 35,
		Sound_HighFadeInRate = 0.24,
		
		Sound_Throttle = "",		-- mutes the default throttle sound
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "simulated_vehicles/horn_3.wav",
		
		DifferentialGear = 0.55,
		Gears = {-0.11,0,0.10,0.17,0.25,0.36}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_cp_grand_voyager", V )