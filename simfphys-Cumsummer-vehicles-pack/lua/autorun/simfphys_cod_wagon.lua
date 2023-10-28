
AddCSLuaFile()

local light_table = {
	L_HeadLampPos = Vector(24,105,18),
	L_HeadLampAng = Angle(0,90,0),

	R_HeadLampPos = Vector(-24,105,18),
	R_HeadLampAng = Angle(0,90,0),

	L_RearLampPos = Vector(36,-105,38),
	L_RearLampAng = Angle(0,-90,0),

	R_RearLampPos = Vector(-36,-105,38),
	R_RearLampAng = Angle(0,-90,0),
	
	Headlight_sprites = { 
		Vector(25,105,18),
		Vector(-25,105,18),
		Vector(23,105,18),
		Vector(-23,105,18),
	},
	Headlamp_sprites = { 
		Vector(25,105,18),
		Vector(-25,105,18),
		Vector(23,105,18),
		Vector(-23,105,18),
	},
	FogLight_sprites = {
		Vector(24,105,18),
		Vector(-24,105,18),
	},
	Rearlight_sprites = {
		Vector(34.7,-104,38),
		Vector(-34.7,-104,38),
		Vector(35,-105,36.5),
		Vector(-35,-105,36.5),
		Vector(35,-105,35),
		Vector(-35,-105,35),
	},
	Brakelight_sprites = {
		Vector(35.5,-105,29),
		Vector(-35.5,-105,29),
		Vector(35.5,-105,27.5),
		Vector(-35.5,-105,27.5),
		Vector(35.8,-104.5,26),
		Vector(-35.8,-104.5,26),
	},
	Reverselight_sprites = {
		Vector(26,-105,18),
		Vector(-26,-105,18),
		Vector(24,-105,18),
		Vector(-24,-105,18),
	},
	Turnsignal_sprites = {
		Left = {
		Vector(-37,106,26),
		Vector(-37,106,28),
		Vector(-37,106,30),
		Vector(-37,106,32),
		
		Vector(-35.5,-105,32),
		Vector(-36,-103,32),
		},
		Right = {
		Vector(37,106,26),
		Vector(37,106,28),
		Vector(37,106,30),
		Vector(37,106,32),
		
		Vector(35.5,-105,32),
		Vector(36,-103,32),
		},
	}
}
list.Set( "simfphys_lights", "cod_st_wagon", light_table)

local V = {
	Name = "Ford Country",
	Model = "models/cod_station_wagon/station_wagon_rigged.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Автомобили",
	SpawnAngleOffset = 0,
	
	Members = {
		Mass = 1460,
		
		CustomMassCenter = Vector(0,0,5),
		EnginePos = Vector(0,80,10),
		
		SpeedoMax = 140,
		
		LightsTable = "cod_st_wagon",
		
		CustomWheels = true,
		CustomSuspensionTravel = 15,
		
		CustomWheelModel = "models/cod_station_wagon/wagon_wheel.mdl",
	    CustomWheelPosFL = Vector(-34,75,20),
		CustomWheelPosFR = Vector(34,75,20),
		CustomWheelPosRL = Vector(-34,-50,20),	
		CustomWheelPosRR = Vector(34,-50,20),
		CustomWheelAngleOffset = Angle(0,-90,0),
		
		CustomSteerAngle = 30,
		
		SeatOffset = Vector(7,-15,47),
        SeatPitch = 0,
		SeatYaw = 0,

		PassengerSeats = {
			{
				pos = Vector(15,10,12),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(15,-23,12),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(0,-23,12),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(-15,-23,12),
				ang = Angle(0,0,0)
			},
		},
				
		ExhaustPositions = {
			{
				pos = Vector(38,-77,12),
				ang = Angle(90,0,90)
			},
		},
		
		FuelFillPos = Vector(-39,-75,36),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 75,
		
		StrengthenSuspension = false,
		
		FrontHeight = 15,
		FrontConstant = 20000,
		FrontDamping = 1000,
		FrontRelativeDamping = 1000,
		
		RearHeight = 15,
		RearConstant = 20000,
		RearDamping = 1000,
		RearRelativeDamping = 1000,
		
		FastSteeringAngle = 30,
		SteeringFadeFastSpeed = 255,
		
		TurnSpeed = 3,
		
		MaxGrip = 45,
		Efficiency = 0.82,
		GripOffset = -1,
		BrakePower = 15,
		
		IdleRPM = 700,
		LimitRPM = 6000,
		PeakTorque = 120,
		PowerbandStart = 1100,
		PowerbandEnd = 5500,
		Turbocharged = false,
		Supercharged = false,
		
		PowerBias = 1,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/misc/nanjing_loop.wav",
		Sound_IdlePitch = 1.0,
		
		Sound_Mid = "simulated_vehicles/misc/m50.wav",
		Sound_MidPitch = 0.9,
		Sound_MidVolume = 3.0,
		Sound_MidFadeOutRPMpercent = 70,		-- at wich percentage of limitrpm the sound fades out
		Sound_MidFadeOutRate = 0.34,                    --how fast it fades out   0 = instant       1 = never
		
		Sound_High = "simulated_vehicles/misc/v8high2.wav",
		Sound_HighPitch = 0.9,
		Sound_HighVolume = 5.0,
		Sound_HighFadeInRPMpercent = 20,
		Sound_HighFadeInRate = 0.44,
		
		Sound_Throttle = "",		-- mutes the default throttle sound
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "simulated_vehicles/horn_3.wav",
		
		DifferentialGear = 0.52,
		Gears = {-0.15,0,0.12,0.24,0.37}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_cod_st_wagon", V )