--- Reminder for Self, Create Light Table.
//THIS EDIT Insanity
local Category = "Грузовики"

local light_table = {
	L_HeadLampPos = Vector(160.3,30,58.6),
	L_HeadLampAng = Angle(17,0,0),
	R_HeadLampPos = Vector(160.3,-30,58.6),
	R_HeadLampAng = Angle(10,0,0),
	
	L_RearLampPos = Vector(-158.3,35.2,46.7),
	L_RearLampAng = Angle(25,180,0),
	R_RearLampPos = Vector(-158.3,-35.2,46.7),
	R_RearLampAng = Angle(25,180,0),
	
	Headlight_sprites = {   -- lowbeam
		{
			pos = Vector(141,33,54),
			material = "sprites/light_ignorez",
			size = 70,
			color = Color(255,238,200,255),
		},
		{
			pos = Vector(141,-33,54),
			material = "sprites/light_ignorez",
			size = 70,
			color = Color(255,238,200,255),
		},
		{
			pos = Vector(102,-47,54),
			material = "sprites/light_ignorez",
			size = 20,
			color = Color(255,178,0,255),
		},
		{
			pos = Vector(102,45,54),
			material = "sprites/light_ignorez",
			size = 20,
			color = Color(255,178,0,255),
		},
	},
	
	Headlamp_sprites = {
		{pos = Vector(143,32,36),size = 50,material = "sprites/light_ignorez"},
		{pos = Vector(143,-34,36),size = 50,material = "sprites/light_ignorez"},
		{pos = Vector(143,31,36),size = 50,material = "sprites/light_ignorez"},
		{pos = Vector(143,-33,36),size = 50,material = "sprites/light_ignorez"},
		{pos = Vector(143,30,36),size = 50,material = "sprites/light_ignorez"},
		{pos = Vector(143,-32,36),size = 50,material = "sprites/light_ignorez"},
	},
	Rearlight_sprites = {
		{
			pos = Vector(-158,35,40),
			material = "sprites/light_ignorez",
			size = 50,
			color = Color(255,0,0,255),
		},
		{
			pos = Vector(-158,-35,40),
			material = "sprites/light_ignorez",
			size = 50,
			color = Color(255,0,0,255),
		},
	},
	Brakelight_sprites = {
		{
			pos = Vector(-158,35,40),
			material = "sprites/light_ignorez",
			size = 60,
			color = Color(255,0,0,255),
		},
		{
			pos = Vector(-158,-35,40),
			material = "sprites/light_ignorez",
			size = 60,
			color = Color(255,0,0,255),
		},
	},
	Reverselight_sprites = {
		{
			pos = Vector(-158,-30,40),
			material = "sprites/light_ignorez",
			size = 30,
			color = Color(255,255,255,255),
		},
		{
			pos = Vector(-158,30,40),
			material = "sprites/light_ignorez",
			size = 30,
			color = Color(255,255,255,255),
		},
	},
}
list.Set( "simfphys_lights", "M1078 LMTV Truck2", light_table)

