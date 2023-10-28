local Category = "Бронемашины"

local IV = {
	Name = "КАМАЗ Тайфун",
	Model = "models/ktcw/kamaz_taifun.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = Category,
	SpawnOffset = Vector(0,0,50),

	Members = {
		Mass = 5650,
		LightsTable = "kamaztaifun",

           GibModels = {
			"models/ktcw/kamaz_taifun.mdl",
		},

		CustomWheels = true,
		EnginePos = Vector(70,0,75),
		CustomSuspensionTravel = 1.5,
		
		CustomWheelModel = "models/ktcw/kamaz_taifun_wheel.mdl",
		CustomWheelPosFL = Vector(115,-41,35.5),
		CustomWheelPosFR = Vector(115,42,35.5),
		CustomWheelPosML = Vector(23,-41,35.5),
           CustomWheelPosMR = Vector(23,42,35.5),
		CustomWheelPosRL = Vector(-93,-41,35.5),
           CustomWheelPosRR = Vector(-93,42,35.5),
		
		CustomWheelAngleOffset = Angle(0,-90,0),
		
		CustomMassCenter = Vector(10,0,10),
		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(143,-31,105),
		SeatPitch = 0,
		SeatYaw = 90,
		
		PassengerSeats = {
			{
				pos = Vector(149,-3,74),
				ang = Angle(0,-90,10)
			},
			{
				pos = Vector(149,-33,74),
				ang = Angle(0,-90,10)
			},
			{
				pos = Vector(6,19,67),
				ang = Angle(0,-180,10)
			},
			{
				pos = Vector(6,-24,67),
				ang = Angle(0,-360,10)
			},
			{
				pos = Vector(-14,19,67),
				ang = Angle(0,-180,10)
			},
			{
				pos = Vector(-14,-24,67),
				ang = Angle(0,-360,10)
			},
			{
				pos = Vector(-35,19,67),
				ang = Angle(0,-180,10)
			},
			{
				pos = Vector(-35,-24,67),
				ang = Angle(0,-360,10)
			},
			{
				pos = Vector(-56,19,67),
				ang = Angle(0,-180,10)
			},
			{
				pos = Vector(-56,-24,67),
				ang = Angle(0,-360,10)
			},
			{
				pos = Vector(-76,19,67),
				ang = Angle(0,-180,10)
			},
			{
				pos = Vector(-76,-24,67),
				ang = Angle(0,-360,10)
			},
			{
				pos = Vector(-97,19,67),
				ang = Angle(0,-180,10)
			},
			{
				pos = Vector(-97,-24,67),
				ang = Angle(0,-360,10)
			},
			{
				pos = Vector(-118,19,67),
				ang = Angle(0,-180,10)
			},
			{
				pos = Vector(-118,-24,67),
				ang = Angle(0,-360,10)
			},
			{
				pos = Vector(-138,19,67),
				ang = Angle(0,-180,10)
			},
			{
				pos = Vector(-138,-24,67),
				ang = Angle(0,-360,10)
			},

			},
		ExhaustPositions = {
			{
				pos = Vector(-138,10,28.5),
				ang = Angle(90,165,0)
			},
		},
		
		FrontHeight = 25,
		FrontConstant = 50000,
		FrontDamping = 3200,
		FrontRelativeDamping = 50,
		
		RearHeight = 25,
		RearConstant = 50000,
		RearDamping = 3200,
		RearRelativeDamping = 50,
		

		TurnSpeed = 3,
		
		FastSteeringAngle = 35,
		SteeringFadeFastSpeed = 535,

           MaxHealth = 7200,

		
		MaxGrip = 120,
		Efficiency = 1,
		GripOffset = 0,
		BrakePower = 25,
		BulletProofTires = false,
		
		IdleRPM = 1000,
		LimitRPM = 3000,
		PeakTorque = 150,
		PowerbandStart = 1500,
		PowerbandEnd = 2800,
		Turbocharged = true,
		Supercharged = false,

		FuelFillPos = Vector(-16,-55,45),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 420,

		
		PowerBias = 0.5,
		
		EngineSoundPreset = -1, 

		Sound_Idle = "ktcw/ktcwsounds/semi_idle.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "ktcw/ktcwsounds/semi_low.wav",
		Sound_MidPitch = 1,
		Sound_MidVolume = 2,
		Sound_MidFadeOutRPMpercent = 80,						Sound_MidFadeOutRate = 0.5,   
		
		Sound_High = "ktcw/ktcwsounds/semi_high.wav",
		Sound_HighPitch = 1,
		Sound_HighVolume = 1.5,
		Sound_HighFadeInRPMpercent = 80,
		Sound_HighFadeInRate = 0.5,
		
		Sound_Throttle = "ktcw/ktcwsounds/semi_throttle.wav",				Sound_ThrottlePitch = 1.1,
		Sound_ThrottleVolume = 1,		
		
		snd_horn = "ktcw/ktcwsounds/semi_horn.wav",

		
		DifferentialGear = 0.29,
		Gears = {-0.1,0,0.1,0.15,0.2,0.3}
	}
}
list.Set( "simfphys_vehicles", "simfphys_kamaztaifun", IV )

