--SHITTY CODE BY MERYDIAN

local light_table = {
	L_HeadLampPos = Vector(-122.5,-33.02,25.81),
	L_HeadLampAng = Angle(15,180,0),
	R_HeadLampPos = Vector(-122.5,33.02,25.81),
	R_HeadLampAng = Angle(15,180,0),
	
	Headlight_sprites = { 
		Vector(-109.5,-33.02,26.81),
		Vector(-109.5,33.02,26.81)
	},
	Headlamp_sprites = { 
		Vector(-109.5,-33.02,26.81),
		Vector(-109.5,33.02,26.81)
	},
	Brakelight_sprites = {
		Vector(129.5,-48.66,30.61),
		Vector(129.5,49.37,30.61)
	},
	Rearlight_sprites = {
		Vector(129.5,-48.66,30.61),
		Vector(129.5,49.37,30.61)
	},

}
list.Set( "simfphys_lights", "t90a", light_table)


local V = {
	Name = "Т-90А",
	Model = "models/vehicles_merydian/tanks/t90a/vladimir.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Тяжелая бронетехника",
	SpawnOffset = Vector(0,0,60),
	SpawnAngleOffset = 90,

	Members = {
		Mass = 21000,
		AirFriction = 0,
		--Inertia = Vector(14017.5,46543,47984.5),
		Inertia = Vector(20000,80000,50000),
		
		LightsTable = "t90a",
		
		OnSpawn = 
			function(ent) 
				ent:SetNWBool( "simfphys_NoRacingHud", true )
				ent:SetNWBool( "simfphys_NoHud", true )
	            ent:SetSkin(math.random(0,1))				
			end,

		ApplyDamage = function( ent, damage, type ) 
			simfphys.TankApplyDamage(ent, damage, type)
		end,
		
		GibModels = {
			"models/vehicles_merydian/tanks/t90a/t90a_gib1.mdl",
			"models/vehicles_merydian/tanks/t90a/t90a_gib2.mdl",
			"models/vehicles_merydian/tanks/t90a/t90a_gib3.mdl",
		},
		
		MaxHealth = 12000,
		
		IsArmored = true,
		
		NoWheelGibs = true,
		
		FirstPersonViewPos = Vector(10,-30,20),
		
		FrontWheelRadius = 40,
		RearWheelRadius = 41,
		
		EnginePos = Vector(106.08,0.69,38.34),
		
		CustomWheels = true,
		CustomSuspensionTravel = 2.4,
		
		CustomWheelModel = "models/props_vehicles/apc_tire001.mdl",
		
		CustomWheelPosFL = Vector(-112,-50,1.8),
		CustomWheelPosFR = Vector(-112,50,1.8),
		CustomWheelPosML = Vector(0,-50,1.8),
		CustomWheelPosMR = Vector(0,50,1.8),
		CustomWheelPosRL = Vector(110,-50,1.8),
		CustomWheelPosRR = Vector(110,50,1.8),
		CustomWheelAngleOffset = Angle(0,0,90),
		
		CustomMassCenter = Vector(0,0,0),
		
		CustomSteerAngle = 60,
		
		SeatOffset = Vector(65,0,8),
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
		LimitRPM = 2500,
		PeakTorque = 300,
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
		Gears = {-0.03,0,0.04,0.06,0.08}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_tank_t90a", V )