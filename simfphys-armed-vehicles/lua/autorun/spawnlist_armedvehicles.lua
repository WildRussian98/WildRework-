-- DO NOT EDIT OR REUPLOAD THIS SCRIPT
-- DO NOT EDIT OR REUPLOAD THIS SCRIPT
-- DO NOT EDIT OR REUPLOAD THIS SCRIPT
-- DO NOT EDIT OR REUPLOAD THIS SCRIPT
-- DO NOT EDIT OR REUPLOAD THIS SCRIPT
-- DO NOT EDIT OR REUPLOAD THIS SCRIPT
-- DO NOT EDIT OR REUPLOAD THIS SCRIPT
-- DO NOT EDIT OR REUPLOAD THIS SCRIPT
-- DO NOT EDIT OR REUPLOAD THIS SCRIPT
-- DO NOT EDIT OR REUPLOAD THIS SCRIPT
-- DO NOT EDIT OR REUPLOAD THIS SCRIPT
-- DO NOT EDIT OR REUPLOAD THIS SCRIPT
-- DO NOT EDIT OR REUPLOAD THIS SCRIPT
-- DO NOT EDIT OR REUPLOAD THIS SCRIPT
-- DO NOT EDIT OR REUPLOAD THIS SCRIPT
-- DO NOT EDIT OR REUPLOAD THIS SCRIPT
-- DO NOT EDIT OR REUPLOAD THIS SCRIPT
-- DO NOT EDIT OR REUPLOAD THIS SCRIPT
-- DO NOT EDIT OR REUPLOAD THIS SCRIPT
--YES :З

local light_table = {	
	ems_sounds = {"ambient/alarms/apc_alarm_loop1.wav"},
}
list.Set( "simfphys_lights", "capc_siren", light_table)

local light_table = {
	L_HeadLampPos = Vector(71.9,32.85,-5.59),
	L_HeadLampAng = Angle(15,0,0),
	R_HeadLampPos = Vector(71.9,-32.85,-5.59),
	R_HeadLampAng = Angle(15,0,0),

	L_RearLampPos =Vector(-94,29.08,3.7),
	L_RearLampAng = Angle(40,180,0),
	R_RearLampPos = Vector(-94,-29.08,3.7),
	R_RearLampAng = Angle(40,180,0),
	
	Headlight_sprites = { 
		Vector(71.9,32.85,-5.59),
		Vector(71.9,-32.85,-5.59)
	},
	Headlamp_sprites = { 
		Vector(76.36,26.72,-5.79),
		Vector(76.36,-26.72,-5.79)
	},
	Rearlight_sprites = {
		Vector(-94,34.39,3.7),
		Vector(-94,-34.39,3.7)
	},
	Brakelight_sprites = {
		Vector(-94,29.08,3.7),
		Vector(-94,-29.08,3.7)
	}
}
list.Set( "simfphys_lights", "driprip_ratmobile", light_table)

local light_table = {
	L_HeadLampPos = Vector(-122.5,-33.02,25.81),
	L_HeadLampAng = Angle(15,180,0),
	R_HeadLampPos = Vector(-122.5,33.02,25.81),
	R_HeadLampAng = Angle(15,180,0),
	
	Headlight_sprites = { 
		Vector(-122.5,-33.02,25.81),
		Vector(-122.5,33.02,25.81)
	},
	Headlamp_sprites = { 
		Vector(-122.5,-33.02,25.81),
		Vector(-122.5,33.02,25.81)
	},
	
	Rearlight_sprites = {
		Vector(150.06,-55.65,36.7),
	},
	Brakelight_sprites = {
		Vector(150.06,-55.65,36.7),
	},
}
list.Set( "simfphys_lights", "t90ms", light_table)


local light_table = {
	L_HeadLampPos = Vector(-32.85,147.6,45.07),
	L_HeadLampAng = Angle(15,90,0),
	R_HeadLampPos = Vector(32.85,147.6,45.07),
	R_HeadLampAng = Angle(15,90,0),
	
	Headlight_sprites = { 
		Vector(-32.85,147.6,45.07),
		Vector(32.85,147.6,45.07)
	},
	Headlamp_sprites = { 
		Vector(-32.85,147.6,45.07),
		Vector(32.85,147.6,45.07)
	},
	Rearlight_sprites = {
		Vector(-62.95,-153.98,47.47),
		Vector(62.95,-153.98,47.47)
	},
	Brakelight_sprites = {
		Vector(-54.66,-154.5,47.43),
		Vector(54.66,-154.5,47.43),
		Vector(28.12,-145.85,29.81),
		Vector(-28.12,-145.85,29.81),
	},
	
	Turnsignal_sprites = {
		Left = {
			Vector(-59.3,-153.26,47.1),
			Vector(-62.7,132.59,54.49)
		},
		Right = {
			Vector(59.3,-153.26,47.1),
			Vector(62.7,132.59,54.49)
		},
	},


}
list.Set( "simfphys_lights", "leopard", light_table)

