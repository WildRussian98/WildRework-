local light_table = {
	R_HeadLampPos = Vector(102,-15,84),
	R_HeadLampAng = Angle(0,0,0),
	
	Headlight_sprites = { 
		Vector(113,40,71),
	},
	Headlamp_sprites = { 
		Vector(102,-15,84),
		Vector(102,-15,84),
		Vector(102,-15,84),
	},
	Brakelight_sprites = {
		Vector(-142,-31,70),
		Vector(-142,31,70),
		Vector(-142,-31,70),
		Vector(-142,31,70),
	},
	Rearlight_sprites = {
		Vector(-142,-31,70),
		Vector(-142,31,70),
		Vector(-142,-31,70),
		Vector(-142,31,70),
		Vector(-142,-31,70),
		Vector(-142,31,70),
	},

}
list.Set( "simfphys_lights", "0", light_table)


local V = {
	Name = "БТР-80",
	Model = "models/btr-80.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	SpawnOffset = Vector(0,0,0),
	Category = "Легкая бронетехника",

	Members = {
		Mass = 7000,
		MaxHealth = 8500,
	
		LightsTable = "0",
		
		
		ApplyDamage = function( ent, damage, type ) 
			simfphys.TankApplyDamage(ent, damage, type)
		end,
		
		IsArmored = true,
		NoWheelGibs = true,
	    FrontWheelRadius = 22,--радиус переднего колеса
		RearWheelRadius = 22,--радиус заднего колеса
		
	    CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		CustomWheelModel = "models/btr-80 wheel.mdl",
		CustomWheelPosFL = Vector(92,40,20),
		CustomWheelPosFR = Vector(92,-40,20),
		CustomWheelPosML = Vector(37,40,20),	
		CustomWheelPosMR = Vector(37,-40,20),
		CustomWheelPosRL = Vector(-88,40,20),	
		CustomWheelPosRR = Vector(-88,-40,20),
		CustomWheelAngleOffset = Angle(0,180,0),

		
		CustomMassCenter = Vector(16,0,3.5),
        EnginePos = Vector(-75,0,60),
		
		CustomSteerAngle = 35,
		CustomWheelCamber = 0,
		
		SeatOffset = Vector(83,-21,65),
		SeatPitch = 0,
		SeatYaw = 90,
		
		PassengerSeats = {
			{
                pos = Vector(-30,-18,35),
                ang = Angle(0,-90,0),
        	},
                {
                pos = Vector(-80,-18,35),
                ang = Angle(0,-90,0),
        	},
			{
                pos = Vector(-30,18,35),
                ang = Angle(0,-90,0),
        	},
			{
                pos = Vector(-80,18,35),
                ang = Angle(0,-90,0),
        	},
			{
                pos = Vector(-50,18,35),
                ang = Angle(0,-90,0),
        	},
			{
                pos = Vector(-50,18,35),
                ang = Angle(0,-90,0),
        	},
		},
		
		OnSpawn = function(ent)
		ent:SetSkin(math.random(0,4))
		end,
		
		FrontHeight = 9, -- высота передней подвески
		FrontConstant = 100000,
		FrontDamping = 15000,
		FrontRelativeDamping = 7000,

		RearHeight = 9, -- высота задней подвески
		RearConstant = 100000,
		RearDamping = 15000,
		RearRelativeDamping = 7000,
		
		FastSteeringAngle = 20,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 4,

MaxGrip = 150,
Efficiency = 1,
GripOffset = -0.10,
BrakePower = 70,
BulletProofTires = true,

IdleRPM = 1000,
LimitRPM = 3000,
PeakTorque = 200,
PowerbandStart = 1500,
PowerbandEnd = 8000,
Turbocharged = false,
Supercharged = false,

FuelFillPos = Vector(-61.34,49.71,30),
FuelType = FUELTYPE_DIESEL,
FuelTankSize = 120,

PowerBias = 0,

EngineSoundPreset = 0,

Sound_Idle = "simulated_vehicles/misc/Nanjing_loop.wav",
Sound_IdlePitch = 1,

Sound_Mid = "simulated_vehicles/misc/m50.wav",
Sound_MidPitch = 1,
Sound_MidVolume = 1,
Sound_MidFadeOutRPMpercent = 58,
Sound_MidFadeOutRate = 0.4,

Sound_High = "simulated_vehicles/misc/v8high2.wav",
Sound_HighPitch = 1,
Sound_HighVolume = 0.75,
Sound_HighFadeInRPMpercent = 58,
Sound_HighFadeInRate = 0.19,

Sound_Throttle = "",
Sound_ThrottlePitch = 0,
Sound_ThrottleVolume = 0,

snd_horn = "simulated_vehicles/horn_2.wav",

ForceTransmission = 0,

DifferentialGear = 0.17,
Gears = {-0.2,0,0.3,0.4,0.6}
	}
}
list.Set( "simfphys_vehicles", "simfphys_btr80", V )

