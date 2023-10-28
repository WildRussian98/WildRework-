
AddCSLuaFile()

local light_table = {
	L_HeadLampPos = Vector(-25,111,47.5),
	L_HeadLampAng = Angle(0,90,0),

	R_HeadLampPos = Vector(-25,111,47.5),
	R_HeadLampAng = Angle(0,90,0),

	L_RearLampPos = Vector(41,-112,50),
	L_RearLampAng = Angle(0,-90,0),

	R_RearLampPos = Vector(-41,-112,50),
	R_RearLampAng = Angle(0,-90,0),
	
	Headlight_sprites = { 
		Vector(23,111,47.5),
		Vector(-23,111,47.5),
	},
	Headlamp_sprites = { 
		Vector(23,111,47.5),
		Vector(-23,111,47.5),
		Vector(23,111,47.5),
		Vector(-23,111,47.5),
	},
	FogLight_sprites = {
		Vector(23,111,47.5),
		Vector(-23,111,47.5),
	},
	Rearlight_sprites = {
		Vector(41,-112,51),
		Vector(-41,-112,51),
	},
	Brakelight_sprites = {
		Vector(41,-112,51),
		Vector(-41,-112,51),
	},
		Turnsignal_sprites = {
		Left = {
			Vector(-44.5,109,52),
			Vector(-52.5,100,53),
			Vector(-52,105,49),
			
			Vector(-52.5,-101,42),
		},
		Right = {
			Vector(44.5,109,52),
			Vector(52.5,100,53),
			Vector(52,105,49),
			
			Vector(52.5,-101,42),
		},
	}
}
list.Set( "simfphys_lights", "HMMVW_SD", light_table)

local V = {
	Name = "Humvee",
	Model = "models/hmmvw_sim/hmmwv_rigged.mdl",
	ModelOffset = Angle(0,90,20),
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Бронемашины",
	
	Members = {
		Mass = 3400,
		
		CustomMassCenter = Vector(3,0,10),
		EnginePos = Vector(0,80,60),
		
		SpeedoMax = 70,
		
		LightsTable = "HMMVW_SD",

		MaxHealth = 4500,
		
		IsArmored = true,
		
		CustomWheels = true,
		CustomSuspensionTravel = 15,
		
		CustomWheelModel = "models/hmmvw_sim/hmmwv_wheel.mdl",
		CustomWheelPosFL = Vector(45,85,20),
		CustomWheelPosFR = Vector(-45,85,20),
		CustomWheelPosRL = Vector(45,-72,20),	
		CustomWheelPosRR = Vector(-45,-72,20),
		CustomWheelAngleOffset = Angle(0,90,0),
		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(6,-33,67),
        SeatPitch = 0,
		SeatYaw = 0,
		
		PassengerSeats = {
			{
				pos = Vector(33,6,33),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(33,-34,33),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(-33,-34,33),
				ang = Angle(0,0,0)
			},
		},
				
		ExhaustPositions = {
			{
				pos = Vector(32,-112,30),
				ang = Angle(150,-90,0),
				OnBodyGroups = { 
					[6] = {0},
				}
			},
			{
				pos = Vector(-32,-112,30),
				ang = Angle(150,-90,0),
				OnBodyGroups = { 
					[6] = {0},
				}
			},
			{
				pos = Vector(-56,-72,101),
				ang = Angle(100,-90,0),
				OnBodyGroups = {
					[10] = {1},
				}
			}
		},
		
		FuelFillPos = Vector(52,-51.5,53),
		FuelType = FUELTYPE_DIESEL,
		FuelTankSize = 90,
		
		StrengthenSuspension = true,
		
		FrontHeight = 6,
		FrontConstant = 45000,
		FrontDamping = 2000,
		FrontRelativeDamping = 2000,
		
		RearHeight = 6,
		RearConstant = 45000,
		RearDamping = 2000,
		RearRelativeDamping = 2000,
		
		FastSteeringAngle = 30,
		SteeringFadeFastSpeed = 445,
		
		TurnSpeed = 4,
		
		MaxGrip = 85,
		Efficiency = 0.75,
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
		Sound_IdlePitch = 0.8,
		
		Sound_Mid = "simulated_vehicles/misc/m50.wav",
		Sound_MidPitch = 1.2,
		Sound_MidVolume = 3,
		Sound_MidFadeOutRPMpercent = 100,		-- at wich percentage of limitrpm the sound fades out
		Sound_MidFadeOutRate = 0.44,                    --how fast it fades out   0 = instant       1 = never
		
		Sound_High = "simulated_vehicles/misc/v8high2.wav",
		Sound_HighPitch = 0.7,
		Sound_HighVolume = 2.7,
		Sound_HighFadeInRPMpercent = 30,
		Sound_HighFadeInRate = 0.44,
		
		Sound_Throttle = "",		-- mutes the default throttle sound
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "simulated_vehicles/horn_3.wav",
		
		DifferentialGear = 0.50,
		Gears = {-0.05,0,0.04,0.06,0.08,0.1}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_hmmwv_sd", V )