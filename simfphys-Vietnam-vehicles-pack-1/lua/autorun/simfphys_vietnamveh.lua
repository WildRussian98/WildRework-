local Category = "Бронемашины"

local IV = {
	Name = "БТР-40",
	Model = "models/vietnamveh/btr40.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = Category,
	SpawnOffset = Vector(0,0,50),

	Members = {
		Mass = 1500,
		LightsTable = "btr40",

		
		CustomWheels = true,
		EnginePos = Vector(60,-0.2,40),
		IsArmored = true,
		CustomSuspensionTravel = 15,
		
		CustomWheelModel = "models/tfre/vehicles/lav300/lav300_wheels.mdl",
        CustomWheelModel_R  = "models/tfre/vehicles/lav300/lav300_wheels.mdl",
		CustomWheelPosFL = Vector(65,-35,22.5),
		CustomWheelPosFR = Vector(65,36,22.5),
		CustomWheelPosRL = Vector(-50,-34,17.5),
           CustomWheelPosRR = Vector(-50,34,17.5),
		
		CustomWheelAngleOffset = Angle(0,-90,0),
		
		CustomMassCenter = Vector(2,0,-1),
		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(6,-15,64),
		SeatPitch = 0,
		SeatYaw = 90,
		
		PassengerSeats = {
			{
				pos = Vector(12,-15,32),
				ang = Angle(0,-90,10)
			},
			{
				pos = Vector(-25,-3,27),
				ang = Angle(0,-360,10)
			},
			{
				pos = Vector(-53,13,27),
				ang = Angle(0,-90,10)
			},
			{
				pos = Vector(-49,-13,27),
				ang = Angle(0,-270,10)
			},
			{
				pos = Vector(-85,11,30),
				ang = Angle(0,-90,10)
			},
			{
				pos = Vector(-85,-11,30),
				ang = Angle(0,-90,10)
			},

			},
		ExhaustPositions = {
			{
				pos = Vector(-25,-36,24.5),
				ang = Angle(90,230,0)
			},

		},
		
		FrontHeight = 6,
		FrontConstant = 40000,
		FrontDamping = 2200,
		FrontRelativeDamping = 2200,
        BulletProofTires = true,
		RearHeight = 1,
		RearConstant = 40000,
		RearDamping = 2200,
		RearRelativeDamping = 2200,

		TurnSpeed = 4,
		
		FastSteeringAngle = 1000,
		SteeringFadeFastSpeed = 535,

           MaxHealth = 4000,

		
		MaxGrip = 37,
		Efficiency = 1.0,
		GripOffset = -2,
		BrakePower = 40,
		
		IdleRPM = 650,
		LimitRPM = 4500,
		PeakTorque = 45,
		Revlimiter = false,
		PowerbandStart = 1000,
		PowerbandEnd = 4000,
		Turbocharged = false,

		FuelFillPos = Vector(-80,40,40),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 90,

		
		PowerBias = 0,5,
		
		EngineSoundPreset = -1, 

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

		
		DifferentialGear = 0.8,
		Gears = {-0.02,0,0.04,0.06,0.08,0.1}
	}
}
list.Set( "simfphys_vehicles", "simfphys_btr40", IV )

local light_table = {
	L_HeadLampPos = Vector(94,29,43.5),
	L_HeadLampAng = Angle(0,0,0),

	R_HeadLampPos = Vector(94,-29,43.5),
	R_HeadLampAng = Angle(0,0,0),
	
	Headlight_sprites = { 
		Vector(94,29,43.5),
		Vector(94,-29,43.5),
	},
	Headlamp_sprites = { 
		Vector(94,29,43.5),
		Vector(94,-29,43.5),
	},
	
	Rearlight_sprites = {
		Vector(-86,27.5,31.5),
	},
	Brakelight_sprites = {
		Vector(-86,27.5,31.5),
	},
	Reverselight_sprites = {
		Vector(-86,27.5,31.5),
	},
}
list.Set( "simfphys_lights", "btr40", light_table)


local Category = "Бронемашины"

