local light_table = {
	L_HeadLampPos = Vector(165,33,35),
	L_HeadLampAng = Angle(9,0,0),
	R_HeadLampPos = Vector(165,-33,35),
	R_HeadLampAng = Angle(9,0,0),
	
	L_RearLampPos = Vector(-200,33,33),
	L_RearLampAng = Angle(45,180,0),
	R_RearLampPos = Vector(-200,-33,33),
	R_RearLampAng = Angle(45,180,0),
	
	Headlight_sprites = {	
		{
			pos = Vector(80,-11,67),
			size = 25,
			color = Color(255,93,0,255),
		},
		{
			pos = Vector(81,0,67),
			size = 25,
			color = Color(255,93,0,255),
		},		
		{
			pos = Vector(80,12,67),
			size = 25,
			color = Color(255,93,0,255),
		},
---------		
		{
			pos = Vector(152,30,11),Vector(152,30,11),
			size = 50,
		},		
		{
			pos = Vector(152,-30,11),Vector(152,-30,11),
			size = 50,
		},
	},
	Headlamp_sprites = { 
		{
			pos = Vector(152,30,11),
			size = 45,
		},
		{
			pos = Vector(152,-30,11),
			size = 45,
		},
	},
	Rearlight_sprites = {
		{
			pos = Vector(-135,-38,10),Vector(-135,-38,10),
			size = 30,
		},
		{
			pos = Vector(-135,38,10),Vector(-135,-38,10),
			size = 30,
		},
	},
	Brakelight_sprites = {
		{
			pos = Vector(-135,-38,10),Vector(-135,-38,10),
			size = 30,
		},
		{
			pos = Vector(-135,38,10),Vector(-135,-38,10),
			size = 30,
		},
	},
}
list.Set( "simfphys_lights", "URALS", light_table)


local V = {
	Name = "Урал 4320",
	Model = "models/ural_troop.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Грузовики",
	SpawnOffset = Vector(0,0,60),
	SpawnAngleOffset = 0,

	Members = {
		Mass = 5000,
		EnginePos = Vector(160,0,30),
		BulletProofTires = true,
		
		OnSpawn = 
		function(ent) 
			ent:SetSkin(math.random(0,5))
		end,
		
		LightsTable = "URALS",
		
		MaxHealth = 5000,
		
		IsArmored = true,
				
		CustomWheels = true,       	 -- You have to set this to "true" in order to define custom wheels
		CustomSuspensionTravel = 10,	--suspension travel wlimiter length
		
		--FrontWheelRadius = 16,		-- if you set CustomWheels to true then the script will figure the radius out by itself using the CustomWheelModel
		--RearWheelRadius = 16,
		
		CustomWheelModel = "models/wheel_ural.mdl",	-- since we create our own wheels we have to define a model. It has to have a collission model
		--CustomWheelModel_R = "",			-- different model for rear wheels?
		CustomWheelPosFL = Vector(112,40,-26),		-- set the position of the front left wheel. 
		CustomWheelPosFR = Vector(112,-40,-26),	-- position front right wheel
		CustomWheelPosML = Vector(-28,40,-26),
		CustomWheelPosMR = Vector(-28,-40,-26),
		CustomWheelPosRL = Vector(-85,40,-26),	-- rear left
		CustomWheelPosRR = Vector(-85,-40,-26),	-- rear right		NOTE: make sure the position actually matches the name. So FL is actually at the Front Left ,  FR Front Right, ...   if you do this wrong the wheels will spin in the wrong direction or the car will drive sideways/reverse
		CustomWheelAngleOffset = Angle(0,0,0),
		
		CustomMassCenter = Vector(-15,0,10),		-- custom masscenter offset. The script creates a counter weight to make the masscenter exactly in the center of the wheels. However you can add an offset to this to create more body roll if you really have to...
		
		CustomSteerAngle = 30,				-- max clamped steering angle,

		SeatOffset = Vector(56,-20,48),
		SeatPitch = 0,
		SeatYaw = 90,
		
		-- everything below this comment is exactly the same as for normal vehicles. For more info take a look in simfphys_spawnlist.lua
		
		PassengerSeats = {
			{
				pos = Vector(56,-3,15),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(56,-23,15),
				ang = Angle(0,-90,0)
			},
			-------
			{
				pos = Vector(0,-36,22),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(-30,-36,22),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(-60,-36,22),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(-90,-36,22),
				ang = Angle(0,0,0)
			},
			--------
						{
				pos = Vector(0,36,22),
				ang = Angle(0,180,0)
			},
			{
				pos = Vector(-30,36,22),
				ang = Angle(0,180,0)
			},
			{
				pos = Vector(-60,36,22),
				ang = Angle(0,180,0)
			},
			{
				pos = Vector(-90,36,22),
				ang = Angle(0,180,0)
			},
		},

		FrontHeight = 2,
		FrontConstant = 100000,
		FrontDamping = 12000,
		FrontRelativeDamping = 2000,
		
		RearHeight = 2,
		RearConstant = 100000,
		RearDamping = 12000,
		RearRelativeDamping = 2000,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 4,
		
		MaxGrip = 120,
		Efficiency = 0.7,
		GripOffset = -0,
		BrakePower = 65,
		
		IdleRPM = 700,
		LimitRPM = 4500,
		PeakTorque = 200,
		PowerbandStart = 700,
		PowerbandEnd = 4200,
		Turbocharged = false,
		Supercharged = false,
		
		FuelFillPos = Vector(55,48,24),
		FuelType = FUELTYPE_DIESEL,
		FuelTankSize = 80,
		
		PowerBias = 0,
		
		PowerBias = 0,
		
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
		Gears = {-0.16,0,0.15,0.2,0.25,0.32}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_ural_troop", V )

