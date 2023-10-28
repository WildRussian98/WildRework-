--SHITTY CODE BY MERYDIAN

local light_table = {
	L_HeadLampPos = Vector(174,-48,23),
	L_HeadLampAng = Angle(15,0,0),
	R_HeadLampPos = Vector(174,48,23),
	R_HeadLampAng = Angle(15,0,0),
	
	Headlight_sprites = { 
		Vector(174,-48,23),
		Vector(174,48,23)
	},
	Headlamp_sprites = { 
		Vector(174,-48,23),
		Vector(174,48,23)
	},
	Brakelight_sprites = {
		Vector(-171,-67.9,23),
		Vector(-171,67.8,23)
	},
	Rearlight_sprites = {
		Vector(-171,-67.9,23),
		Vector(-171,67.8,23)
	},

}
list.Set( "simfphys_lights", "t14", light_table)


local V = {
	Name = "T-14 Armata",
	Model = "models/vehicles_merydian/tanks/t14/armata.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Тяжелая бронетехника",
	SpawnOffset = Vector(0,0,60),
	SpawnAngleOffset = 180,

	Members = {
		Mass = 26000,
		AirFriction = 0,
		--Inertia = Vector(14017.5,46543,47984.5),
		Inertia = Vector(20000,80000,50000),
		
		LightsTable = "t14",
		
		OnSpawn = 
			function(ent) 
				ent:SetNWBool( "simfphys_NoRacingHud", true )
				ent:SetNWBool( "simfphys_NoHud", true ) 
			end,

		ApplyDamage = function( ent, damage, type ) 
			simfphys.TankApplyDamage(ent, damage, type)
		end,
		
		GibModels = {
			"models/vehicles_merydian/tanks/t14/t14_gib1.mdl",
			"models/vehicles_merydian/tanks/t14/t14_gib2.mdl",
			"models/vehicles_merydian/tanks/t14/t14_gib3.mdl",
		},
		
		MaxHealth = 18000,
		
		IsArmored = true,
		
		NoWheelGibs = true,
		
		FirstPersonViewPos = Vector(10,-30,20),
		
		FrontWheelRadius = 37,
		RearWheelRadius = 37,
		
		EnginePos = Vector(-150,0,0),
		
		CustomWheels = true,
		CustomSuspensionTravel = 1,
		
		CustomWheelModel = "models/props_c17/canisterchunk01g.mdl",
		
		CustomWheelPosFL = Vector(112,-50,-15),
		CustomWheelPosFR = Vector(112,50,-15),
		CustomWheelPosML = Vector(0,-50,-15),
		CustomWheelPosMR = Vector(0,50,-15),
		CustomWheelPosRL = Vector(-110,-50,-15),
		CustomWheelPosRR = Vector(-110,50,-15),
		
		CustomWheelAngleOffset = Angle(0,0,90),
		
		CustomMassCenter = Vector(0,0,0),
		
		CustomSteerAngle = 60,
		
		SeatOffset = Vector(75,25,5),
		SeatPitch = -15,
		SeatYaw = 90,
		
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
				pos = Vector(85,0,-10),
				ang = Angle(0,-90,25)
			},
			{
				pos = Vector(72,25,-3.3),
				ang = Angle(0,-90,2)
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
		
		TurnSpeed = 2.5,
		
		MaxGrip = 2500,
		Efficiency = 1,
		GripOffset = -500,
		BrakePower = 450,
		BulletProofTires = true,
		
		IdleRPM = 500,
		LimitRPM = 3500,
		PeakTorque = 320,
		PowerbandStart = 600,
		PowerbandEnd = 2600,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = true,
		
		FuelFillPos = Vector(-143,-54.5,40),
		FuelType = FUELTYPE_DIESEL,
		FuelTankSize = 250,
		
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
		Gears = {-0.03,0,0.04,0.06,0.08}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_tank_t14", V )