local V = {
	Name = "БТР-80А",
	Model = "models/btr-80a.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	SpawnOffset = Vector(0,0,0),
	Category = "Средняя бронетехника",

	Members = {
		Mass = 7000,
		MaxHealth = 8500,
	
		LightsTable = "0",
		
		ApplyDamage = function( ent, damage, type ) 
			simfphys.TankApplyDamage(ent, damage, type)
		end,
		
		IsArmored = true,
		NoWheelGibs = true,
	    FrontWheelRadius = 22,--радиус переднего колеса
		RearWheelRadius = 22,--радиус заднего колеса
		
	    CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		CustomWheelModel = "models/btr-80 wheel.mdl",
		CustomWheelPosFL = Vector(92,40,20),
		CustomWheelPosFR = Vector(92,-40,20),
		CustomWheelPosML = Vector(37,40,20),	
		CustomWheelPosMR = Vector(37,-40,20),
		CustomWheelPosRL = Vector(-88,40,20),	
		CustomWheelPosRR = Vector(-88,-40,20),
		CustomWheelAngleOffset = Angle(0,180,0),

		
		CustomMassCenter = Vector(16,0,3.5),
        EnginePos = Vector(-75,0,60),
		
		CustomSteerAngle = 35,
		CustomWheelCamber = 0,
		
		SeatOffset = Vector(83,-21,65),
		SeatPitch = 0,
		SeatYaw = 90,
		
		PassengerSeats = {
			{
                pos = Vector(-30,-18,35),
                ang = Angle(0,-90,0),
        	},
                {
                pos = Vector(-80,-18,35),
                ang = Angle(0,-90,0),
        	},
			{
                pos = Vector(-30,18,35),
                ang = Angle(0,-90,0),
        	},
			{
                pos = Vector(-80,18,35),
                ang = Angle(0,-90,0),
        	},
			{
                pos = Vector(-50,18,35),
                ang = Angle(0,-90,0),
        	},
			{
                pos = Vector(-50,18,35),
                ang = Angle(0,-90,0),
        	},
		},
		
		OnSpawn = function(ent)
		ent:SetSkin(math.random(0,4))
		end,
		
		FrontHeight = 9, -- высота передней подвески
		FrontConstant = 100000,
		FrontDamping = 15000,
		FrontRelativeDamping = 7000,

		RearHeight = 9, -- высота задней подвески
		RearConstant = 100000,
		RearDamping = 15000,
		RearRelativeDamping = 7000,
		
		FastSteeringAngle = 20,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 4,

MaxGrip = 150,
Efficiency = 1,
GripOffset = -0.10,
BrakePower = 70,
BulletProofTires = true,

IdleRPM = 1000,
LimitRPM = 3000,
PeakTorque = 200,
PowerbandStart = 1500,
PowerbandEnd = 8000,
Turbocharged = false,
Supercharged = false,

FuelFillPos = Vector(-61.34,49.71,30),
FuelType = FUELTYPE_DIESEL,
FuelTankSize = 120,

PowerBias = 0,

EngineSoundPreset = 0,

Sound_Idle = "simulated_vehicles/misc/Nanjing_loop.wav",
Sound_IdlePitch = 1,

Sound_Mid = "simulated_vehicles/misc/m50.wav",
Sound_MidPitch = 1,
Sound_MidVolume = 1,
Sound_MidFadeOutRPMpercent = 58,
Sound_MidFadeOutRate = 0.4,

Sound_High = "simulated_vehicles/misc/v8high2.wav",
Sound_HighPitch = 1,
Sound_HighVolume = 0.75,
Sound_HighFadeInRPMpercent = 58,
Sound_HighFadeInRate = 0.19,

Sound_Throttle = "",
Sound_ThrottlePitch = 0,
Sound_ThrottleVolume = 0,

snd_horn = "simulated_vehicles/horn_2.wav",

ForceTransmission = 0,

DifferentialGear = 0.17,
Gears = {-0.2,0,0.3,0.4,0.6}
	}
}
list.Set( "simfphys_vehicles", "simfphys_btr80a", V )
