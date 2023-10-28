--SHITTY CODE BY MERYDIAN

local light_table = {
	L_HeadLampPos = Vector(-122.5,-33.02,25.81),
	L_HeadLampAng = Angle(15,180,0),
	R_HeadLampPos = Vector(-122.5,33.02,25.81),
	R_HeadLampAng = Angle(15,180,0),
	
	Headlight_sprites = { 
		Vector(-119,-44,50),
		Vector(-119,44,50)
	},
	Headlamp_sprites = { 
		Vector(-119,-44,50),
		Vector(-119,44,50)
	},
	Brakelight_sprites = {
		Vector(146,-52,50),
		Vector(146,52,50)
	},
	Rearlight_sprites = {
		Vector(146,-52,50),
		Vector(146,52,50)
	},

}
list.Set( "simfphys_lights", "gepard", light_table)


local V = {
	Name = "Gepard",
	Model = "models/Gepard.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "ЗСУ",
	SpawnOffset = Vector(0,0,60),
	SpawnAngleOffset = 0,

	Members = {
		Mass = 21000,
		AirFriction = 0,
		--Inertia = Vector(14017.5,46543,47984.5),
		Inertia = Vector(20000,80000,50000),
		
		LightsTable = "gepard",
		
		OnSpawn = 
		
			function(ent) 
				ent:SetSkin(math.random(0,2))
				ent:SetNWBool( "simfphys_NoRacingHud", true )
				ent:SetNWBool( "simfphys_NoHud", true ) 
			end,

		ApplyDamage = function( ent, damage, type ) 
			simfphys.TankApplyDamage(ent, damage, type)
		end,
		
		GibModels = {
			"models/Gepard.mdl",
		},
		
		MaxHealth = 9000,
		
		IsArmored = true,
		
		NoWheelGibs = true,
		
		FirstPersonViewPos = Vector(10,-30,20),
		
		FrontWheelRadius = 35,
		RearWheelRadius = 36,
		
		EnginePos = Vector(106.08,0.69,38.34),
		
		CustomWheels = true,
		CustomSuspensionTravel = 2.4,
		
		CustomWheelModel = "models/props_vehicles/apc_tire001.mdl",
		
		CustomWheelPosFL = Vector(-112,-50,13),
		CustomWheelPosFR = Vector(-112,50,13),
		CustomWheelPosML = Vector(0,-50,13),
		CustomWheelPosMR = Vector(0,50,13),
		CustomWheelPosRL = Vector(110,-50,13),
		CustomWheelPosRR = Vector(110,50,13),
		CustomWheelAngleOffset = Angle(0,0,90),
		
		CustomMassCenter = Vector(0,0,0),
		
		CustomSteerAngle = 60,
		
		SeatOffset = Vector(80,0,30),
		SeatPitch = -15,
		SeatYaw = -90,
		
		ModelInfo = {
			WheelColor = Color(0,0,0,0),
		},

		
		ExhaustPositions = {
			{
				pos = Vector(71,-67,30.4),
				ang = Angle(115,-90,0)
			},
		},
		
		
		PassengerSeats = {
			{
				pos = Vector(0,0,13),
				ang = Angle(0,90,0)
			},
		},
		
		FrontHeight = 11,
		FrontConstant = 50000,
		FrontDamping = 30000,
		FrontRelativeDamping = 300000,
		
		RearHeight = 11,
		RearConstant = 50000,
		RearDamping = 20000,
		RearRelativeDamping = 20000,
		
		FastSteeringAngle = 20,
		SteeringFadeFastSpeed = 300,
		
		TurnSpeed = 3.5,
		
		MaxGrip = 2500,
		Efficiency = 1,
		GripOffset = -500,
		BrakePower = 450,
		BulletProofTires = true,
		
		IdleRPM = 500,
		LimitRPM = 3500,
		PeakTorque = 600,
		PowerbandStart = 600,
		PowerbandEnd = 2600,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = true,
		
		FuelFillPos = Vector(123,46,36),
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
		Gears = {-0.03,0,0.04,0.06,0.07}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_tank_gepard", V )