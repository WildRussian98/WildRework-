
AddCSLuaFile()

local light_table = {
	L_HeadLampPos = Vector(-34,134,48),
	L_HeadLampAng = Angle(0,90,0),

	R_HeadLampPos = Vector(34,134,48),
	R_HeadLampAng = Angle(0,90,0),

	Headlight_sprites = { 
		Vector(-34,134,48),
		Vector(34,134,48),
	},
	Headlamp_sprites = { 
		Vector(-34,134,48),
		Vector(34,134,48),
	},
	FogLight_sprites = { 
		Vector(-34,134,48),
		Vector(34,134,48),
	},
	Turnsignal_sprites = {
		Left = {
		Vector(-34,133.5,56),
		Vector(-45,122,58.5),
		},
		Right = {
		Vector(34,133.5,56),
		Vector(45,122,58.5),
		},
	},
	ems_sounds = {"common/null.wav"},
	ems_sprites = {
		{   --//main light
			pos = Vector(-7.5,65.5,103.5),
			material = "sprites/light_glow02_add_noz",
			size = 35,
			Colors = {Color(250,115,0,255),Color(250,115,0,255),Color(250,115,0,250)}, -- the script will go from color to color
			Speed = 1, -- for how long each color will be drawn
		},
		{
			pos = Vector(7.5,65.5,103.5),
			material = "sprites/light_glow02_add_noz",
			size = 35,
			Colors = {Color(250,115,0,255),Color(250,115,0,255),Color(250,115,0,250)}, -- the script will go from color to color
			Speed = 1, -- for how long each color will be drawn
		},
		{
			pos = Vector(0,65.5,103.5),
			material = "sprites/light_glow02_add_noz",
			size = 35,
			Colors = {Color(250,115,0,255),Color(250,115,0,255),Color(250,115,0,250)}, -- the script will go from color to color
			Speed = 1, -- for how long each color will be drawn
		},
	},
}
list.Set( "simfphys_lights", "Zil_130", light_table)

local V = {
	Name = "ЗИЛ 130",
	Model = "models/wg_zil130/Zil_130_rigged.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Грузовики",

	Members = {
		Mass = 2800,
		
		CustomMassCenter = Vector(0,0,17),
		EnginePos = Vector(0,70,40),
		
		SpeedoMax = 60,
		
		MaxHealth = 3500,
		
		OnSpawn = 
		function(ent) 
			ent:SetSkin(math.random(0,4))
		end,
		
		LightsTable = "Zil_130",
		
		CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		CustomWheelModel = "models/wg_zil130/130_f_wheel.mdl",
		CustomWheelModel_R = "models/wg_zil130/130_r_wheel.mdl",
		CustomWheelPosFL = Vector(-40,95,20),
		CustomWheelPosFR = Vector(40,95,20),
		CustomWheelPosRL = Vector(-42,-72,20),
		CustomWheelPosRR = Vector(42,-72,20),
		CustomWheelAngleOffset = Angle(0,-90,0),
		
		CustomSteerAngle = 30,
		
		SeatOffset = Vector(36,-18,82),
		SeatPitch = 0,
		
		PassengerSeats = {
			{
				pos = Vector(18,36,50),
				ang = Angle(0,0,0)
			}
		},
		
				
		ExhaustPositions = {
			{
				pos = Vector(-40,-18,25),
				ang = Angle(-85,0,0)
			},
		},
		
		FuelFillPos = Vector(-48,-2.5,48),
		FuelType = FUELTYPE_DIESEL,
		FuelTankSize = 80,
		
		StrengthenSuspension = true,
		
		FrontHeight = 10,
		FrontConstant = 25000,
		FrontDamping = 1000,
		FrontRelativeDamping = 1000,
		
		RearHeight = 10,
		RearConstant = 25000,
		RearDamping = 1000,
		RearRelativeDamping = 1000,
		
		FastSteeringAngle = 30,
		SteeringFadeFastSpeed = 185,
		
		TurnSpeed = 4,
		
		MaxGrip = 60,
		Efficiency = 0.85,
		GripOffset = -1,
		BrakePower = 30,
		
		IdleRPM = 600,
		LimitRPM = 5000,
		PeakTorque = 80,
		PowerbandStart = 1000,
		PowerbandEnd = 4500,
		Turbocharged = false,
		Supercharged = false,
		
		PowerBias = 1,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/jeep/jeep_idle.wav",
		Sound_IdlePitch = 0.9,
		
		Sound_Mid = "simulated_vehicles/misc/m50.wav",
		Sound_MidPitch = 0.9,
		Sound_MidVolume = 2,
		Sound_MidFadeOutRPMpercent = 67,		-- at wich percentage of limitrpm the sound fades out
		Sound_MidFadeOutRate = 0.36,                    --how fast it fades out   0 = instant       1 = never
		
		Sound_High = "simulated_vehicles/jeep/jeep_mid.wav",
		Sound_HighPitch = 0.9,
		Sound_HighVolume = 7.0,
		Sound_HighFadeInRPMpercent = 10,
		Sound_HighFadeInRate = 0.59,
		
		Sound_Throttle = "",		-- mutes the default throttle sound
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "simulated_vehicles/horn_1.wav",
		
		DifferentialGear = 0.4,
		Gears = {-0.11,0,0.06,0.15,0.22}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_zil_130", V )