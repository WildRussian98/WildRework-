--- Reminder for Self, Create Light Table.
//THIS EDIT Insanity
//Auhtors Insanity Valk

local light_table = {
	-- projected texture / lamp pos   - front
	L_HeadLampPos = Vector(160.3,30,58.6),
	L_HeadLampAng = Angle(17,0,0),
	R_HeadLampPos = Vector(160.3,-30,58.6),
	R_HeadLampAng = Angle(10,0,0),
	
	-- projected texture - rear
	L_RearLampPos = Vector(-158.3,35.2,46.7),
	L_RearLampAng = Angle(25,180,0),
	R_RearLampPos = Vector(-158.3,-35.2,46.7),
	R_RearLampAng = Angle(25,180,0),
	
	Headlight_sprites = {   -- lowbeam
		{
			pos = Vector(140,41,44),
			material = "sprites/light_ignorez",
			size = 70,
			color = Color(255,238,200,255),
		},
		{
			pos = Vector(140,-41,44),
			material = "sprites/light_ignorez",
			size = 70,
			color = Color(255,238,200,255),
		},
		{
			pos = Vector(133,-61,38),
			material = "sprites/light_ignorez",
			size = 20,
			color = Color(255,178,0,255),
		},
		{
			pos = Vector(133,61,38),
			material = "sprites/light_ignorez",
			size = 20,
			color = Color(255,178,0,255),
		},
		{
			pos = Vector(-124,-61,42),
			material = "sprites/light_ignorez",
			size = 20,
			color = Color(255,178,0,255),
		},
		{
			pos = Vector(-124,61,42),
			material = "sprites/light_ignorez",
			size = 20,
			color = Color(255,178,0,255),
		},
	},
	
	Headlamp_sprites = {
		{pos = Vector(140,41,44),size = 50,material = "sprites/light_ignorez"},
		{pos = Vector(140,41,44),size = 50,material = "sprites/light_ignorez"},
		{pos = Vector(140,41,44),size = 50,material = "sprites/light_ignorez"},
		{pos = Vector(140,-41,44),size = 50,material = "sprites/light_ignorez"},
		{pos = Vector(140,-41,44),size = 50,material = "sprites/light_ignorez"},
		{pos = Vector(140,-41,44),size = 50,material = "sprites/light_ignorez"},
	},
	Rearlight_sprites = {
		{
			pos = Vector(-128,55,42),
			material = "sprites/light_ignorez",
			size = 50,
			color = Color(255,0,0,255),
		},
		{
			pos = Vector(-128,-55,42),
			material = "sprites/light_ignorez",
			size = 50,
			color = Color(255,0,0,255),
		},
	},
	Brakelight_sprites = {
		{
			pos = Vector(-128,55,42),
			material = "sprites/light_ignorez",
			size = 60,
			color = Color(255,0,0,255),
		},
		{
			pos = Vector(-128,-55,42),
			material = "sprites/light_ignorez",
			size = 60,
			color = Color(255,0,0,255),
		},
	},
	Reverselight_sprites = {
		{
			pos = Vector(-128,-55,42),
			material = "sprites/light_ignorez",
			size = 30,
			color = Color(255,255,255,255),
		},
		{
			pos = Vector(-128,55,42),
			material = "sprites/light_ignorez",
			size = 30,
			color = Color(255,255,255,255),
		},
	},
}
list.Set( "simfphys_lights", "Mrar", light_table)

