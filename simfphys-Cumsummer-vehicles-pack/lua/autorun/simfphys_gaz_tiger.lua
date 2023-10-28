
AddCSLuaFile()

local light_table = {
	L_HeadLampPos = Vector(28,100,45),
	L_HeadLampAng = Angle(0,90,0),

	R_HeadLampPos = Vector(-28,100,45),
	R_HeadLampAng = Angle(0,90,0),

	L_RearLampPos = Vector(35,-92,30),
	L_RearLampAng = Angle(0,-90,0),

	R_RearLampPos = Vector(-35,-92,30),
	R_RearLampAng = Angle(0,-90,0),
	
	Headlight_sprites = { 
		Vector(36,95,47),
		Vector(-36,95,47),
	},
	Headlamp_sprites = { 
		Vector(28,100,45),
		Vector(-28,100,45),
		Vector(28,100,45),
		Vector(-28,100,45),
	},
	FogLight_sprites = {
		Vector(0,27,93),
		Vector(-40,-85,90),
	},
	Rearlight_sprites = {
		Vector(35,-91,29),
		Vector(-35,-91,29),
	},
	Brakelight_sprites = {
		Vector(37,-91,29),
		Vector(-37,-91,29),
	},
	Reverselight_sprites = {
		Vector(30,-91,29),
		Vector(-30,-91,29),
	},
		Turnsignal_sprites = {
		Left = {
			Vector(-40,-91,29),
			
			Vector(-36,95,49),
			Vector(-45,53,47),
		},
		Right = {
			Vector(40,-91,29),
			
			Vector(36,95,49),
			Vector(45,53,47),
		},
	}
}
list.Set( "simfphys_lights", "Gaz_tiger", light_table)

local V = {
	Name = "Газ Тигр",
	Model = "models/gaz_tiger/gaz_tiger_rigged.mdl",
	ModelOffset = Angle(0,90,20),
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Бронемашины",
	
	Members = {
		Mass = 3400,
		
		OnSpawn = 
		function(ent) 
			ent:SetSkin(math.random(0,3))
		end,
		
		CustomMassCenter = Vector(3,0,10),
		EnginePos = Vector(0,80,60),
		
		SpeedoMax = 70,
		
		LightsTable = "Gaz_tiger",
		
		MaxHealth = 4500,
		
		IsArmored = true,
		
		CustomWheels = true,
		CustomSuspensionTravel = 15,
		
		CustomWheelModel = "models/gaz_tiger/gaz_tiger_wheel.mdl",
		CustomWheelPosFL = Vector(-37,75,22),
		CustomWheelPosFR = Vector(37,75,22),
		CustomWheelPosRL = Vector(-37,-60,22),	
		CustomWheelPosRR = Vector(37,-60,22),
		CustomWheelAngleOffset = Angle(0,0,0),
		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(5,-24,70),
        SeatPitch = 0,
		SeatYaw = 0,
		
		PassengerSeats = {
			{
				pos = Vector(24,5,35),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(20,-35,30),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(-20,-35,30),
				ang = Angle(0,0,0)
			},
		},
				
		ExhaustPositions = {
			{
				pos = Vector(17,-80,16),
				ang = Angle(-90,90,0)
			},
		},
		
		FuelFillPos = Vector(44,8,35.5),
		FuelType = FUELTYPE_DIESEL,
		FuelTankSize = 80,
		
		StrengthenSuspension = true,
		
		FrontHeight = 10,
		FrontConstant = 45000,
		FrontDamping = 2000,
		FrontRelativeDamping = 2000,
		
		RearHeight = 10,
		RearConstant = 45000,
		RearDamping = 2000,
		RearRelativeDamping = 2000,
		
		FastSteeringAngle = 30,
		SteeringFadeFastSpeed = 445,
		
		TurnSpeed = 4,
		
		MaxGrip = 85,
		Efficiency = 0.80,
		GripOffset = -2,
		BrakePower = 30,
		BulletProofTires = true,
		
		IdleRPM = 700,
		LimitRPM = 6500,
		PeakTorque = 140,
		PowerbandStart = 1000,
		PowerbandEnd = 6000,
		Turbocharged = true,
		Supercharged = false,
		
		PowerBias = 0,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/misc/nanjing_loop.wav",
		Sound_IdlePitch = 0.7,
		
		Sound_Mid = "simulated_vehicles/alfaromeo/alfons_low.wav",
		Sound_MidPitch = 0.5,
		Sound_MidVolume = 2,
		Sound_MidFadeOutRPMpercent = 70,		-- at wich percentage of limitrpm the sound fades out
		Sound_MidFadeOutRate = 0.44,                    --how fast it fades out   0 = instant       1 = never
		
		Sound_High = "simulated_vehicles/misc/v8high2.wav",
		Sound_HighPitch = 0.7,
		Sound_HighVolume = 4.0,
		Sound_HighFadeInRPMpercent = 25,
		Sound_HighFadeInRate = 0.44,
		
		Sound_Throttle = "",		-- mutes the default throttle sound
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "simulated_vehicles/horn_3.wav",
		
		DifferentialGear = 0.50,
		Gears = {-0.05,0,0.04,0.06,0.08,0.1}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_mw3_gaz_tiger", V )