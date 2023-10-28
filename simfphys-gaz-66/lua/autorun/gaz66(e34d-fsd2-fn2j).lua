local Category = "Грузовики"

AddCSLuaFile()
local light_table = {
	L_HeadLampPos = Vector(89,38,27),
	L_HeadLampAng = Angle(10,0,0),

	R_HeadLampPos = Vector(89,-38,27),
	R_HeadLampAng = Angle(10,0,0),

	L_RearLampPos = Vector(-165,34.5,12),
	L_RearLampAng = Angle(0,180,0),

	R_RearLampPos = Vector(-165,-34.5,12),
	R_RearLampAng = Angle(0,180,0),
	
	Headlight_sprites = { 
		Vector(89,38,27),
		Vector(89,-38,27),
	},
	Headlamp_sprites = { 
		Vector(89,38,27),
		Vector(89,-38,27),
	},
	Rearlight_sprites = {
		Vector(-165,34.5,12),
		Vector(-165,-34.5,12),
	},
	Brakelight_sprites = {
		Vector(-165,32.5,12),
		Vector(-165,-32.5,12),
	},
	FogLight_sprites = {
	    Vector(75.3,50,57.5),
	},
		Turnsignal_sprites = {
		Left = {
			Vector(89,41.3,36.3),
			Vector(-165,37.5,12),
			Vector(73.3,52.3,45),
		},
		Right = {
			Vector(89,-41.3,36.3),
			Vector(-165,-37.5,12),
			Vector(73.3,-52.3,45),
		},
	}
	}
list.Set( "simfphys_lights", "gaz66(E34D-FSD2-FN2J)", light_table)

local V = {
	Name = "ГАЗ-66",
	Model = "models/gaz66(E34D-FSD2-FN2J).mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = Category,
	SpawnOffset = Vector(0,0,35),

	Members = {
		Mass = 3000,
		MaxHealth = 4300,
		EnginePos = Vector(85,0,45),
		LightsTable = "gaz66(E34D-FSD2-FN2J)",
		
		OnSpawn = 
		function(ent) 
			ent:SetSkin(math.random(0,3))
		end,
		
		CustomWheels = true,
		CustomSuspensionTravel = 1,
		
		CustomWheelModel = "models/gaz66w(E34D-FSD2-FN2J).mdl",
		CustomWheelPosFL = Vector(49.5,42,-4),
		CustomWheelPosFR = Vector(49.5,-42,-4),
		CustomWheelPosRL = Vector(-117.5,42,-4),	
		CustomWheelPosRR = Vector(-117.5,-42,-4),
		CustomWheelAngleOffset = Angle(0,0,0),
		
		CustomMassCenter = Vector(0,0,-1),
		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(35,-30,65),
		SeatPitch = -2,
		SeatYaw = 90,
		
		PassengerSeats = {
			{
				pos = Vector(40,-30,30),
				ang = Angle(0,-90,10)
			}
		},
		ExhaustPositions = {
			{
				pos = Vector(16,-23,5),
				ang = Angle(120,-100,0)
			},
		},
		
		FrontHeight = 8,
		FrontConstant = 60000,
		FrontDamping = 5000,
		FrontRelativeDamping = 5000,
		
		RearHeight = 8,
		RearConstant = 60000,
		RearDamping = 5000,
		RearRelativeDamping = 5000,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 8,
		
		MaxGrip = 49,
		Efficiency = 1.1,
		GripOffset = -2,
		BrakePower = 75,	
		
		IdleRPM = 500,
		LimitRPM = 4800,
		PeakTorque = 100,
		PowerbandStart = 650,
		PowerbandEnd = 4500,
		Turbocharged = false,
		Supercharged = false,
		
		FuelFillPos = Vector(-28,47,14.9),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 100,
		
		PowerBias = 0,
		
		EngineSoundPreset = -1,
		
		snd_pitch = 1,
		snd_idle = "simulated_vehicles/jeep/jeep_idle.wav",
		
		snd_low = "simulated_vehicles/jeep/jeep_low.wav",
		snd_low_revdown = "simulated_vehicles/jeep/jeep_revdown.wav",
		snd_low_pitch = 0.9,
		
		snd_mid = "simulated_vehicles/jeep/jeep_mid.wav",
		snd_mid_gearup = "simulated_vehicles/jeep/jeep_second.wav", 
		snd_mid_pitch = 1,
		
		DifferentialGear = 0.45,
		Gears = {-0.1,0,0.08,0.1,0.12,0.15}
	}
}
list.Set( "simfphys_vehicles", "gaz66(E34D-FSD2-FN2J)", V )