local V = {
	Name = "Leopard 2A7 revolution",
	Model = "models/blu/tanks/leopard2a7.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Тяжелая бронетехника",
	SpawnOffset = Vector(0,0,60),
	SpawnAngleOffset = 90,

	Members = {
		Mass = 20000,
		AirFriction = 7,
		--Inertia = Vector(14017.5,46543,47984.5),
		Inertia = Vector(80000,20000,100000),
		
		LightsTable = "leopard",
		
		OnSpawn = 
			function(ent)
				ent:SetSkin(math.random(0,5))
				ent:SetNWBool( "simfphys_NoRacingHud", true )
				ent:SetNWBool( "simfphys_NoHud", true ) 
			end,
		
		ApplyDamage = function( ent, damage, type ) 
			simfphys.TankApplyDamage(ent, damage, type)
		end,
		
		GibModels = {
			"models/blu/tanks/leopard2a7_gib_1.mdl",
			"models/blu/tanks/leopard2a7_gib_2.mdl",
			"models/blu/tanks/leopard2a7_gib_3.mdl",
			"models/blu/tanks/leopard2a7_gib_4.mdl",
			"models/props_c17/pulleywheels_small01.mdl",
			"models/props_c17/pulleywheels_small01.mdl",
		},
		
		MaxHealth = 14000,
		
		IsArmored = true,
		
		NoWheelGibs = true,
		
		FirstPersonViewPos = Vector(0,-50,50),
		
		FrontWheelRadius = 40,
		RearWheelRadius = 45,
		
		EnginePos = Vector(0,-125.72,69.45),
		
		CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		CustomWheelModel = "models/props_c17/canisterchunk01g.mdl",
		--CustomWheelModel = "models/props_vehicles/apc_tire001.mdl",
		
		CustomWheelPosFL = Vector(-50,122,35),
		CustomWheelPosFR = Vector(50,122,35),
		CustomWheelPosML = Vector(-50,0,37),
		CustomWheelPosMR = Vector(50,0,37),
		CustomWheelPosRL = Vector(-50,-110,37),
		CustomWheelPosRR = Vector(50,-110,37),
		CustomWheelAngleOffset = Angle(0,0,90),
		
		CustomMassCenter = Vector(0,0,8),
		
		CustomSteerAngle = 60,
		
		SeatOffset = Vector(55,25,35),
		SeatPitch = -15,
		SeatYaw = 0,
		
		ModelInfo = {
			WheelColor = Color(0,0,0,0),
		},
			
		ExhaustPositions = {
			{
				pos = Vector(-34.53,-147.48,42.92),
				ang = Angle(90,-90,0)
			},
			{
				pos = Vector(34.53,-147.48,42.92),
				ang = Angle(90,-90,0)
			},
			{
				pos = Vector(-34.53,-147.48,42.92),
				ang = Angle(90,-90,0)
			},
			{
				pos = Vector(34.53,-147.48,42.92),
				ang = Angle(90,-90,0)
			},
		},

		
		PassengerSeats = {
			{
				pos = Vector(0,0,40),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(0,0,50),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(0,0,50),
				ang = Angle(0,0,0)
			}
		},
		
		FrontHeight = 27,
		FrontConstant = 50000,
		FrontDamping = 30000,
		FrontRelativeDamping = 300000,
		
		RearHeight = 25,
		RearConstant = 50000,
		RearDamping = 20000,
		RearRelativeDamping = 20000,
		
		FastSteeringAngle = 20,
		SteeringFadeFastSpeed = 300,
		
		TurnSpeed = 3,
		
		MaxGrip = 1000,
		Efficiency = 1,
		GripOffset = -500,
		BrakePower = 450,
		BulletProofTires = true,
		
		IdleRPM = 600,
		LimitRPM = 3500,
		PeakTorque = 380,
		PowerbandStart = 600,
		PowerbandEnd = 2600,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = true,
		
		FuelFillPos = Vector(-53.14,-143.23,71.42),
		FuelType = FUELTYPE_DIESEL,
		FuelTankSize = 220,
		
		PowerBias = -0.3,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/leopard/start.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/leopard/low.wav",
		Sound_MidPitch = 1.3,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 60,
		Sound_MidFadeOutRate = 0.4,
		
		Sound_High = "simulated_vehicles/leopard/high.wav",
		Sound_HighPitch = 1.2,
		Sound_HighVolume = 1,
		Sound_HighFadeInRPMpercent = 45,
		Sound_HighFadeInRate = 0.2,
		
		Sound_Throttle = "",
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "common/null.wav",
		ForceTransmission = 1,
		
		DifferentialGear = 0.4,
		Gears = {-0.03,0,0.04,0.06}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_tank3", V )



local V = {
	Name = "T-90MS",
	Model = "models/blu/tanks/t90ms.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Тяжелая бронетехника",
	SpawnOffset = Vector(0,0,60),
	SpawnAngleOffset = 90,

	Members = {
		Mass = 20000,
		AirFriction = 0,
		--Inertia = Vector(14017.5,46543,47984.5),
		Inertia = Vector(20000,80000,100000),
		
		LightsTable = "t90ms",
		
		OnSpawn = 
			function(ent) 
				ent:SetSkin(math.random(0,7))
				ent:SetNWBool( "simfphys_NoRacingHud", true )
				ent:SetNWBool( "simfphys_NoHud", true ) 
			end,

		ApplyDamage = function( ent, damage, type ) 
			simfphys.TankApplyDamage(ent, damage, type)
		end,
		
		GibModels = {
			"models/blu/tanks/t90ms_gib_1.mdl",
			"models/blu/tanks/t90ms_gib_2.mdl",
			"models/blu/tanks/t90ms_gib_3.mdl",
			"models/blu/tanks/t90ms_gib_4.mdl",
		},
		
		MaxHealth = 14000,
		
		IsArmored = true,
		
		NoWheelGibs = true,
		
		FirstPersonViewPos = Vector(-10,-30,20),
		
		FrontWheelRadius = 40,
		RearWheelRadius = 45,
		
		EnginePos = Vector(106.08,0.69,38.34),
		
		CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		CustomWheelModel = "models/props_c17/canisterchunk01g.mdl",
		--CustomWheelModel = "models/props_vehicles/apc_tire001.mdl",
		
		CustomWheelPosFL = Vector(-122,-50,16),
		CustomWheelPosFR = Vector(-122,50,16),
		CustomWheelPosML = Vector(0,-50,20),
		CustomWheelPosMR = Vector(0,50,20),
		CustomWheelPosRL = Vector(110,-50,20),
		CustomWheelPosRR = Vector(110,50,20),
		CustomWheelAngleOffset = Angle(0,0,90),
		
		CustomMassCenter = Vector(0,0,0),
		
		CustomSteerAngle = 60,
		
		SeatOffset = Vector(68,0,8),
		SeatPitch = -15,
		SeatYaw = -90,
		
		ModelInfo = {
			WheelColor = Color(0,0,0,0),
		},

		
		ExhaustPositions = {
			{
				pos = Vector(71,-75,30.4),
				ang = Angle(115,-90,0)
			},
			{
				pos = Vector(67,-75,30.4),
				ang = Angle(115,-90,0)
			},
			{
				pos = Vector(0,0,50),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(0,0,50),
				ang = Angle(0,-90,0)
			}
		},
		
		
		PassengerSeats = {
			{
				pos = Vector(0,0,0),
				ang = Angle(0,90,0)
			},
			{
				pos = Vector(0,0,0),
				ang = Angle(0,90,0)
			},
			{
				pos = Vector(0,0,0),
				ang = Angle(0,90,0)
			}
		},
		
		FrontHeight = 27,
		FrontConstant = 50000,
		FrontDamping = 30000,
		FrontRelativeDamping = 300000,
		
		RearHeight = 27,
		RearConstant = 50000,
		RearDamping = 20000,
		RearRelativeDamping = 20000,
		
		FastSteeringAngle = 20,
		SteeringFadeFastSpeed = 300,
		
		TurnSpeed = 3,
		
		MaxGrip = 1000,
		Efficiency = 1,
		GripOffset = -500,
		BrakePower = 450,
		BulletProofTires = true,
		
		IdleRPM = 600,
		LimitRPM = 3500,
		PeakTorque = 380,
		PowerbandStart = 600,
		PowerbandEnd = 2600,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = true,
		
		FuelFillPos = Vector(139.42,-3.68,38.38),
		FuelType = FUELTYPE_DIESEL,
		FuelTankSize = 220,
		
		PowerBias = -0.3,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/t90ms/idle.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/t90ms/low.wav",
		Sound_MidPitch = 1.5,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 100,
		Sound_MidFadeOutRate = 1,
		
		Sound_High = "simulated_vehicles/t90ms/high.wav",
		Sound_HighPitch = 1.5,
		Sound_HighVolume = 0.7,
		Sound_HighFadeInRPMpercent = 50,
		Sound_HighFadeInRate = 0.2,
		
		Sound_Throttle = "",
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "common/null.wav",
		ForceTransmission = 1,
		
		DifferentialGear = 0.4,
		Gears = {-0.03,0,0.04,0.06}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_tank4", V )