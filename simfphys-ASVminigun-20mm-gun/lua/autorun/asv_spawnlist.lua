local light_table = {
	L_HeadLampPos = Vector(113,-34,37),
	L_HeadLampAng = Angle(0,0,0),
	R_HeadLampPos = Vector(113,34,37),
	R_HeadLampAng = Angle(0,0,0),
	
	Headlight_sprites = {   -- lowbeam
		{
			pos = Vector(113,34,37),
			material = "sprites/light_ignorez",
			size = 30,
			color = Color(255,238,200,255),
		},
		{
			pos = Vector(113,-34,37),
			material = "sprites/light_ignorez",
			size = 30,
			color = Color(255,238,200,255),
		},
		{
			pos = Vector(113,28,37),
			material = "sprites/light_ignorez",
			size = 30,
			color = Color(255,238,200,255),
		},
		{
			pos = Vector(113,-27,37),
			material = "sprites/light_ignorez",
			size = 30,
			color = Color(255,238,200,255),
		},
	},
	Rearlight_sprites = {
		Vector(-108,-42,53.5),Vector(-108,-43,53.5),Vector(-108,-44,53.5),Vector(-108,-45,53.5),Vector(-108,-41,53.5),
		Vector(-108,42,53.5),Vector(-108,43,53.5),Vector(-108,44,53.5),Vector(-108,45,53.5),Vector(-108,41,53.5),
	},
	Brakelight_sprites = {
		Vector(-108,-42,53.5),Vector(-108,-43,53.5),Vector(-108,-44,53.5),Vector(-108,-45,53.5),Vector(-108,-41,53.5),Vector(-96,-47,15),
		Vector(-108,42,53.5),Vector(-108,43,53.5),Vector(-108,44,53.5),Vector(-108,45,53.5),Vector(-108,41,53.5),Vector(-96,48,15),
	},
	
}
list.Set( "simfphys_lights", "asv", light_table)

