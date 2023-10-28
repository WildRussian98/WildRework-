local light_table = {
	L_HeadLampPos = Vector(-53.45,135.6,53.37),
	L_HeadLampAng = Angle(15,90,0),
	R_HeadLampPos = Vector(53.45,135.6,53.37),
	R_HeadLampAng = Angle(15,90,0),
	
	Headlight_sprites = { 
		Vector(-53.45,135.6,53.37),
		Vector(53.45,135.6,53.37)
	},
	Headlamp_sprites = { 
		Vector(-53.45,135.6,53.37),
		Vector(53.45,135.6,53.37)
	},
	Rearlight_sprites = {
		Vector(-56.0,-143.98,51.9),
		Vector(56.0,-143.98,51.9)
	},
	Brakelight_sprites = {
		Vector(-56.0,-144.0,55.73),
		Vector(56.0,-144.0,55.73),
	},
	
	Turnsignal_sprites = {
		Left = {
			Vector(-56.0,-144.0,55.73),
			Vector(-59.45,135.6,53.37),
		},
		Right = {
			Vector(56.0,-144.0,55.73),
			Vector(59.45,135.6,53.37),
		},
	},

	FogLight_sprites = {
		{pos = Vector(-59.45,135.6,53.37),material = "sprites/light_ignorez",size = 16, color = Color(200,170,30,255)},
		{pos = Vector(-59.45,135.6,53.37),size = 32, color = Color( 200,170,30,50)},
		
		{pos = Vector(59.45,135.6,53.37),material = "sprites/light_ignorez",size = 16, color = Color(200,170,30,255)},
		{pos = Vector(59.45,135.6,53.37),size = 32, color = Color( 200,170,30,50)},
	}


}
list.Set( "simfphys_lights", "firtina", light_table)

local V = {
	Name = "M109 Paladin",
	Model = "models/bypolat/tanklar/t-155_firtina_obus.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Артиллерия",
	SpawnOffset = Vector(0,0,60),
	SpawnAngleOffset = 0,

	Members = {
		Mass = 20000,
		AirFriction = 120,
		Inertia = Vector(30000,15000,100000),
		
		LightsTable = "firtina",
		
		OnSpawn = function(ent) ent:SetNWBool( "simfphys_NoRacingHud", true ) 
		ent:SetSkin(math.random(0,1))
		end,

		ApplyDamage = function( ent, damage, type ) 
			simfphys.TankApplyDamage(ent, damage, type)
		end,
		
		MaxHealth = 9200,
		
		IsArmored = true,
		
		NoWheelGibs = true,
		
		FirstPersonViewPos = Vector(0,-50,50),
		
		FrontWheelRadius = 40,
		RearWheelRadius = 45,
		
		EnginePos = Vector(0,-125.72,69.45),
		
		CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		CustomWheelModel = "models/props_c17/canisterchunk01g.mdl",
		
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
				pos = Vector(25,-5,45),
				ang = Angle(0,0,0)
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
		
		MaxGrip = 800,
		Efficiency = 0.6,
		GripOffset = -250,
		BrakePower = 450,
		BulletProofTires = true,
		
		IdleRPM = 600,
		LimitRPM = 3000,
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
		
		Sound_Idle = "simulated_vehicles/t90ms/idle.wav",
		Sound_Idle = "simulated_vehicles/leopard/start.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/t90ms/low.wav",
		Sound_MidPitch = 1.4,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 60,
		Sound_MidFadeOutRate = 0.4,
		
		Sound_High = "simulated_vehicles/t90ms/high.wav",
		Sound_HighPitch = 0.9,
		Sound_HighVolume = 1,
		Sound_HighFadeInRPMpercent = 45,
		Sound_HighFadeInRate = 0.2,
		
		Sound_Throttle = "",
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,

		ForceTransmission = 1,
		
		DifferentialGear = 0.34,
		Gears = {-0.08,0,0.06,0.08,0.1}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_tank_firtina", V )