local V = {
	Name = "M1078Short Пулемет",
	Model = "models/crysis/truck_mg/asian_truck_s_gun.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = Category,
	SpawnOffset = Vector(0,0,60),
	SpawnAngleOffset = 180,

	Members = {
		Mass = 3000,
		EnginePos = Vector(147,0,40),
		BulletProofTires = false,
		
		LightsTable = "M1078 LMTV Truck2",
		
		MaxHealth = 5000,
		
		IsArmored = false,
		
		OnSpawn = 
			function(ent) 
				ent:SetSkin(math.random(0,1))
				ent:SetNWBool( "simfphys_NoRacingHud", true )
				ent:SetNWBool( "simfphys_NoHud", false ) 
			end,
			
		OnDestroyed =
			function(ent)
				if IsValid( ent.Gib ) then
					ent.Gib:PhysicsInit(6)
					ent.Gib:SetCollisionGroup(0)
					local yaw = ent.sm_ppmg_yaw or 0
					local pitch = ent.sm_ppmg_pitch or 0
					ent.Gib:SetPoseParameter("mg_aim_yaw", yaw )
					ent.Gib:SetPoseParameter("mg_aim_pitch", pitch )
				end
			end,
				
		CustomWheels = true,       	 
		CustomSuspensionTravel = 10,	
		
		FrontWheelRadius = 20,
		RearWheelRadius = 20,
		
		CustomWheelModel = "models/crysis/wheel/awheel.mdl",	-- since we create our own wheels we have to define a model. It has to have a collission model
		--CustomWheelModel_R = "",
		CustomWheelPosFL = Vector(97,39,18),
		CustomWheelPosFR = Vector(97,-39,18),
		CustomWheelPosRL = Vector(-103,39,18),
		CustomWheelPosRR = Vector(-103,-39,18),
		CustomWheelPosML = Vector(-53,39,18),
		CustomWheelPosMR = Vector(-53,-39,18),
		CustomWheelAngleOffset = Angle(0,-90,0),
		
		CustomMassCenter = Vector(-22,0,4),
		
		CustomSteerAngle = 30,

		SeatOffset = Vector(100,-24,87),
		SeatPitch = 0,
		SeatYaw = 90,
		
		PassengerSeats = {
			{
				pos = Vector(110,0,60),
				ang = Angle(0,-90,0),
				anim = "pose_standing_01",
			},
			{
				pos = Vector(103,-24,55),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(-48,-38,60),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(-48,38,60),
				ang = Angle(0,180,0)
			},
			{
				pos = Vector(-82,-38,60),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(-82,38,60),
				ang = Angle(0,180,0)
			},
			{
				pos = Vector(-125,-38,60),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(-125,38,60),
				ang = Angle(0,180,0)
			},

		},

		FrontHeight = 1,
		FrontConstant = 100000,
		FrontDamping = 8000,
		FrontRelativeDamping = 8000,
		
		RearHeight = 1,
		RearConstant = 100000,
		RearDamping = 8000,
		RearRelativeDamping = 8000,
		
		FastSteeringAngle = 20,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 4,
		
		MaxGrip = 120,
		Efficiency = 0.7,
		GripOffset = -0,
		BrakePower = 65,
		
		IdleRPM = 700,
		LimitRPM = 4500,
		PeakTorque = 100,
		PowerbandStart = 700,
		PowerbandEnd = 4800,
		Turbocharged = false,
		Supercharged = false,
		
		FuelFillPos = Vector(38,40,32),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 80,
		
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
list.Set( "simfphys_vehicles", "sim_fphys_crysis_cargotruck_short_mg", V )

local V = {
	Name = "M1078Short",
	Model = "models/crysis/truck/asian_truck_s.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = Category,
	SpawnOffset = Vector(0,0,60),
	SpawnAngleOffset = 180,

	Members = {
		Mass = 3000,
		EnginePos = Vector(147,0,40),
		BulletProofTires = false,
		
		LightsTable = "M1078 LMTV Truck2",
		
		MaxHealth = 5000,
		
		IsArmored = false,
		
		OnSpawn = 
			function(ent) 
				ent:SetSkin(math.random(0,1))
				ent:SetNWBool( "simfphys_NoRacingHud", true )
				ent:SetNWBool( "simfphys_NoHud", false ) 
			end,
			
		OnDestroyed =
			function(ent)
				if IsValid( ent.Gib ) then
					ent.Gib:PhysicsInit(6)
					ent.Gib:SetCollisionGroup(0)
					local yaw = ent.sm_ppmg_yaw or 0
					local pitch = ent.sm_ppmg_pitch or 0
					ent.Gib:SetPoseParameter("mg_aim_yaw", yaw )
					ent.Gib:SetPoseParameter("mg_aim_pitch", pitch )
				end
			end,
				
		CustomWheels = true,       	 -- You have to set this to "true" in order to define custom wheels
		CustomSuspensionTravel = 10,	--suspension travel limiter length
		
		FrontWheelRadius = 20,
		RearWheelRadius = 20,
		
		CustomWheelModel = "models/crysis/wheel/awheel.mdl",	-- since we create our own wheels we have to define a model. It has to have a collission model
		--CustomWheelModel_R = "",			-- different model for rear wheels?
		CustomWheelPosFL = Vector(97,39,18),		-- set the position of the front left wheel. 
		CustomWheelPosFR = Vector(97,-39,18),	-- position front right wheel
		CustomWheelPosRL = Vector(-103,39,18),	-- rear left
		CustomWheelPosRR = Vector(-103,-39,18),
		CustomWheelPosML = Vector(-53,39,18),
		CustomWheelPosMR = Vector(-53,-39,18),		-- rear right		NOTE: make sure the position actually matches the name. So FL is actually at the Front Left ,  FR Front Right, ...   if you do this wrong the wheels will spin in the wrong direction or the car will drive sideways/reverse
		CustomWheelAngleOffset = Angle(0,-90,0),
		
		CustomMassCenter = Vector(-22,0,4),		-- custom masscenter offset. The script creates a counter weight to make the masscenter exactly in the center of the wheels. However you can add an offset to this to create more body roll if you really have to...
		
		CustomSteerAngle = 30,				-- max clamped steering angle,

		SeatOffset = Vector(100,-24,87),
		SeatPitch = 0,
		SeatYaw = 90,
		
		-- everything below this comment is exactly the same as for normal vehicles. For more info take a look in simfphys_spawnlist.lua
		
		PassengerSeats = {
			{
				pos = Vector(103,-24,55),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(-48,-38,60),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(-48,38,60),
				ang = Angle(0,180,0)
			},
			{
				pos = Vector(-82,-38,60),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(-82,38,60),
				ang = Angle(0,180,0)
			},
			{
				pos = Vector(-125,-38,60),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(-125,38,60),
				ang = Angle(0,180,0)
			},

		},

		FrontHeight = 1,
		FrontConstant = 100000,
		FrontDamping = 8000,
		FrontRelativeDamping = 8000,
		
		RearHeight = 1,
		RearConstant = 100000,
		RearDamping = 8000,
		RearRelativeDamping = 8000,
		
		FastSteeringAngle = 16,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 4,
		
		MaxGrip = 120,
		Efficiency = 0.7,
		GripOffset = -0,
		BrakePower = 65,
		
		IdleRPM = 700,
		LimitRPM = 4500,
		PeakTorque = 100,
		PowerbandStart = 700,
		PowerbandEnd = 4800,
		Turbocharged = false,
		Supercharged = false,
		
		FuelFillPos = Vector(38,40,32),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 80,
		
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
list.Set( "simfphys_vehicles", "sim_fphys_crysis_cargotruck_short", V )

local V = {
	Name = "M1078Long Пулемет",
	Model = "models/crysis/truck_mg/asian_truck_l_mg.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = Category,
	SpawnOffset = Vector(0,0,60),
	SpawnAngleOffset = 180,

	Members = {
		Mass = 3000,
		EnginePos = Vector(147,0,40),
		BulletProofTires = false,
		
		LightsTable = "M1078 LMTV Truck2",
		
		MaxHealth = 5000,
		
		IsArmored = false,
		
		OnSpawn = 
			function(ent) 
				ent:SetSkin(math.random(0,1))
				ent:SetNWBool( "simfphys_NoRacingHud", true )
				ent:SetNWBool( "simfphys_NoHud", false ) 
			end,
			
		OnDestroyed =
			function(ent)
				if IsValid( ent.Gib ) then
					ent.Gib:PhysicsInit(6)
					ent.Gib:SetCollisionGroup(0)
					local yaw = ent.sm_ppmg_yaw or 0
					local pitch = ent.sm_ppmg_pitch or 0
					ent.Gib:SetPoseParameter("mg_aim_yaw", yaw )
					ent.Gib:SetPoseParameter("mg_aim_pitch", pitch )
				end
			end,
				
		CustomWheels = true,       	 -- You have to set this to "true" in order to define custom wheels
		CustomSuspensionTravel = 10,	--suspension travel limiter length
		
		FrontWheelRadius = 20,
		RearWheelRadius = 20,
		
		CustomWheelModel = "models/crysis/wheel/awheel.mdl",	-- since we create our own wheels we have to define a model. It has to have a collission model
		--CustomWheelModel_R = "",			-- different model for rear wheels?
		CustomWheelPosFL = Vector(97,39,18),		-- set the position of the front left wheel. 
		CustomWheelPosFR = Vector(97,-39,18),	-- position front right wheel
		CustomWheelPosRL = Vector(-103,39,18),	-- rear left
		CustomWheelPosRR = Vector(-103,-39,18),
		CustomWheelPosML = Vector(-53,39,18),
		CustomWheelPosMR = Vector(-53,-39,18),		-- rear right		NOTE: make sure the position actually matches the name. So FL is actually at the Front Left ,  FR Front Right, ...   if you do this wrong the wheels will spin in the wrong direction or the car will drive sideways/reverse
		CustomWheelAngleOffset = Angle(0,-90,0),
		
		CustomMassCenter = Vector(-22,0,4),		-- custom masscenter offset. The script creates a counter weight to make the masscenter exactly in the center of the wheels. However you can add an offset to this to create more body roll if you really have to...
		
		CustomSteerAngle = 30,				-- max clamped steering angle,

		SeatOffset = Vector(100,-24,87),
		SeatPitch = 0,
		SeatYaw = 90,
		
		-- everything below this comment is exactly the same as for normal vehicles. For more info take a look in simfphys_spawnlist.lua
		
		PassengerSeats = {
			{
				pos = Vector(110,0,60),
				ang = Angle(0,-90,0),
				anim = "pose_standing_01",
			},
			{
				pos = Vector(103,-24,55),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(32,-38,60),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(-5,-38,60),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(-65,-38,60),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(-105,-38,60),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(32,38,60),
				ang = Angle(0,-180,0)
			},
			{
				pos = Vector(-5,38,60),
				ang = Angle(0,-180,0)
			},
			{
				pos = Vector(-65,38,60),
				ang = Angle(0,-180,0)
			},
			{
				pos = Vector(-105,38,60),
				ang = Angle(0,-180,0)
			},

		},

		FrontHeight = 1,
		FrontConstant = 100000,
		FrontDamping = 8000,
		FrontRelativeDamping = 8000,
		
		RearHeight = 1,
		RearConstant = 100000,
		RearDamping = 8000,
		RearRelativeDamping = 8000,
		
		FastSteeringAngle = 16,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 4,
		
		MaxGrip = 120,
		Efficiency = 0.7,
		GripOffset = -0,
		BrakePower = 65,
		
		IdleRPM = 700,
		LimitRPM = 4500,
		PeakTorque = 100,
		PowerbandStart = 700,
		PowerbandEnd = 4800,
		Turbocharged = false,
		Supercharged = false,
		
		FuelFillPos = Vector(38,40,32),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 80,
		
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
list.Set( "simfphys_vehicles", "sim_fphys_crysis_cargotruck_long_mg", V )

local V = {
	Name = "M1078Long",
	Model = "models/crysis/truck/asian_truck_l.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = Category,
	SpawnOffset = Vector(0,0,60),
	SpawnAngleOffset = 180,

	Members = {
		Mass = 3000,
		EnginePos = Vector(147,0,40),
		BulletProofTires = false,
		
		LightsTable = "M1078 LMTV Truck2",
		
		MaxHealth = 5000,
		
		IsArmored = false,
		
		OnSpawn = 
			function(ent) 
				ent:SetSkin(math.random(0,1))
				ent:SetNWBool( "simfphys_NoRacingHud", true )
				ent:SetNWBool( "simfphys_NoHud", false ) 
			end,
			
		OnDestroyed =
			function(ent)
				if IsValid( ent.Gib ) then
					ent.Gib:PhysicsInit(6)
					ent.Gib:SetCollisionGroup(0)
					local yaw = ent.sm_ppmg_yaw or 0
					local pitch = ent.sm_ppmg_pitch or 0
					ent.Gib:SetPoseParameter("mg_aim_yaw", yaw )
					ent.Gib:SetPoseParameter("mg_aim_pitch", pitch )
				end
			end,
				
		CustomWheels = true,       	 -- You have to set this to "true" in order to define custom wheels
		CustomSuspensionTravel = 10,	--suspension travel limiter length
		
		FrontWheelRadius = 20,
		RearWheelRadius = 20,
		
		CustomWheelModel = "models/crysis/wheel/awheel.mdl",	-- since we create our own wheels we have to define a model. It has to have a collission model
		--CustomWheelModel_R = "",			-- different model for rear wheels?
		CustomWheelPosFL = Vector(97,39,18),		-- set the position of the front left wheel. 
		CustomWheelPosFR = Vector(97,-39,18),	-- position front right wheel
		CustomWheelPosRL = Vector(-103,39,18),	-- rear left
		CustomWheelPosRR = Vector(-103,-39,18),
		CustomWheelPosML = Vector(-53,39,18),
		CustomWheelPosMR = Vector(-53,-39,18),		-- rear right		NOTE: make sure the position actually matches the name. So FL is actually at the Front Left ,  FR Front Right, ...   if you do this wrong the wheels will spin in the wrong direction or the car will drive sideways/reverse
		CustomWheelAngleOffset = Angle(0,-90,0),
		
		CustomMassCenter = Vector(-22,0,4),		-- custom masscenter offset. The script creates a counter weight to make the masscenter exactly in the center of the wheels. However you can add an offset to this to create more body roll if you really have to...
		
		CustomSteerAngle = 30,				-- max clamped steering angle,

		SeatOffset = Vector(100,-24,87),
		SeatPitch = 0,
		SeatYaw = 90,
		
		-- everything below this comment is exactly the same as for normal vehicles. For more info take a look in simfphys_spawnlist.lua
		
		PassengerSeats = {
			{
				pos = Vector(103,-24,55),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(32,-38,60),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(-5,-38,60),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(-65,-38,60),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(-105,-38,60),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(32,38,60),
				ang = Angle(0,-180,0)
			},
			{
				pos = Vector(-5,38,60),
				ang = Angle(0,-180,0)
			},
			{
				pos = Vector(-65,38,60),
				ang = Angle(0,-180,0)
			},
			{
				pos = Vector(-105,38,60),
				ang = Angle(0,-180,0)
			},

		},

		FrontHeight = 1,
		FrontConstant = 100000,
		FrontDamping = 8000,
		FrontRelativeDamping = 8000,
		
		RearHeight = 1,
		RearConstant = 100000,
		RearDamping = 8000,
		RearRelativeDamping = 8000,
		
		FastSteeringAngle = 16,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 4,
		
		MaxGrip = 120,
		Efficiency = 0.7,
		GripOffset = -0,
		BrakePower = 65,
		
		IdleRPM = 700,
		LimitRPM = 4500,
		PeakTorque = 100,
		PowerbandStart = 700,
		PowerbandEnd = 4800,
		Turbocharged = false,
		Supercharged = false,
		
		FuelFillPos = Vector(38,40,32),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 80,
		
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
list.Set( "simfphys_vehicles", "sim_fphys_crysis_cargotruck_long", V )
