
local light_table = {
	L_HeadLampPos = Vector(-32.85,147.6,45.07),
	L_HeadLampAng = Angle(15,90,0),
	R_HeadLampPos = Vector(32.85,147.6,45.07),
	R_HeadLampAng = Angle(15,90,0),
	
	Headlight_sprites = { 
		Vector(-34.95,154.6,52.07),
		Vector(37.85,154.6,52.07)
	},
	Rearlight_sprites = {
		Vector(-66.16,-158.6,63.63),
		Vector(66.16,-158.6,63.63)
	},
	Brakelight_sprites = {
		Vector(-66.16,-158.6,63.63),
		Vector(66.16,-158.6,63.63)
	},
	
}
list.Set( "simfphys_lights", "m1a2abrams", light_table)

local V = {
	Name = "Abrams M1A2",
	Model = "models/vehicles_merydian/tanks/m1a2/abrams_sep_v2.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Тяжелая бронетехника",
	SpawnOffset = Vector(0,0,30),
	SpawnAngleOffset = 90,

	Members = {
		Mass = 20000,
		AirFriction = 0,
		--Inertia = Vector(14017.5,46543,47984.5),
		Inertia = Vector(10000,30000,50000),
		
		LightsTable = "m1a2abrams",
		
		OnSpawn = 
			function(ent) 
				ent:SetSkin(math.random(0,1))
				ent:SetNWBool( "simfphys_NoRacingHud", true )
				ent:SetNWBool( "simfphys_NoHud", true ) 
			end,

		ApplyDamage = function( ent, damage, type ) 
			simfphys.TankApplyDamage(ent, damage, type)
		end,
		
		GibModels = {
			"models/vehicles_merydian/tanks/m1a2/m1a2_gib1.mdl",
			"models/vehicles_merydian/tanks/m1a2/m1a2_gib2.mdl",
			"models/vehicles_merydian/tanks/m1a2/m1a2_gib3.mdl",
		},
		
		MaxHealth = 12000,
		
		IsArmored = true,
		
		NoWheelGibs = true,
		
		FirstPersonViewPos = Vector(0,-50,50),
		
		FrontWheelRadius = 39,
		RearWheelRadius = 40,
		
		EnginePos = Vector(0,-125.72,69.45),
		
		CustomWheels = true,
		CustomSuspensionTravel = 5,
		
		CustomWheelModel = "models/props_c17/canisterchunk01g.mdl",
		--CustomWheelModel = "models/props_vehicles/apc_tire001.mdl",
		
		CustomWheelPosFL = Vector(-50,122,22),
		CustomWheelPosFR = Vector(50,122,22),
		CustomWheelPosML = Vector(-50,0,22),
		CustomWheelPosMR = Vector(50,0,22),
		CustomWheelPosRL = Vector(-50,-110,22),
		CustomWheelPosRR = Vector(50,-110,22),
		CustomWheelAngleOffset = Angle(0,0,90),
		
		CustomMassCenter = Vector(0,0,0),
		
		CustomSteerAngle = 60,
		
		SeatOffset = Vector(85,1,29),
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
		
		FrontHeight = 11.5,
		FrontConstant = 50000,
		FrontDamping = 30000,
		FrontRelativeDamping = 300000,

		RearHeight = 11.5,
		RearConstant = 50000,
		RearDamping = 20000,
		RearRelativeDamping = 20000,

		FastSteeringAngle = 20,
		SteeringFadeFastSpeed = 300,
		
		TurnSpeed = 4,
		
		MaxGrip = 3000,
		Efficiency = 1,
		GripOffset = -500,
		BrakePower = 450,
		BulletProofTires = true,
		
		IdleRPM = 600,
		LimitRPM = 5600,
		PeakTorque = 300,
		PowerbandStart = 600,
		PowerbandEnd = 5600,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = true,
		
		FuelFillPos = Vector(65,-146,71),
		FuelType = FUELTYPE_DIESEL,
		FuelTankSize = 250,
		
		PowerBias = -0.3,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/abrams/abrams_low.ogg",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "",
		Sound_MidPitch = 1.5,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 10,
		Sound_MidFadeOutRate = 1,
		
		Sound_High = "simulated_vehicles/abrams/abrams_hight.wav",
		Sound_HighPitch = 1.5,
		Sound_HighVolume = 0.7,
		Sound_HighFadeInRPMpercent = 5,
		Sound_HighFadeInRate = 0.2,
		
		Sound_Throttle = "",
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "common/null.wav",
		ForceTransmission = 1,
		
		DifferentialGear = 0.4,
		Gears = {-0.03,0,0.04}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_tank_m1a2", V )
