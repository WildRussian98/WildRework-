local Category = "Автомобили"

AddCSLuaFile()
local light_table = {
	L_HeadLampPos = Vector(86,30,-0.5),
	L_HeadLampAng = Angle(10,0,0),

	R_HeadLampPos = Vector(86,-30,-0.5),
	R_HeadLampAng = Angle(10,0,0),

	L_RearLampPos = Vector(-110,32,4.5),
	L_RearLampAng = Angle(0,180,0),

	R_RearLampPos = Vector(-110,-32,4.5),
	R_RearLampAng = Angle(0,180,0),
	
	Headlight_sprites = { 
		Vector(86,30,-0.5),
		Vector(86,-30,-0.5),
	},
	Headlamp_sprites = { 
		Vector(86,30,-0.5),
		Vector(86,-30,-0.5),
	},
	Rearlight_sprites = {
		Vector(-110,32,4.5),
		Vector(-110,-32,4.5),
	},
	Brakelight_sprites = {
		Vector(-110,32,4.5),
		Vector(-110,-32,4.5),
	},
		Turnsignal_sprites = {
		Left = {
			Vector(81,40,-8.3),
			Vector(-110,32,0),
			Vector(78.8,39,6.1),
		},
		Right = {
			Vector(81,-40,-8.3),
			Vector(-110,-32,0),
			Vector(78.8,-39,6.1),
		},
	}
	}
list.Set( "simfphys_lights", "SnowdropEscape_Gaz24", light_table)

local V = {
	Name = "ГАЗ-24",
	Model = "models/SnowdropEscape_Gaz24.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = Category,
	SpawnOffset = Vector(0,0,24),

	Members = {
		Mass = 1200,
		EnginePos = Vector(69.37,0,13),
		LightsTable = "SnowdropEscape_Gaz24",
		CustomWheels = true,
		CustomSuspensionTravel = 15,
		
		OnSpawn = 
		function(ent) 
			ent:SetSkin(math.random(0,10))
		end,
		
		CustomWheelModel = "models/SnowdropEscape_Gaz24_Wheel.mdl",
		CustomWheelPosFL = Vector(58.5,34.5,-15.5),
		CustomWheelPosFR = Vector(58.5,-34.5,-15.5),
		CustomWheelPosRL = Vector(-61.5,34.5,-15.5),	
		CustomWheelPosRR = Vector(-61.5,-34.5,-15.5),
		CustomWheelAngleOffset = Angle(180,0,0),
		
		CustomMassCenter = Vector(2,0,-1),
		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(-9,-18,20),
		SeatPitch = -2,
		SeatYaw = 90,
		
		PassengerSeats = {
			{
				pos = Vector(3,-18,-11),
				ang = Angle(0,-90,20)
			},
			{
				pos = Vector(-32,-19,-11.5),
				ang = Angle(0,-90,20)
			},
			{
				pos = Vector(-32,19,-11.5),
				ang = Angle(0,-90,20)
			},
			{
				pos = Vector(-32,0,-11.5),
				ang = Angle(0,-90,20)
			}
		},
		ExhaustPositions = {
			{
				pos = Vector(-105,-18,-16),
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
		LimitRPM = 6000,
		PeakTorque = 100,
		PowerbandStart = 1500,
		PowerbandEnd = 5800,
		Turbocharged = false,
		Supercharged = false,
		
		FuelFillPos = Vector(-95,37.79,-2),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 65,
		
		PowerBias = 1,
		
		EngineSoundPreset = -1,
		
		snd_pitch = 1,
		snd_idle = "simulated_vehicles/generic2/generic2_idle.wav",
		
		snd_low = "simulated_vehicles/generic2/generic2_low.wav",
		snd_low_revdown = "simulated_vehicles/generic2/generic2_revdown.wav",
		snd_low_pitch = 1,
		
		snd_mid = "simulated_vehicles/generic2/generic2_mid.wav",
		snd_mid_gearup = "simulated_vehicles/generic2/generic2_second.wav",
		snd_mid_pitch = 1.1,
		
		snd_horn = "simulated_vehicles/horn_5.wav",
		
		DifferentialGear = 0.62,
		Gears = {-0.1,0,0.1,0.18,0.26,0.31,0.38}
	}
}
list.Set( "simfphys_vehicles", "SnowdropEscape_Gaz24", V )