local V = {
	Name = "MRAP",
	Model = "models/cougar.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Бронемашины",
	SpawnOffset = Vector(0,0,60),
	SpawnAngleOffset = 90,

	Members = {
		Mass = 3000,
		EnginePos = Vector(130,0,80),
		BulletProofTires = false,
		
		LightsTable = "Mrar",
		
		MaxHealth = 6500,
		
		OnSpawn = 
			function(ent) 
				ent:SetSkin(math.random(0,3))
			end,

		ApplyDamage = function( ent, damage, type ) 
			simfphys.TankApplyDamage(ent, damage, type)
		end,		

		IsArmored = true,
				
		CustomWheels = true,       	 -- You have to set this to "true" in order to define custom wheels
		CustomSuspensionTravel = 10,	--suspension travel limiter length
		
		--FrontWheelRadius = 18,		-- if you set CustomWheels to true then the script will figure the radius out by itself using the CustomWheelModel
		--RearWheelRadius = 20,
		
		CustomWheelModel = "models/bo2/wheel/cougar wheel.mdl",	-- since we create our own wheels we have to define a model. It has to have a collission model
		--CustomWheelModel_R = "",			-- different model for rear wheels?
		CustomWheelPosFL = Vector(109,54,13),		-- set the position of the front left wheel. 
		CustomWheelPosFR = Vector(109,-54,13),	-- position front right wheel
		CustomWheelPosRL = Vector(-97,54,14),	-- rear left
		CustomWheelPosRR = Vector(-97,-54,14),
		CustomWheelPosML = Vector(-47,54,14),
		CustomWheelPosMR = Vector(-47,-54,14),		-- rear right		NOTE: make sure the position actually matches the name. So FL is actually at the Front Left ,  FR Front Right, ...   if you do this wrong the wheels will spin in the wrong direction or the car will drive sideways/reverse
		CustomWheelAngleOffset = Angle(0,180,0),
		
		CustomMassCenter = Vector(-10,0,16),		-- custom masscenter offset. The script creates a counter weight to make the masscenter exactly in the center of the wheels. However you can add an offset to this to create more body roll if you really have to...
		
		CustomSteerAngle = 35,				-- max clamped steering angle,

		SeatOffset = Vector(45,-25,85),
		SeatPitch = 0,
		SeatYaw = 90,
		
		-- everything below this comment is exactly the same as for normal vehicles. For more info take a look in simfphys_spawnlist.lua
		
		PassengerSeats = {
			{
				pos = Vector(47,-25,53),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(15,-15,45),
				ang = Angle(0,90,0)
			},
			{
				pos = Vector(15,23,45),
				ang = Angle(0,90,0)
			},
			{
				pos = Vector(-17,32,45),
				ang = Angle(0,180,0)
			},
			{
				pos = Vector(-50,32,45),
				ang = Angle(0,180,0)
			},
			{
				pos = Vector(-80,32,45),
				ang = Angle(0,180,0)
			},
			{
				pos = Vector(-17,-32,45),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(-50,-32,45),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(-80,-32,45),
				ang = Angle(0,0,0)
			},
		},
		
		Attachments = {
			{
				model = "models/interior/cougar interior.mdl",
				color = Color(255,255,255,255),
				pos = Vector(0,0,0),
				ang = Angle(0,-90,0)
			},
		},

		FrontHeight = 1,
		FrontConstant = 50000.00,
		FrontDamping = 3000,
		FrontRelativeDamping = 2000,
		
		RearHeight = 1,
		RearConstant = 50000.00,
		RearDamping = 3000,
		RearRelativeDamping = 2000,
		
		FastSteeringAngle = 16,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 4,
		
		MaxGrip = 150,
		Efficiency = 0.75,
		GripOffset = 1,
		BrakePower = 65,
		
		IdleRPM = 1000,
		LimitRPM = 3000,
		PeakTorque = 200,
		PowerbandStart = 1500,
		PowerbandEnd = 2800,
		Turbocharged = false,
		Supercharged = false,

		
		FuelFillPos = Vector(55,48,24),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 80,
		
		PowerBias = -1,
		
		EngineSoundPreset = 0,
		
        Sound_Idle = "simulated_vehicles/misc/Nanjing_loop.wav",
        Sound_IdlePitch = 1,

        Sound_Mid = "simulated_vehicles/misc/m50.wav",
        Sound_MidPitch = 1,
        Sound_MidVolume = 1,
        Sound_MidFadeOutRPMpercent = 58,
        Sound_MidFadeOutRate = 0.4,

        Sound_High = "simulated_vehicles/misc/v8high2.wav",
        Sound_HighPitch = 1,
        Sound_HighVolume = 0.75,
        Sound_HighFadeInRPMpercent = 58,
        Sound_HighFadeInRate = 0.19,

        Sound_Throttle = "",
        Sound_ThrottlePitch = 0,
        Sound_ThrottleVolume = 0,

        snd_horn = "simulated_vehicles/horn_2.wav",
		
		DifferentialGear = 0.29,
		Gears = {-0.1,0,0.1,0.2,0.3,0.4}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_crysis_mrar", V )

local V = {
	Name = "MRAP SAM",
	Model = "models/Cougar-SAM.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Легкая бронетехника",
	SpawnOffset = Vector(0,0,60),
	SpawnAngleOffset = 90,

	Members = {
		Mass = 3000,
		EnginePos = Vector(130,0,80),
		BulletProofTires = false,
		
		LightsTable = "Mrar",
		
		MaxHealth = 6500,
		
		OnSpawn = 
			function(ent) 
				ent:SetSkin(math.random(0,3))
			end,

		ApplyDamage = function( ent, damage, type ) 
			simfphys.TankApplyDamage(ent, damage, type)
		end,
		
		IsArmored = true,
				
		CustomWheels = true,       	 -- You have to set this to "true" in order to define custom wheels
		CustomSuspensionTravel = 10,	--suspension travel limiter length
		
		--FrontWheelRadius = 18,		-- if you set CustomWheels to true then the script will figure the radius out by itself using the CustomWheelModel
		--RearWheelRadius = 20,
		
		CustomWheelModel = "models/bo2/wheel/cougar wheel.mdl",	-- since we create our own wheels we have to define a model. It has to have a collission model
		--CustomWheelModel_R = "",			-- different model for rear wheels?
		CustomWheelPosFL = Vector(109,54,13),		-- set the position of the front left wheel. 
		CustomWheelPosFR = Vector(109,-54,13),	-- position front right wheel
		CustomWheelPosRL = Vector(-97,54,14),	-- rear left
		CustomWheelPosRR = Vector(-97,-54,14),
		CustomWheelPosML = Vector(-47,54,14),
		CustomWheelPosMR = Vector(-47,-54,14),		-- rear right		NOTE: make sure the position actually matches the name. So FL is actually at the Front Left ,  FR Front Right, ...   if you do this wrong the wheels will spin in the wrong direction or the car will drive sideways/reverse
		CustomWheelAngleOffset = Angle(0,180,0),
		
		CustomMassCenter = Vector(-10,0,16),		-- custom masscenter offset. The script creates a counter weight to make the masscenter exactly in the center of the wheels. However you can add an offset to this to create more body roll if you really have to...
		
		CustomSteerAngle = 35,				-- max clamped steering angle,

		SeatOffset = Vector(45,-25,85),
		SeatPitch = 0,
		SeatYaw = 90,
		
		-- everything below this comment is exactly the same as for normal vehicles. For more info take a look in simfphys_spawnlist.lua
		
		PassengerSeats = {
			{
				pos = Vector(47,-25,53),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(15,-15,45),
				ang = Angle(0,90,0)
			},
			{
				pos = Vector(15,23,45),
				ang = Angle(0,90,0)
			},
			{
				pos = Vector(-17,32,45),
				ang = Angle(0,180,0)
			},
			{
				pos = Vector(-50,32,45),
				ang = Angle(0,180,0)
			},
			{
				pos = Vector(-80,32,45),
				ang = Angle(0,180,0)
			},
			{
				pos = Vector(-17,-32,45),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(-50,-32,45),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(-80,-32,45),
				ang = Angle(0,0,0)
			},
		},
		
		Attachments = {
			{
				model = "models/interior/cougar interior.mdl",
				color = Color(255,255,255,255),
				pos = Vector(0,0,0),
				ang = Angle(0,-90,0)
			},
		},

		FrontHeight = 1,
		FrontConstant = 50000.00,
		FrontDamping = 3000,
		FrontRelativeDamping = 2000,
		
		RearHeight = 1,
		RearConstant = 50000.00,
		RearDamping = 3000,
		RearRelativeDamping = 2000,
		
		FastSteeringAngle = 16,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 4,
		
		MaxGrip = 150,
		Efficiency = 0.75,
		GripOffset = 1,
		BrakePower = 65,
		
		IdleRPM = 1000,
		LimitRPM = 3000,
		PeakTorque = 200,
		PowerbandStart = 1500,
		PowerbandEnd = 2800,
		Turbocharged = false,
		Supercharged = false,
		
		FuelFillPos = Vector(55,48,24),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 80,
		
		PowerBias = -1,
		
		EngineSoundPreset = 0,
		
        Sound_Idle = "simulated_vehicles/misc/Nanjing_loop.wav",
        Sound_IdlePitch = 1,

        Sound_Mid = "simulated_vehicles/misc/m50.wav",
        Sound_MidPitch = 1,
        Sound_MidVolume = 1,
        Sound_MidFadeOutRPMpercent = 58,
        Sound_MidFadeOutRate = 0.4,

        Sound_High = "simulated_vehicles/misc/v8high2.wav",
        Sound_HighPitch = 1,
        Sound_HighVolume = 0.75,
        Sound_HighFadeInRPMpercent = 58,
        Sound_HighFadeInRate = 0.19,

        Sound_Throttle = "",
        Sound_ThrottlePitch = 0,
        Sound_ThrottleVolume = 0,

        snd_horn = "simulated_vehicles/horn_2.wav",
		
		DifferentialGear = 0.29,
		Gears = {-0.1,0,0.1,0.2,0.3,0.4}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_crysis_mrar_sam", V )
