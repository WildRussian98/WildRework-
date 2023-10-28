
AddCSLuaFile()


local light_table = {
	L_HeadLampPos = Vector(97,20,30),
	L_HeadLampAng = Angle(0,0,0),

	R_HeadLampPos = Vector(97,-20,30),
	R_HeadLampAng = Angle(0,0,0),

	L_RearLampPos = Vector(-99,29,35),
	L_RearLampAng = Angle(0,180,0),

	R_RearLampPos = Vector(-99,-29,35),
	R_RearLampAng = Angle(0,180,0),
	
	Headlight_sprites = { 
		Vector(99,20,30),
		Vector(99,21,30),
		Vector(99,22,30),
		
		Vector(99,-20,30),
		Vector(99,-21,30),
		Vector(99,-22,30),
	},
	Headlamp_sprites = { 
		Vector(97,27,30),
		Vector(97,28,30),
		Vector(96,29,30),
		
		Vector(97,-27,30),
		Vector(97,-28,30),
		Vector(96,-29,30),
	},
	FogLight_sprites = {
		Vector(90,34,30),
		Vector(90,-34,30),
	},
	Rearlight_sprites = {
		{pos = Vector(-99,29,35), color = Color(200, 0, 0, 200), size = 25},
		{pos = Vector(-99,28,35), color = Color(200, 0, 0, 200), size = 25},
		{pos = Vector(-99,27,35), color = Color(200, 0, 0, 200), size = 25},
		
		{pos = Vector(-99,-29,35), color = Color(200, 0, 0, 200), size = 25},
		{pos = Vector(-99,-28,35), color = Color(200, 0, 0, 200), size = 25},
		{pos = Vector(-99,-27,35), color = Color(200, 0, 0, 200), size = 25},
		
		{pos = Vector(-73,0,48), color = Color(200, 0, 0, 200), size = 10},
	},
	Brakelight_sprites = {
		{pos = Vector(-100.5,20,34), color = Color(200, 0, 0, 200), size = 25},
		{pos = Vector(-100.5,-20,34), color = Color(200, 0, 0, 200), size = 25},
		{pos = Vector(-100.2,21,34), color = Color(200, 0, 0, 200), size = 25},
		{pos = Vector(-100.2,-21,34), color = Color(200, 0, 0, 200), size = 25},
		{pos = Vector(-100,22,34), color = Color(200, 0, 0, 200), size = 25},
		{pos = Vector(-100,-22,34), color = Color(200, 0, 0, 200), size = 25},
		{pos = Vector(-100,23,34), color = Color(200, 0, 0, 200), size = 25},
		{pos = Vector(-100,-23,34), color = Color(200, 0, 0, 200), size = 25},
		
		{pos = Vector(-100.3,20,36), color = Color(200, 0, 0, 200), size = 25},
		{pos = Vector(-100.3,-20,36), color = Color(200, 0, 0, 200), size = 25},
		{pos = Vector(-100,21,36), color = Color(200, 0, 0, 200), size = 25},
		{pos = Vector(-100,-21,36), color = Color(200, 0, 0, 200), size = 25},
		{pos = Vector(-100,22,36), color = Color(200, 0, 0, 200), size = 25},
		{pos = Vector(-100,-22,36), color = Color(200, 0, 0, 200), size = 25},
		{pos = Vector(-100,23,36), color = Color(200, 0, 0, 200), size = 25},
		{pos = Vector(-100,-23,36), color = Color(200, 0, 0, 200), size = 25},
		
		{pos = Vector(-73,2,48), color = Color(200, 0, 0, 200), size = 10},
		{pos = Vector(-73,1,48), color = Color(200, 0, 0, 200), size = 10},
		{pos = Vector(-73,0,48), color = Color(200, 0, 0, 200), size = 10},
		{pos = Vector(-73,-1,48), color = Color(200, 0, 0, 200), size = 10},
		{pos = Vector(-73,-2,48), color = Color(200, 0, 0, 200), size = 10},
	},
	Reverselight_sprites = {
		{pos = Vector(-101.5,17,32), color = Color(210, 210, 210, 200), size = 15},
		{pos = Vector(-101.5,-17,32),color = Color(210, 210, 210, 200), size = 15},
		{pos = Vector(-101.2,19,32),color = Color(210, 210, 210, 200), size = 15},
		{pos = Vector(-101.2,-19,32),color = Color(210, 210, 210, 200), size = 15},
		{pos = Vector(-101,21,32),color = Color(210, 210, 210, 200), size = 15},
		{pos = Vector(-101,-21,32),color = Color(210, 210, 210, 200), size = 15},
		{pos = Vector(-101,23,32),color = Color(210, 210, 210, 200), size = 15},
		{pos = Vector(-101,-23,32),color = Color(210, 210, 210, 200), size = 15},
	},
	Turnsignal_sprites = {
	Left = {
		Vector(103,24,21),
		Vector(103,25,21),
		Vector(102,26,21),
		Vector(102,27,21),
		Vector(101,28,21),
		Vector(101,29,21),
		Vector(100,30,21),
		Vector(100,31,21),
		Vector(99,32,21),
		Vector(99,33,21),

		Vector(-100,26,32),
		Vector(-100,27,32),
		Vector(-100,28,32),
		Vector(-100,29,32),
		Vector(-99,30,32),
		Vector(-99,31,32),
		Vector(-99,32,32),
		Vector(-98,33,32),
		Vector(-97,34,32),
	},
	Right = {
		Vector(103,-24,21),
		Vector(103,-25,21),
		Vector(102,-26,21),
		Vector(102,-27,21),
		Vector(101,-28,21),
		Vector(101,-29,21),
		Vector(100,-30,21),
		Vector(100,-31,21),
		Vector(99,-32,21),
		Vector(99,-33,21),

		Vector(-100,-26,32),
		Vector(-100,-27,32),
		Vector(-100,-28,32),
		Vector(-100,-29,32),
		Vector(-99,-30,32),
		Vector(-99,-31,32),
		Vector(-99,-32,32),
		Vector(-98,-33,32),
		Vector(-97,-34,32),
		},
	}
}
list.Set( "simfphys_lights", "CP_NissanMaxima", light_table)

