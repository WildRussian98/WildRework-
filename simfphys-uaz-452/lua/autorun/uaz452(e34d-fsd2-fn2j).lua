local Category = "Автомобили"

AddCSLuaFile()
local light_table = {
	L_HeadLampPos = Vector(97.5,30.5,-5),
	L_HeadLampAng = Angle(10,0,0),

	R_HeadLampPos = Vector(97.5,-30.5,-5),
	R_HeadLampAng = Angle(10,0,0),

	L_RearLampPos = Vector(-98,35,-5),
	L_RearLampAng = Angle(0,180,0),

	R_RearLampPos = Vector(-98,-35,-5),
	R_RearLampAng = Angle(0,180,0),
	
	Headlight_sprites = { 
		Vector(97.5,30.5,-5),
		Vector(97.5,-30.5,-5),
	},
	Headlamp_sprites = { 
		Vector(97.5,30.5,-5),
		Vector(97.5,-30.5,-5),
	},
	Rearlight_sprites = {
		Vector(-98,35,-5),
		Vector(-98,-35,-5),
	},
	Brakelight_sprites = {
		Vector(-98,35,-5),
		Vector(-98,-35,-5),
	},
	Reverselight_sprites = {
		Vector(-98,21.5,-2.5),
	},
		Turnsignal_sprites = {
		Left = {
			Vector(97.5,35.5,-18),
			Vector(-98,35,-0.5),
			Vector(39.5,35.5,38.5),
		},
		Right = {
			Vector(97.5,-35.5,-18),
			Vector(-98,-35,-0.5),
			Vector(39.5,-35.5,38.5),
		},
	}
	}
list.Set( "simfphys_lights", "uaz452(E34D-FSD2-FN2J)", light_table)

local V = {
	Name = "УАЗ-452",
	Model = "models/uaz452(E34D-FSD2-FN2J).mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = Category,
	SpawnOffset = Vector(0,0,35),

	Members = {
		Mass = 1000,
		EnginePos = Vector(69.37,0,13),
		LightsTable = "uaz452(E34D-FSD2-FN2J)",
		
		OnSpawn = 
		function(ent) 
			ent:SetSkin(math.random(0,4))
		end,
		
		CustomWheels = true,
		CustomSuspensionTravel = 15,
		
		CustomWheelModel = "models/uaz452w(E34D-FSD2-FN2J).mdl",
		CustomWheelPosFL = Vector(56,35,-34),
		CustomWheelPosFR = Vector(56,-35,-34),
		CustomWheelPosRL = Vector(-52,35,-34),	
		CustomWheelPosRR = Vector(-52,-35,-34),
		CustomWheelAngleOffset = Angle(0,0,0),
		
		CustomMassCenter = Vector(2,0,-1),
		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(50,-20,17),
		SeatPitch = -2,
		SeatYaw = 90,
		
		PassengerSeats = {
			{
				pos = Vector(62,-24,-10),
				ang = Angle(0,-90,10)
			}
		},
		ExhaustPositions = {
			{
				pos = Vector(-95,-26,-29),
				ang = Angle(120,165,0)
			},
		},
		
		FrontHeight = 6.5,
		FrontConstant = 25000,
		FrontDamping = 1500,
		FrontRelativeDamping = 1500,
		
		RearHeight = 6.5,
		RearConstant = 25000,
		RearDamping = 1500,
		RearRelativeDamping = 1500,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 400,
		
		TurnSpeed = 8,
		
		MaxGrip = 35,
		Efficiency = 1,
		GripOffset = -1.5,
		BrakePower = 38,
		
		IdleRPM = 750,
		LimitRPM = 7250,
		PeakTorque = 40,
		PowerbandStart = 2000,
		PowerbandEnd = 6950,
		Turbocharged = false,
		Supercharged = false,
		
		FuelFillPos = Vector(29.5,40,-10),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 85,
		
		PowerBias = 0,
		
		EngineSoundPreset = -1,
		
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
		Gears = {-0.08,0,0.05,0.08,0.1,0.13,0.15,0.18}
	}
}
list.Set( "simfphys_vehicles", "uaz452(E34D-FSD2-FN2J)", V )

