
local light_table = {
	L_HeadLampPos = Vector(-32.85,147.6,45.07),
	L_HeadLampAng = Angle(15,90,0),
	R_HeadLampPos = Vector(32.85,147.6,45.07),
	R_HeadLampAng = Angle(15,90,0),
	
	Headlight_sprites = { 
		Vector(-45,139,64),Vector(-55,137,65),
		Vector(46,139,64),Vector(56,137,65),
	},
	Rearlight_sprites = {
		Vector(-60,-138,75),Vector(-60,-138,80),
		Vector(61,-138,75),Vector(61,-138,80),
	},
	Brakelight_sprites = {
		Vector(-60,-138,75),Vector(-60,-138,80),
		Vector(61,-138,75),Vector(61,-138,80),
	},
	
}
list.Set( "simfphys_lights", "ICVl", light_table)

local V = {
	Name = "ICV",
	Model = "models/crysis2/icv/icv.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Средняя бронетехника",
	SpawnOffset = Vector(0,0,30),
	SpawnAngleOffset = 90,

	Members = {
		Mass = 8500,
		AirFriction = 0,
		--Inertia = Vector(14017.5,46543,47984.5),
		Inertia = Vector(10000,30000,50000),
		
		LightsTable = "ICVl",
		
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
			"models/crysis2/icv/icv.mdl",
		},
		
		MaxHealth = 8500,
		
		IsArmored = true,
		
		NoWheelGibs = true,
		
		FirstPersonViewPos = Vector(0,-50,50),
		
		FrontWheelRadius = 32,
		RearWheelRadius = 32,
		
		EnginePos = Vector(20,65,69.45),
		
		CustomWheels = true,
		CustomSuspensionTravel = 9,
		
		CustomWheelModel = "models/props_c17/canisterchunk01g.mdl",
		--CustomWheelModel = "models/props_vehicles/apc_tire001.mdl",
		
		CustomWheelPosFL = Vector(-50,100,35),
		CustomWheelPosFR = Vector(50,100,35),
		CustomWheelPosML = Vector(-50,0,35),
		CustomWheelPosMR = Vector(50,0,35),
		CustomWheelPosRL = Vector(-50,-100,35),
		CustomWheelPosRR = Vector(50,-100,35),
		CustomWheelAngleOffset = Angle(0,0,0),
		
		CustomMassCenter = Vector(0,0,10),
		
		CustomSteerAngle = 30,
		
		SeatOffset = Vector(100,1,34),
		SeatPitch = -15,
		SeatYaw = 0,
		
		ModelInfo = {
			WheelColor = Color(0,0,0,0),
		},

		
		PassengerSeats = {
			{
				pos = Vector(0,-10,26),
				ang = Angle(0,0,0)
			},
		},
		
		FrontHeight = 15,
		FrontConstant = 100000,
		FrontDamping = 30000,
		FrontRelativeDamping = 30000,

		RearHeight = 15,
		RearConstant = 100000,
		RearDamping = 30000,
		RearRelativeDamping = 30000,

		FastSteeringAngle = 18,
		SteeringFadeFastSpeed = 400,
		
		TurnSpeed = 4,
		
		MaxGrip = 5000,
		Efficiency = 1,
		GripOffset = -500,
		BrakePower = 130,
		BulletProofTires = true,
		
		IdleRPM = 1000,
		LimitRPM = 4000,
		PeakTorque = 210,
		PowerbandStart = 800,
		PowerbandEnd = 3600,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = true,
		
		FuelFillPos = Vector(-40,50,50),
		FuelType = FUELTYPE_DIESEL,
		FuelTankSize = 250,
		
		PowerBias = 0,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/t90ms/idle.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/t90ms/low.wav",
		Sound_MidPitch = 1.3,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 60,
		Sound_MidFadeOutRate = 0.4,
		
		Sound_High = "simulated_vehicles/t90ms/high.wav",
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
		Gears = {-0.06,0,0.06,0.08,0.1,0.12,0.13}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_tank_crysis2_icv", V )
