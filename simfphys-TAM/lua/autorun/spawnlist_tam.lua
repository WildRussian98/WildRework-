
local light_table = {
	L_HeadLampPos = Vector(-32.85,147.6,45.07),
	L_HeadLampAng = Angle(15,90,0),
	R_HeadLampPos = Vector(32.85,147.6,45.07),
	R_HeadLampAng = Angle(15,90,0),
	
	Headlight_sprites = { 
		Vector(-37,125,57),
		Vector(37,125,57),
	},
	Rearlight_sprites = {
		Vector(-47.5,-124,74),
		Vector(47.5,-124,74),
		Vector(-42.5,-124,74),
		Vector(42.5,-124,74),
	},
	Brakelight_sprites = {
		Vector(-47.5,-124,74),
		Vector(47.5,-124,74),
		Vector(-42.5,-124,74),
		Vector(42.5,-124,74),
	},
	
}
list.Set( "simfphys_lights", "tam", light_table)

local V = {
	Name = "TAM",
	Model = "models/TAM.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Средняя бронетехника",
	SpawnOffset = Vector(0,0,30),
	SpawnAngleOffset = 90,

	Members = {
		Mass = 15000,
		AirFriction = 0,
		--Inertia = Vector(14017.5,46543,47984.5),
		Inertia = Vector(10000,30000,50000),
		
		LightsTable = "tam",
		
		OnSpawn = 
			function(ent) 
				ent:SetNWBool( "simfphys_NoRacingHud", true )
				ent:SetNWBool( "simfphys_NoHud", true ) 
				ent:SetSkin(math.random(0,6))
			end,

		ApplyDamage = function( ent, damage, type ) 
			simfphys.TankApplyDamage(ent, damage, type)
		end,
		
		GibModels = {
			"models/TAM.mdl",
		},
		
		MaxHealth = 9500,
		
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
		
		CustomWheelPosFL = Vector(-50,90,26),
		CustomWheelPosFR = Vector(50,90,26),
		CustomWheelPosML = Vector(-50,0,26),
		CustomWheelPosMR = Vector(50,0,26),
		CustomWheelPosRL = Vector(-50,-90,26),
		CustomWheelPosRR = Vector(50,-90,26),
		CustomWheelAngleOffset = Angle(0,0,90),
		
		CustomMassCenter = Vector(0,0,20),
		
		CustomSteerAngle = 60,
		
		SeatOffset = Vector(80,1,29),
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
		BrakePower = 250,
		BulletProofTires = true,
		
		IdleRPM = 600,
		LimitRPM = 2000,
		PeakTorque = 380,
		PowerbandStart = 600,
		PowerbandEnd = 2600,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = true,
		
		FuelFillPos = Vector(65,-146,71),
		FuelType = FUELTYPE_DIESEL,
		FuelTankSize = 250,
		
		PowerBias = -0.3,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/leopard/start.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/leopard/low.wav",
		Sound_MidPitch = 1.3,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 60,
		Sound_MidFadeOutRate = 0.4,
		
		Sound_High = "simulated_vehicles/leopard/high.wav",
		Sound_HighPitch = 1.2,
		Sound_HighVolume = 1,
		Sound_HighFadeInRPMpercent = 45,
		Sound_HighFadeInRate = 0.2,
		
		Sound_Throttle = "",
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "common/null.wav",
		ForceTransmission = 1,
		
		DifferentialGear = 0.4,
		Gears = {-0.06,0,0.06,0.08,0.1,0.12,0.13,0.18,0.2}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_tank_tam", V )
