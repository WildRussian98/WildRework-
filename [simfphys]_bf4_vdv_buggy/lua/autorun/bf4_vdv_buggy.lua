local light_table = {
	L_HeadLampPos = Vector(82,-23.04,45.08),
	L_HeadLampAng = Angle(0,0,0),
	R_HeadLampPos = Vector(82,23.04,45.08),
	R_HeadLampAng = Angle(0,0,0),
	
	Headlight_sprites = { 
	{pos = Vector(82,23.04,45.08),size = 15,color = Color(255,240,180,128),material="sprites/light_glow02_add_noz"},
	{pos = Vector(93.63,9.6,33.2),size = 15,color = Color(255,240,180,128),material="sprites/light_glow02_add_noz"},
	{pos = Vector(82,-23.04,45.08),size = 15,color = Color(255,240,180,128),material="sprites/light_glow02_add_noz"},
	{pos = Vector(93.63,-9.6,33.2),size = 15,color = Color(255,240,180,128),material="sprites/light_glow02_add_noz"},
	},
	Turnsignal_sprites = {
		Left = {
		Vector(74.03,41.64,49),
		},
		Right = {
		Vector(74.03,-41.64,49),
		},
	},
	
}
list.Set( "simfphys_lights", "bf4_vdv_buggy", light_table)

local V = {
	Name = "ВДВ Багги",
	Model = "models/vehicles/bf4_vdv_buggy.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Легкая бронетехника",
	SpawnOffset = Vector(0,0,0),
	SpawnAngleOffset = 90,

	Members = {
		Mass = 2500,
		EnginePos = Vector(90,0,48),
		BulletProofTires = true,
		
		LightsTable = "bf4_vdv_buggy",
		
		MaxHealth = 4000,
		
		IsArmored = true,
				
		CustomWheels = true,       	 -- You have to set this to "true" in order to define custom wheels
		CustomSuspensionTravel = 10,	--suspension travel limiter length
		
		FrontWheelRadius = 20,		-- if you set CustomWheels to true then the script will figure the radius out by itself using the CustomWheelModel
		RearWheelRadius = 20,
		
		CustomWheelModel = "models/vehicles/bf4_vdv_buggy_wheel.mdl",	-- since we create our own wheels we have to define a model. It has to have a collission model
		CustomWheelPosFL = Vector(71.3,39.8,15),		-- set the position of the front left wheel. 
		CustomWheelPosFR = Vector(71.3,-39.8,15),	-- position front right wheel
		CustomWheelPosRL = Vector(-65.5,36,15),	-- rear left
		CustomWheelPosRR = Vector(-65.5,-36,15),	-- rear right		NOTE: make sure the position actually matches the name. So FL is actually at the Front Left ,  FR Front Right, ...   if you do this wrong the wheels will spin in the wrong direction or the car will drive sideways/reverse
		CustomWheelAngleOffset = Angle(0,-90,0),
		
		CustomMassCenter = Vector(0,0,0),		-- custom masscenter offset. The script creates a counter weight to make the masscenter exactly in the center of the wheels. However you can add an offset to this to create more body roll if you really have to...
		
		CustomSteerAngle = 30,				-- max clamped steering angle,

		SeatOffset = Vector(-25,-23,55),
		SeatPitch = 10,
		SeatYaw = 95,
		
		PassengerSeats = {
			{
				pos = Vector(-55,0,70),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(-2,-26,19),
				ang = Angle(0,-95,15)
			},

		},

		FrontHeight = 2,
		FrontConstant = 100000,
		FrontDamping = 7000,
		FrontRelativeDamping = 4000,
		
		RearHeight = 2,
		RearConstant = 100000,
		RearDamping = 7000,
		RearRelativeDamping = 4000,
		
		FastSteeringAngle = 20,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 4,
		
		MaxGrip = 120,
		Efficiency = 1,
		GripOffset = -1,
		BrakePower = 80,
		
		IdleRPM = 3000,
		LimitRPM = 6000,
		PeakTorque = 200,
		PowerbandStart = 650,
		PowerbandEnd = 5500,
		Turbocharged = false,
		Supercharged = false,
		
		FuelFillPos = Vector(-40,48,48),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 50,
		
		PowerBias = 0,
		
		EngineSoundPreset = 4,
		
		snd_horn = "simulated_vehicles/horn_2.wav",
		
		DifferentialGear = 0.42,
		Gears = {-0.1,0,0.1,0.17,0.24,0.3}
	}
}
list.Set( "simfphys_vehicles", "bf4_vdv_buggy", V )