local V = {
	Name = "ASV 20MM",
	Model = "models/crysis/asv/asv2.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Легкая бронетехника",
	SpawnOffset = Vector(0,0,0),
	SpawnAngleOffset = 180,

	Members = {
		Mass = 2500,
		EnginePos = Vector(-80,0,50),
		BulletProofTires = true,
		
		LightsTable = "asv",
		
		MaxHealth = 5000,
		
		IsArmored = true,
		
		OnSpawn = 
			function(ent) 
				ent:SetSkin(math.random(0,2))
				ent:SetNWBool( "simfphys_NoRacingHud", true )
				ent:SetNWBool( "simfphys_NoHud", false ) 
			end,		
		
		ApplyDamage = function( ent, damage, type ) 
			simfphys.TankApplyDamage(ent, damage, type)
		end,
		
		OnDestroyed =
			function(ent)
				if IsValid( ent.Gib ) then
					ent.Gib:PhysicsInit(6)
					ent.Gib:SetCollisionGroup(0)
					local yaw = ent.sm_pp_yaw or 0
					local pitch = ent.sm_pp_pitch or 0
					ent.Gib:SetPoseParameter("cannon_aim_yaw", yaw )
					ent.Gib:SetPoseParameter("cannon_aim_pitch", -pitch )
				end
			end,
				
		CustomWheels = true,       	 -- You have to set this to "true" in order to define custom wheels
		CustomSuspensionTravel = 10,	--suspension travel limiter length
		
		FrontWheelRadius = 23,		-- if you set CustomWheels to true then the script will figure the radius out by itself using the CustomWheelModel
		RearWheelRadius = 23,
		
		CustomWheelModel = "models/crysis/asv/wheels/asv_wheel.mdl",	-- since we create our own wheels we have to define a model. It has to have a collission model
		--CustomWheelModel_R = "",			-- different model for rear wheels?
		CustomWheelPosFL = Vector(68,48,2),		-- set the position of the front left wheel. 
		CustomWheelPosFR = Vector(68,-48,2),	-- position front right wheel
		CustomWheelPosRL = Vector(-59,48,2),	-- rear left
		CustomWheelPosRR = Vector(-59,-48,2),	-- rear right		NOTE: make sure the position actually matches the name. So FL is actually at the Front Left ,  FR Front Right, ...   if you do this wrong the wheels will spin in the wrong direction or the car will drive sideways/reverse
		CustomWheelAngleOffset = Angle(0,-90,0),
		
		CustomMassCenter = Vector(0,0,8),		-- custom masscenter offset. The script creates a counter weight to make the masscenter exactly in the center of the wheels. However you can add an offset to this to create more body roll if you really have to...
		
		CustomSteerAngle = 30,				-- max clamped steering angle,

		SeatOffset = Vector(39,0,54),
		SeatPitch = 0,
		SeatYaw = 90,
		
		PassengerSeats = {
			{
				pos = Vector(-10,-29,20),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(-10,29,20),
				ang = Angle(0,-90,0)
			},
		},

		FrontHeight = 1,
		FrontConstant = 80000,
		FrontDamping = 6000,
		FrontRelativeDamping = 4000,
		
		RearHeight = 1,
		RearConstant = 80000,
		RearDamping = 6000,
		RearRelativeDamping = 4000,
		
		FastSteeringAngle = 20,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 4,
		
		MaxGrip = 120,
		Efficiency = 1,
		GripOffset = -1,
		BrakePower = 80,
		
		IdleRPM = 700,
		LimitRPM = 5000,
		PeakTorque = 160,
		PowerbandStart = 700,
		PowerbandEnd = 4800,
		Turbocharged = false,
		Supercharged = false,
		
		FuelFillPos = Vector(-40,48,48),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 65,
		
		PowerBias = 2,
		
		EngineSoundPreset = -1,
		
		snd_pitch = 1,
		snd_idle = "simulated_vehicles/4banger/4banger_idle.wav",
		
		snd_low = "simulated_vehicles/4banger/4banger_low.wav",
		snd_low_pitch = 0.6,
		
		snd_mid = "simulated_vehicles/4banger/4banger_mid.wav",
		snd_mid_gearup = "simulated_vehicles/4banger/4banger_second.wav",
		snd_mid_pitch = 0.5,
		
		snd_horn = "simulated_vehicles/horn_2.wav",
		
		DifferentialGear = 0.28,
		Gears = {-0.112,0,0.2,0.25,0.265}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_asv_20mm", V )

local V = {
	Name = "ASV minigun",
	Model = "models/crysis/asv/asv1.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Легкая бронетехника",
	SpawnOffset = Vector(0,0,0),
	SpawnAngleOffset = 180,

	Members = {
		Mass = 2500,
		EnginePos = Vector(-80,0,50),
		BulletProofTires = true,
		
		LightsTable = "asv",
		
		MaxHealth = 5000,
		
		IsArmored = true,
		
		OnSpawn = 
			function(ent) 
				ent:SetSkin(math.random(0,2))
				ent:SetNWBool( "simfphys_NoRacingHud", true )
				ent:SetNWBool( "simfphys_NoHud", false ) 
			end,
			
		ApplyDamage = function( ent, damage, type ) 
			simfphys.TankApplyDamage(ent, damage, type)
		end,
		
		OnDestroyed =
			function(ent)
				if IsValid( ent.Gib ) then
					ent.Gib:PhysicsInit(6)
					ent.Gib:SetCollisionGroup(0)
					local yaw = ent.sm_pp_yaw or 0
					local pitch = ent.sm_pp_pitch or 0
					ent.Gib:SetPoseParameter("cannon_aim_yaw", yaw )
					ent.Gib:SetPoseParameter("cannon_aim_pitch", -pitch )
				end
			end,
				
		CustomWheels = true,       	 -- You have to set this to "true" in order to define custom wheels
		CustomSuspensionTravel = 10,	--suspension travel limiter length
		
		FrontWheelRadius = 23,		-- if you set CustomWheels to true then the script will figure the radius out by itself using the CustomWheelModel
		RearWheelRadius = 23,
		
		CustomWheelModel = "models/crysis/asv/wheels/asv_wheel.mdl",	-- since we create our own wheels we have to define a model. It has to have a collission model
		--CustomWheelModel_R = "",			-- different model for rear wheels?
		CustomWheelPosFL = Vector(68,48,2),		-- set the position of the front left wheel. 
		CustomWheelPosFR = Vector(68,-48,2),	-- position front right wheel
		CustomWheelPosRL = Vector(-59,48,2),	-- rear left
		CustomWheelPosRR = Vector(-59,-48,2),	-- rear right		NOTE: make sure the position actually matches the name. So FL is actually at the Front Left ,  FR Front Right, ...   if you do this wrong the wheels will spin in the wrong direction or the car will drive sideways/reverse
		CustomWheelAngleOffset = Angle(0,-90,0),
		
		CustomMassCenter = Vector(1,0,10),		-- custom masscenter offset. The script creates a counter weight to make the masscenter exactly in the center of the wheels. However you can add an offset to this to create more body roll if you really have to...
		
		CustomSteerAngle = 30,				-- max clamped steering angle,

		SeatOffset = Vector(39,0,54),
		SeatPitch = 0,
		SeatYaw = 90,

		
		PassengerSeats = {
			{
				pos = Vector(-10,-29,20),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(-10,29,20),
				ang = Angle(0,-90,0)
			},
		},

		FrontHeight = 1,
		FrontConstant = 80000,
		FrontDamping = 6000,
		FrontRelativeDamping = 4000,
		
		RearHeight = 1,
		RearConstant = 80000,
		RearDamping = 6000,
		RearRelativeDamping = 4000,
		
		FastSteeringAngle = 20,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 4,
		
		MaxGrip = 120,
		Efficiency = 1,
		GripOffset = -1,
		BrakePower = 80,
		
		IdleRPM = 700,
		LimitRPM = 5000,
		PeakTorque = 160,
		PowerbandStart = 700,
		PowerbandEnd = 4800,
		Turbocharged = false,
		Supercharged = false,
		
		FuelFillPos = Vector(-40,48,48),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 65,
		
		PowerBias = 2,
		
		EngineSoundPreset = -1,
		
		snd_pitch = 1,
		snd_idle = "simulated_vehicles/4banger/4banger_idle.wav",
		
		snd_low = "simulated_vehicles/4banger/4banger_low.wav",
		snd_low_pitch = 0.6,
		
		snd_mid = "simulated_vehicles/4banger/4banger_mid.wav",
		snd_mid_gearup = "simulated_vehicles/4banger/4banger_second.wav",
		snd_mid_pitch = 0.5,
		
		snd_horn = "simulated_vehicles/horn_2.wav",
		
		DifferentialGear = 0.28,
		Gears = {-0.112,0,0.2,0.25,0.265}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_asv_minigun", V )

