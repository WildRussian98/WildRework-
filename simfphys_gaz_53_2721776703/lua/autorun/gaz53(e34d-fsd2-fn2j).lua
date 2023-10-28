local Category = "Грузовики"

AddCSLuaFile()
local light_table = {
	L_HeadLampPos = Vector(122,36,10),
	L_HeadLampAng = Angle(10,0,0),

	R_HeadLampPos = Vector(122,-37,10),
	R_HeadLampAng = Angle(10,0,0),

	L_RearLampPos = Vector(-123,36,-7.6),
	L_RearLampAng = Angle(0,180,0),

	R_RearLampPos = Vector(-123,-36,-7.6),
	R_RearLampAng = Angle(0,180,0),
	
	Headlight_sprites = { 
		Vector(122,36,10),
		Vector(122,-37,10),
	},
	Headlamp_sprites = { 
		Vector(122,36,10),
		Vector(122,-37,10),
	},
	Rearlight_sprites = {
		Vector(-123,36,-7.6),
		Vector(-123,-36,-7.6),
	},
	Brakelight_sprites = {
		Vector(-123,31,-7.6),
		Vector(-123,-31,-7.6),
		Vector(-123,40,-7.6),
		Vector(-123,-40,-7.6),
	},
	Reverselight_sprites = {
		Vector(-123,43,-7.6),
		Vector(-123,-43,-7.6),
	},
		Turnsignal_sprites = {
		Left = {
			Vector(122,37.03,23),
			Vector(-123,28,-7.6),
			Vector(108,50,21.4),
		},
		Right = {
			Vector(122,-37.03,23),
			Vector(-123,-28,-7.6),
			Vector(108,-50.5,21.4),
		},
	}
	}
list.Set( "simfphys_lights", "gaz53(E34D-FSD2-FN2J)", light_table)

local V = {
	Name = "ГАЗ-53",
	Model = "models/gaz53(E34D-FSD2-FN2J).mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = Category,
	SpawnOffset = Vector(0,0,35),

	Members = {
		Mass = 3000,
		EnginePos = Vector(85,0,45),
		LightsTable = "gaz53(E34D-FSD2-FN2J)",
		
        MaxHealth = 3500,
		
		OnSpawn = 
		function(ent) 
			ent:SetSkin(math.random(0,6))
		end,
		
		CustomWheels = true,
		CustomSuspensionTravel = 15,
		
		CustomWheelModel = "models/gaz53w1(E34D-FSD2-FN2J).mdl",
		CustomWheelModel_R = "models/gaz53w2(E34D-FSD2-FN2J).mdl",
		CustomWheelPosFL = Vector(88,43,-10),
		CustomWheelPosFR = Vector(88,-43,-10),
		CustomWheelPosRL = Vector(-87.5,48,-10),	
		CustomWheelPosRR = Vector(-87.5,-48,-10),
		CustomWheelAngleOffset = Angle(0,0,0),
		
		CustomMassCenter = Vector(2,0,-1),
		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(30,-20,50),
		SeatPitch = -2,
		SeatYaw = 90,
		
		PassengerSeats = {
			{
				pos = Vector(35,-22,18),
				ang = Angle(0,-90,10)
			}
		},
		ExhaustPositions = {
			{
				pos = Vector(-16,-35,5),
				ang = Angle(120,-100,0)
			},
		},
		
		FrontHeight = 12.5,
		FrontConstant = 38000,
		FrontDamping = 6000,
		FrontRelativeDamping = 6000,
		
		RearHeight = 12.5,
		RearConstant = 38000,
		RearDamping = 6000,
		RearRelativeDamping = 6000,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 600,
		
		TurnSpeed = 8,
		
		MaxGrip = 85,
		Efficiency = 1.0,
		GripOffset = -12,
		BrakePower = 80,
		
		IdleRPM = 500,
		LimitRPM = 5000,
		PeakTorque = 110,
		PowerbandStart = 650,
		PowerbandEnd = 4700,
		Turbocharged = false,
		Supercharged = false,
		
		FuelFillPos = Vector(-22.15,53,14),
		FuelType = FUELTYPE_DIESEL,
		FuelTankSize = 140,
		
		PowerBias = 1,
		
		EngineSoundPreset = -1,
		
		snd_pitch = 1,
		snd_idle = "vehicles/crane/crane_startengine1.wav",
		
		snd_low ="simulated_vehicles/alfaromeo/alfaromeo_low.wav",
		snd_low_pitch = 0.35,
		
		snd_mid = "simulated_vehicles/alfaromeo/alfaromeo_mid.wav",
		snd_mid_gearup = "simulated_vehicles/alfaromeo/alfaromeo_second.wav",
		snd_mid_pitch = 0.5,
		
		DifferentialGear = 0.25,
		Gears = {-0.1,0,0.1,0.24,0.39,0.47}
	}
}
list.Set( "simfphys_vehicles", "gaz53(E34D-FSD2-FN2J)", V )

