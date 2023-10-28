local light_table = {
	L_HeadLampPos = Vector(170,33,35),
	L_HeadLampAng = Angle(9,0,0),
	R_HeadLampPos = Vector(170,-33,35),
	R_HeadLampAng = Angle(9,0,0),
	
	L_RearLampPos = Vector(-200,33,33),
	L_RearLampAng = Angle(45,180,0),
	R_RearLampPos = Vector(-200,-33,33),
	R_RearLampAng = Angle(45,180,0),
	
	Headlight_sprites = {	
		{
			pos = Vector(97,-7,111),
			size = 18,
			color = Color(255,93,0,255),
		},
		{
			pos = Vector(97,0,111),
			size = 18,
			color = Color(255,93,0,255),
		},
		{
			pos = Vector(97,27,111),
			size = 18,
			color = Color(255,93,0,255),
		},	
		{
			pos = Vector(97,-27,111),
			size = 18,
			color = Color(255,93,0,255),
		},				
		{
			pos = Vector(97,7,111),
			size = 18,
			color = Color(255,93,0,255),
		},			
		{
			pos = Vector(115,42,37),
			size = 50,
		},		
		{
			pos = Vector(115,-42,37),
			size = 50,
		},
		{
			pos = Vector(107,-53,39),
			size = 18,
			color = Color(255,93,0,255),
		},				
		{
			pos = Vector(107,53,39),
			size = 18,
			color = Color(255,93,0,255),
		},	
		{
			pos = Vector(-185,-8,39),
			size = 18,
			color = Color(255,93,0,255),
		},
		{
			pos = Vector(-185,8,39),
			size = 18,
			color = Color(255,93,0,255),
		},
		{
			pos = Vector(-188,-30,36),
			size = 18,
			color = Color(255,93,0,255),
		},
		{
			pos = Vector(-188,30,36),
			size = 18,
			color = Color(255,93,0,255),
		},
		{
			pos = Vector(-185,0,39),
			size = 18,
			color = Color(255,93,0,255),
		},
	},
	Headlamp_sprites = { 
		{
			pos = Vector(115,34,37),
			size = 45,
		},
		{
			pos = Vector(115,-34,37),
			size = 45,
		},
	},
	Rearlight_sprites = {
		{
			pos = Vector(-190,-46,35),
			size = 23,
		},
		{
			pos = Vector(-190,46,35),
			size = 23,
		},
		{
			pos = Vector(-187,-50,35),
			size = 23,
		},
		{
			pos = Vector(-187,50,35),
			size = 23,
		},
	},
	Brakelight_sprites = {
		{
			pos = Vector(-191,37,40),
			size = 30,
		},
		{
			pos = Vector(-191,-37,40),
			size = 30,
		},
	},
}
list.Set( "simfphys_lights", "m142", light_table)

local U = {
	Name = "M142_Himars",
	Model = "models/M142_Himars.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Артиллерия",
	SpawnOffset = Vector(0,0,60),
	SpawnAngleOffset = 90,

	Members = {
		Mass = 8000,
		EnginePos = Vector(120,0,30),
		BulletProofTires = true,
		
		LightsTable = "m142",
		
		MaxHealth = 5400,
		
		IsArmored = true,
				
		CustomWheels = true,       	 -- You have to set this to "true" in order to define custom wheels
		CustomSuspensionTravel = 10,	--suspension travel limiter length
		
		--FrontWheelRadius = 18,		-- if you set CustomWheels to true then the script will figure the radius out by itself using the CustomWheelModel
		--RearWheelRadius = 20,
		
		CustomWheelModel = "models/Wheel.mdl",	-- since we create our own wheels we have to define a model. It has to have a collission model
		--CustomWheelModel_R = "",			-- different model for rear wheels?
		CustomWheelPosFL = Vector(60,50,20),		-- set the position of the front left wheel. 
		CustomWheelPosFR = Vector(60,-50,20),	-- position front right wheel
		CustomWheelPosML = Vector(-90,50,20),
		CustomWheelPosMR = Vector(-90,-50,20),
		CustomWheelPosRL = Vector(-140,50,20),	-- rear left
		CustomWheelPosRR = Vector(-140,-50,20),	-- rear right		NOTE: make sure the position actually matches the name. So FL is actually at the Front Left ,  FR Front Right, ...   if you do this wrong the wheels will spin in the wrong direction or the car will drive sideways/reverse
		CustomWheelAngleOffset = Angle(0,180,0),
		
		CustomMassCenter = Vector(-15,0,10),		-- custom masscenter offset. The script creates a counter weight to make the masscenter exactly in the center of the wheels. However you can add an offset to this to create more body roll if you really have to...
		
		CustomSteerAngle = 25,				-- max clamped steering angle,

		SeatOffset = Vector(70,-25,92),
		SeatPitch = 0,
		SeatYaw = 90,
		
		-- everything below this comment is exactly the same as for normal vehicles. For more info take a look in simfphys_spawnlist.lua
		
		PassengerSeats = {
			{
				pos = Vector(70,-25,60),
				ang = Angle(0,-90,0)
			},
			
		},

		FrontHeight = 10,
		FrontConstant = 100000,
		FrontDamping = 12000,
		FrontRelativeDamping = 2000,
		
		RearHeight = 10,
		RearConstant = 100000,
		RearDamping = 12000,
		RearRelativeDamping = 2000,
		
		FastSteeringAngle = 25,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 10,
		
		MaxGrip = 170,
		Efficiency = 1,
		GripOffset = -4,
		BrakePower = 80,
		
		IdleRPM = 600, -- мин. кол-во оборотов
		LimitRPM = 3000, -- макс. кол-во оборотов
		Revlimiter = false, -- Если true - Когда стрелка спидометра доходит до красного обозначения, она не проходит дальше, если false - это игнорируется
		PeakTorque = 125, -- крутящий момент
		PowerbandStart = 600, -- какие обороты на нейтральной передаче
		PowerbandEnd = 2500, -- ограничение по оборотам
		Turbocharged = false, -- турбо false = нет, true = да
		Supercharged = false, -- супер заряд
		Backfire = false, -- стреляющий выхлоп
		
		FuelFillPos = Vector(55,48,24),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 80,
		
		PowerBias = 0,
		
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
		
		DifferentialGear = 0.35,
		Gears = {-0.15, 0, 0.15, 0.2, 0.25, 0.3, 0.35} 
	}
}
list.Set( "simfphys_vehicles", "M142", U )


