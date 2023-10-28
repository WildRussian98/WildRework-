 local light_table = {
ModernLights = true, -- грубо говоря, ксенон или старые фары. True - ксенон, false - старые
L_HeadLampPos = Vector(153,-29,78), -- рассположение обычных фар (левых - L)
L_HeadLampAng = Angle(0,0,0), -- угол поворота фар

R_HeadLampPos = Vector(153,29,79), -- рассположение обычных фар (правых - R)
R_HeadLampAng = Angle(0,0,0), -- угол поворота фар

Headlight_sprites = { -- Обычные фары
{pos = Vector(152,-29,78),size = 35},
{pos = Vector(152,-29,78),size = 35},

{pos = Vector(152,29,78),size = 35},
{pos = Vector(152,29,78),size = 35},
},
Headlamp_sprites = { -- дальние
{pos = Vector(152,-29,78),size = 40},
{pos = Vector(152,-29,78),size = 40},

{pos = Vector(152,29,78),size = 40},
{pos = Vector(152,29,78),size = 40},

{pos = Vector(152,-29,78),size = 40},
{pos = Vector(152,-29,78),size = 40},

{pos = Vector(152,29,78),size = 40},
{pos = Vector(152,29,78),size = 40},
},
FogLight_sprites = {
{pos = Vector(152,29,78),size = 40},
{pos = Vector(152,-29,78),size = 40},
},
Rearlight_sprites = { -- задние фары
{pos = Vector(-158,43,64),size = 35},
{pos = Vector(-158,-43,64),size = 35},
},
Brakelight_sprites = { -- тормозные огни
{pos = Vector(-160,43,64),size = 35},
{pos = Vector(-160,-43,64),size = 35},
},
Turnsignal_sprites = {
Left = {
{pos = Vector(-158,-43,64),size = 35},
{pos = Vector(152,-35,82),size = 35},
},
Right = {
{pos = Vector(-158,43,64),size = 35},
{pos = Vector(152,35,82),size = 35},
},
},
SubMaterials = {
		off = {
			Base = {
				[13] = ""
			},
		},
		on_lowbeam = {
			Base = {
				[13] = "dk_cars/rc_toys/bandit/lights/lights_low_beam"
			},
		},
		on_highbeam = {
			Base = {
				[13] = "dk_cars/rc_toys/bandit/lights/lights_low_beam"
			},
		},
	}
}
list.Set( "simfphys_lights", "STRYKER", light_table) -- здесь тебе нужно изменить "test" на любое другое название, например "myfirstsimfcar"


local V = {
	Name = "Stryker M1126",
	Model = "models/stryker/stryker_m1126_ifv.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	SpawnOffset = Vector(0,0,0),
	Category = "Легкая бронетехника",

	Members = {
		Mass = 7000,
		MaxHealth = 8500,
		
		OnSpawn = 
		function(ent) 
		ent:SetSkin(math.random(0,1))
		ent:SetBodygroup(3,1)
		ent:SetBodygroup(4,1)
		ent:SetBodygroup(5,1)
		end,
	
		LightsTable = "STRYKER",
		
		ApplyDamage = function( ent, damage, type ) 
			simfphys.TankApplyDamage(ent, damage, type)
		end,
		
		GibModels = {
			"models/stryker_m1126_ifv_destroyed.mdl",
		},
		
		IsArmored = true,
		NoWheelGibs = true,
	    FrontWheelRadius = 22,--радиус переднего колеса
		RearWheelRadius = 22,--радиус заднего колеса
		
	    CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		CustomWheelModel = "models/stryker_m1126_ifv_wheel.mdl",
		CustomWheelPosFL = Vector(75,54,20),
		CustomWheelPosFR = Vector(75,-54,20),
		CustomWheelPosML = Vector(20,54,20),	
		CustomWheelPosMR = Vector(20,-54,20),
		CustomWheelPosRL = Vector(-95,54,20),	
		CustomWheelPosRR = Vector(-95,-54,20),
		CustomWheelAngleOffset = Angle(0,180,0),

		
		CustomMassCenter = Vector(16,0,3.5),
        EnginePos = Vector(-75,0,60),
		
		CustomSteerAngle = 35,
		CustomWheelCamber = 0,
		
		SeatOffset = Vector(90,-19,85),
		SeatPitch = 0,
		SeatYaw = 90,
		
		PassengerSeats = {
			{
                pos = Vector(-30,-18,44),
                ang = Angle(0,-90,0),
        	},
                {
                pos = Vector(-80,-18,44),
                ang = Angle(0,-90,0),
        	},
			{
                pos = Vector(-30,18,44),
                ang = Angle(0,-90,0),
        	},
			{
                pos = Vector(-80,18,44),
                ang = Angle(0,-90,0),
        	},
			{
                pos = Vector(-50,18,44),
                ang = Angle(0,-90,0),
        	},
			{
                pos = Vector(-50,18,44),
                ang = Angle(0,-90,0),
        	},
		},
		
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
list.Set( "simfphys_vehicles", "simphys_stryker_mg", V )
