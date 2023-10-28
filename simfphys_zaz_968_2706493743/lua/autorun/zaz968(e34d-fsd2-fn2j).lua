local Category = "Автомобили"

AddCSLuaFile()
local light_table = {
	L_HeadLampPos = Vector(91,30,-6),
	L_HeadLampAng = Angle(10,0,0),

	R_HeadLampPos = Vector(91,-30,-6),
	R_HeadLampAng = Angle(10,0,0),

	L_RearLampPos = Vector(-92,24,-6.6),
	L_RearLampAng = Angle(0,180,0),

	R_RearLampPos = Vector(-92,-24,-6.6),
	R_RearLampAng = Angle(0,180,0),
	
	Headlight_sprites = { 
		Vector(91,30,-6),
		Vector(91,-30,-6),
	},
	Headlamp_sprites = { 
		Vector(91,30,-6),
		Vector(91,-30,-6),
	},
	Rearlight_sprites = {
		Vector(-92,24,-6.6),
		Vector(-92,-24,-6.6),
	},
	Brakelight_sprites = {
		Vector(-92,17,-6),
		Vector(-92,-17,-6),
	},
	Reverselight_sprites = {
		Vector(-92,20.6,-6),
		Vector(-92,-20,-6),
	},
		Turnsignal_sprites = {
		Left = {
			Vector(91.5,23.5,-9.5),
			Vector(-92,28,-7),
			Vector(79.8,39,-6.1),
		},
		Right = {
			Vector(91.5,-23.5,-9.5),
			Vector(-92,-28,-7),
			Vector(79.8,-39,-6.1),
		},
	}
	}
list.Set( "simfphys_lights", "zaz968(E34D-FSD2-FN2J)", light_table)

local V = {
	Name = "ЗАЗ-968",
	Model = "models/zaz968(E34D-FSD2-FN2J).mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = Category,
	SpawnOffset = Vector(0,0,24),

	Members = {
		Mass = 900,
		EnginePos = Vector(-69.37,0,13),
		LightsTable = "zaz968(E34D-FSD2-FN2J)",
		CustomWheels = true,
		CustomSuspensionTravel = 15,
		
		OnSpawn = 
		function(ent) 
			ent:SetSkin(math.random(0,7))
		end,
		
		CustomWheelModel = "models/zaz968w(E34D-FSD2-FN2J).mdl",
		CustomWheelPosFL = Vector(64.5,32,-22),
		CustomWheelPosFR = Vector(64.5,-32,-22),
		CustomWheelPosRL = Vector(-48,32,-22),	
		CustomWheelPosRR = Vector(-48,-32,-22),
		CustomWheelAngleOffset = Angle(0,0,0),
		
		CustomMassCenter = Vector(2,0,-1),
		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(2,-18,14),
		SeatPitch = -2,
		SeatYaw = 90,
		
		PassengerSeats = {
			{
				pos = Vector(13,-18,-17),
				ang = Angle(0,-90,20)
			},
			{
				pos = Vector(-25,-18,-17),
				ang = Angle(0,-90,20)
			},
			{
				pos = Vector(-25,18,-17),
				ang = Angle(0,-90,20)
			},
			{
				pos = Vector(-25,0,-17),
				ang = Angle(0,-90,20)
			}
		},
		ExhaustPositions = {
			{
				pos = Vector(-82,20.6,-24),
				ang = Angle(120,165,0)
			},
		},
		
		FrontHeight = 6.5,
		FrontConstant = 25000,
		FrontDamping = 1300,
		FrontRelativeDamping = 1300,
		
		RearHeight = 6.5,
		RearConstant = 25000,
		RearDamping = 1300,
		RearRelativeDamping = 1300,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 400,
		
		TurnSpeed = 8,
		
		MaxGrip = 35,
		Efficiency = 1,
		GripOffset = -1.5,
		BrakePower = 38,
		
		IdleRPM = 750,
		LimitRPM = 7250,
		PeakTorque = 60,
		PowerbandStart = 2000,
		PowerbandEnd = 6950,
		Turbocharged = false,
		Supercharged = false,
		
		PowerBias = 1,
		
		FuelFillPos = Vector(-67.9,37.75,11),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 40,
		
		EngineSoundPreset = 0, 

		Sound_Idle = "simulated_vehicles/master_chris_charger69/charger_idle.wav",
		Sound_IdlePitch = 1.6,
		
		Sound_Mid = "simulated_vehicles/master_chris_charger69/charger_mid.wav",
		Sound_MidPitch = 0.65,
		Sound_MidVolume = 2,
		Sound_MidFadeOutRPMpercent = 110,
		Sound_MidFadeOutRate = 0.476,       
		
		Sound_High = "",
		Sound_HighPitch = 0.8,
		Sound_HighVolume = 5.0,
		Sound_HighFadeInRPMpercent = 45,
		Sound_HighFadeInRate = 0.29,
		
		Sound_Throttle = "",
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "simulated_vehicles/horn_1.wav",		
		
		DifferentialGear = 0.42,
		Gears = {-0.1,0,0.1,0.17,0.24,0.37,}
	}
}
list.Set( "simfphys_vehicles", "zaz968(E34D-FSD2-FN2J)", V )