local V = {
	Name = "Nissan Maxima",
	Model = "models/consumerpack/nissan_maxima/1997_nissan_maxima_rigged.mdl",
	ModelOffset = Angle(0,90,0),
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Автомобили",
	SpawnAngleOffset = 90,
	
	Members = {
		Mass = 1404,
		
		CustomMassCenter = Vector(3,0,8),
		EnginePos = Vector(65,0,20),
		
		SpeedoMax = 140,
		
		OnSpawn = 
		function(ent) 
			ent:SetSkin(math.random(0,9))
		end,
		
		LightsTable = "CP_NissanMaxima",
		
		CustomWheels = true,
		CustomSuspensionTravel = 11,
		
		CustomWheelModel = "models/consumerpack/nissan_maxima/maxima_wheel.mdl",
	    CustomWheelPosFL = Vector(63,34,13),
		CustomWheelPosFR = Vector(63,-34,13),
		CustomWheelPosRL = Vector(-57,34,13),	
		CustomWheelPosRR = Vector(-57,-34,13),
		CustomWheelAngleOffset = Angle(0,-90,0),
		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(0,-18,50),
        SeatPitch = 0,
		SeatYaw = 90,
		
		PassengerSeats = {
			{
				pos = Vector(0,-18,15),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(-35,-18,15),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(-35,18,15),
				ang = Angle(0,-90,0)
			},
		},
				
		ExhaustPositions = {
			{
				pos = Vector(-105,-17,13),
				ang = Angle(-90,0,90)
			},
		},
		
		FuelFillPos = Vector(-72,35,35),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 65,
		
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
		
		TurnSpeed = 4,
		
		MaxGrip = 45,
		Efficiency = 0.9,
		GripOffset = -1,
		BrakePower = 20,
		
		IdleRPM = 700,
		LimitRPM = 7000,
		PeakTorque = 110,
		PowerbandStart = 2000,
		PowerbandEnd = 6000,
		Turbocharged = false,
		Supercharged = false,
		
		PowerBias = 1,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/generic3/generic3_idle.wav",
		Sound_IdlePitch = 0.8,
		
		Sound_Mid = "simulated_vehicles/generic3/generic3_low.wav",
		Sound_MidPitch = 1.1,
		Sound_MidVolume = 4,
		Sound_MidFadeOutRPMpercent = 30,		-- at wich percentage of limitrpm the sound fades out
		Sound_MidFadeOutRate = 0.34,                    --how fast it fades out   0 = instant       1 = never
		
		Sound_High = "simulated_vehicles/generic3/generic3_mid.wav",
		Sound_HighPitch = 0.9,
		Sound_HighVolume = 4.0,
		Sound_HighFadeInRPMpercent = 20,
		Sound_HighFadeInRate = 0.24,
		
		Sound_Throttle = "",		-- mutes the default throttle sound
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "simulated_vehicles/horn_3.wav",
		
		DifferentialGear = 0.50,
		Gears = {-0.11,0,0.11,0.19,0.26,0.35,0.42}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_cp_maxima", V )