local light_table = {
	L_HeadLampPos = Vector(166,34.5,47.5),
	L_HeadLampAng = Angle(0,0,0),

	R_HeadLampPos = Vector(166,-35,47.5),
	R_HeadLampAng = Angle(0,0,0),
	
	Headlight_sprites = { 
	{ 
		pos = Vector(166,34.5,47.5),
		size = 40,
	},
	{ 
		pos = Vector(166,-35,47.5),
		size = 40,
	},
	{ 
		pos = Vector(166,41.5,47.5),
		size = 40,
	},
	{ 
		pos = Vector(166,-42,47.5),
		size = 40,
	},
	},
	Headlamp_sprites = { 
	{ 
		pos = Vector(166,34.5,47.5),
		size = 40,
	},
	{ 
		pos = Vector(166,-35,47.5),
		size = 40,
	},
	{ 
		pos = Vector(166,41.5,47.5),
		size = 40,
	},
	{ 
		pos = Vector(166,-42,47.5),
		size = 40,
	},
	},
	Rearlight_sprites = {
	{ 
		pos = Vector(-150,41.5,47.5),
		size = 28,
	},
	{ 
		pos = Vector(-150,-42.5,47.5),
		size = 28,
	},
	{ 
		pos = Vector(-152,40.5,52.5),
		size = 41,
	},
	{ 
		pos = Vector(-152,-41.5,52.5),
		size = 41,
	},
	},
	Brakelight_sprites = {
	{ 
		pos = Vector(-150,41.5,47.5),
		size = 28,
	},
	{ 
		pos = Vector(-150,-42.5,47.5),
		size = 28,
	},
	{ 
		pos = Vector(-152,40.5,52.5),
		size = 41,
	},
	{ 
		pos = Vector(-152,-41.5,52.5),
		size = 41,
	},
	},
	Reverselight_sprites = {
	{ 
		pos = Vector(-152,36,52.5),
		size = 30,
	},
	{ 
		pos = Vector(-152,-38,52.5),
		size = 30,
	},
	{ 
		pos = Vector(-152,31,52.5),
		size = 30,
	},
	{ 
		pos = Vector(-152,-33,52.5),
		size = 30,
	},

	},
	DelayOn = 0.1,
	DelayOff = 0.1,
	
	Turnsignal_sprites = {
		Left = {
	{ 
		pos = Vector(166,37.5,45),
		size = 22,
	},
	{ 
		pos = Vector(165.5,47.5,53),
		size = 15,
	},
	{ 
		pos = Vector(-152,44,52.5),
		size = 25,
	},

		},
		Right = {
		{ 
		pos = Vector(166,-38,45),
		size = 22,
	},
	{ 
		pos = Vector(165.5,-48,53),
		size = 15,
	},
	{ 
		pos = Vector(-152,-45,52.5),
		size = 25,
	},

},
	}
}
list.Set( "simfphys_lights", "kamaztaifun", light_table)