local IV = {
	Name = "БТР-152",
	Model = "models/vietnamveh/btr152.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = Category,
	SpawnOffset = Vector(0,0,50),

	Members = {
		Mass = 1500,
		LightsTable = "btr152",

		OnSpawn = function(ent)
		ent:SetSkin(math.random(0,2))
		end,

		CustomWheels = true,
		EnginePos = Vector(80,-0.2,60),
		IsArmored = true,
		CustomSuspensionTravel = 15,
		
		CustomWheelModel = "models/arhanp51/arhanp51_wheel.mdl",
		CustomWheelPosFL = Vector(91.5,-35,23.5),
		CustomWheelPosFR = Vector(91.5,35,23.5),
		CustomWheelPosML = Vector(-39.5,-35,19.5),
		CustomWheelPosMR = Vector(-39.5,35,19.5),
		CustomWheelPosRL = Vector(-83.5,-35,19.5),
           CustomWheelPosRR = Vector(-83.5,35,19.5),
		
		CustomWheelAngleOffset = Angle(0,-90,0),
		
		CustomMassCenter = Vector(2,0,-1),
		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(19,-17,68),
		SeatPitch = 0,
		SeatYaw = 90,
		
		PassengerSeats = {
			{
				pos = Vector(26,-17,35),
				ang = Angle(0,-90,10)
			},
			{
				pos = Vector(-2,22,44),
				ang = Angle(0,-180,10)
			},
			{
				pos = Vector(-2,-22,44),
				ang = Angle(0,-360,10)
			},
			{
				pos = Vector(-25,16,42),
				ang = Angle(0,-180,10)
			},
			{
				pos = Vector(-25,-16,42),
				ang = Angle(0,-360,10)
			},
			{
				pos = Vector(-45,16,42),
				ang = Angle(0,-180,10)
			},
			{
				pos = Vector(-45,-16,42),
				ang = Angle(0,-360,10)
			},
			{
				pos = Vector(-65,16,42),
				ang = Angle(0,-180,10)
			},
			{
				pos = Vector(-65,-16,42),
				ang = Angle(0,-360,10)
			},
			{
				pos = Vector(-85,16,42),
				ang = Angle(0,-180,10)
			},
			{
				pos = Vector(-85,-16,42),
				ang = Angle(0,-360,10)
			},
			{
				pos = Vector(-110,17,44),
				ang = Angle(0,-180,10)
			},
			{
				pos = Vector(-110,-17,44),
				ang = Angle(0,-360,10)
			},
			},
		ExhaustPositions = {
			{
				pos = Vector(-126,35,30.5),
				ang = Angle(180,180,0)
			},
			{
				pos = Vector(-126,-35,30.5),
				ang = Angle(180,180,0)
			},

		},
		
		FrontHeight = 6,
		FrontConstant = 40000,
		FrontDamping = 2200,
		FrontRelativeDamping = 2200,
        BulletProofTires = true,

		RearHeight = 1,
		RearConstant = 40000,
		RearDamping = 2200,
		RearRelativeDamping = 2200,

		TurnSpeed = 4,
		
		FastSteeringAngle = 1000,
		SteeringFadeFastSpeed = 535,

           MaxHealth = 4200,

		
		MaxGrip = 37,
		Efficiency = 1.0,
		GripOffset = -2,
		BrakePower = 40,
		
		IdleRPM = 650,
		LimitRPM = 4500,
		PeakTorque = 40,
		Revlimiter = false,
		PowerbandStart = 1000,
		PowerbandEnd = 4000,
		Turbocharged = false,

		FuelFillPos = Vector(5,40,40),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 110,

		
		PowerBias = 0,5,
		
		EngineSoundPreset = -1, 

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

		
		DifferentialGear = 0.8,
		Gears = {-0.02,0,0.04,0.06,0.08,0.1}
	}
}
list.Set( "simfphys_vehicles", "simfphys_btr152", IV )

local light_table = {
	L_HeadLampPos = Vector(102,32,51),
	L_HeadLampAng = Angle(0,0,0),

	R_HeadLampPos = Vector(102,-31,51),
	R_HeadLampAng = Angle(0,0,0),
	
	Headlight_sprites = { 
		Vector(102,32,51),
		Vector(102,-31,51),
	},
	Headlamp_sprites = { 
		Vector(102,32,51),
		Vector(102,-31,51),
	},
	
	Rearlight_sprites = {
		Vector(-122,21.5,35.3),
	},
	Brakelight_sprites = {
		Vector(-122,21.5,35.3),
	},
	Reverselight_sprites = {
		Vector(-122,21.5,35.3),
	},

	DelayOn = 0.1,
	DelayOff = 0.1,
	
	Turnsignal_sprites = {
		Left = {
			Vector(105,39,47),
		},
		Right = {
			Vector(105,-39,47),
		},
	}

}
list.Set( "simfphys_lights", "btr152", light_table)
