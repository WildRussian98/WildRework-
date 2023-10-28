
AddCSLuaFile()

local light_table = {
	L_HeadLampPos = Vector(32,94,29.5),
	L_HeadLampAng = Angle(0,90,0),

	R_HeadLampPos = Vector(-32,94,29.5),
	R_HeadLampAng = Angle(0,90,0),

	L_RearLampPos = Vector(28,-111,31.5),
	L_RearLampAng = Angle(0,-90,0),

	R_RearLampPos = Vector(-28,-111,31.5),
	R_RearLampAng = Angle(0,-90,0),
	
	Headlight_sprites = { 
		Vector(32,94,29.5),
		Vector(-32,94,29.5),
	},
	Headlamp_sprites = { 
		Vector(32,94,29.5),
		Vector(-32,94,29.5),
	},
	FogLight_sprites = {
		Vector(24.5,94,29.5),
		Vector(-24.5,94,29.5),
	},
	Rearlight_sprites = {
		Vector(29.5,-111,31.5),
		Vector(-29.5,-111,31.5),
		Vector(27,-111,31.5),
		Vector(-27,-111,31.5),
	},
	Brakelight_sprites = {
		Vector(25,-111,31.5),
		Vector(-25,-111,31.5),
	},
	Reverselight_sprites = {
		Vector(22,-111,31.5),
		Vector(-22,-111,31.5),
	},
		Turnsignal_sprites = {
		Left = {
			Vector(-26,94,19),
			Vector(-38.5,88,26.5),
			Vector(-39,86,26.5),
			Vector(-39.5,84,26.5),
			
			Vector(-32,-111,31.5),
            Vector(-40.5,-100,30),
			Vector(-40,-102,30),
			Vector(-39.5,-104,30),
		},
		Right = {
			Vector(26,94,19),
			Vector(38.5,88,26.5),
			Vector(39,86,26.5),
			Vector(39.5,84,26.5),
			
			Vector(32,-111,31.5),
			Vector(40.5,-100,30),
			Vector(40,-102,30),
			Vector(39.5,-104,30),
		},
	}
}
list.Set( "simfphys_lights", "re7_challenger", light_table)

local V = {
	Name = "Dodge Challenger",
	Model = "models/re7_dodge/dodge_rigged.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Автомобили",
	SpawnAngleOffset = 0,
	
	Members = {
		Mass = 1260,
		
		CustomMassCenter = Vector(0,0,5),
		EnginePos = Vector(0,70,30),
		
		SpeedoMax = 140,
		
		LightsTable = "re7_challenger",
		
		CustomWheels = true,
		CustomSuspensionTravel = 15,
		
		CustomWheelModel = "models/re7_dodge/dodge_wheel.mdl",
	    CustomWheelPosFL = Vector(-34,59,20),
		CustomWheelPosFR = Vector(34,59,20),
		CustomWheelPosRL = Vector(-34,-66,20),	
		CustomWheelPosRR = Vector(34,-66,20),
		CustomWheelAngleOffset = Angle(0,0,0),
		
		CustomSteerAngle = 30,
		
		SeatOffset = Vector(-15,-14,47),
        SeatPitch = 0,
		SeatYaw = 0,

		PassengerSeats = {
			{
				pos = Vector(15,-10,12),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(15,-42,12),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(0,-42,12),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(-15,-42,12),
				ang = Angle(0,0,0)
			},
		},
				
		ExhaustPositions = {
			{
				pos = Vector(14,-110,18),
				ang = Angle(90,-90,0)
			},
			{
				pos = Vector(17,-110,18),
				ang = Angle(90,-90,0)
			},
			{
				pos = Vector(-14,-110,18),
				ang = Angle(90,-90,0)
			},
			{
				pos = Vector(-17,-110,18),
				ang = Angle(90,-90,0)
			},
		},
		
		FuelFillPos = Vector(38,-80,39),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 70,
		
		StrengthenSuspension = false,
		
		FrontHeight = 15,
		FrontConstant = 19000,
		FrontDamping = 900,
		FrontRelativeDamping = 900,
		
		RearHeight = 15,
		RearConstant = 19000,
		RearDamping = 900,
		RearRelativeDamping = 900,
		
		FastSteeringAngle = 30,
		SteeringFadeFastSpeed = 205,
		
		TurnSpeed = 4,
		
		MaxGrip = 40,
		Efficiency = 0.6,
		GripOffset = -1,
		BrakePower = 15,
		
		IdleRPM = 700,
		LimitRPM = 7000,
		PeakTorque = 150,
		PowerbandStart = 1000,
		PowerbandEnd = 6800,
		Turbocharged = false,
		Supercharged = false,
		
		PowerBias = 1,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/misc/nanjing_loop.wav",
		Sound_IdlePitch = 1.0,
		
		Sound_Mid = "simulated_vehicles/misc/v8high2.wav",
		Sound_MidPitch = 0.77,
		Sound_MidVolume = 4.0,
		Sound_MidFadeOutRPMpercent = 70,		-- at wich percentage of limitrpm the sound fades out
		Sound_MidFadeOutRate = 0.34,                    --how fast it fades out   0 = instant       1 = never
		
		Sound_High = "simulated_vehicles/jalopy/jalopy_high.wav",
		Sound_HighPitch = 0.77,
		Sound_HighVolume = 4.0,
		Sound_HighFadeInRPMpercent = 20,
		Sound_HighFadeInRate = 0.44,
		
		Sound_Throttle = "",		-- mutes the default throttle sound
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "simulated_vehicles/horn_3.wav",
		
		DifferentialGear = 0.5,
		Gears = {-0.13,0,0.12,0.22,0.3,0.38}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_re7_dodge", V )