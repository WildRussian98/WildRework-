AddCSLuaFile()

local IV = {
	Name = "District 9 APC",
	Model = "models/inaki/vehicles/frontlines/allies/apc.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Бронемашины",
	SpawnOffset = Vector(0,0,15),
	
	Members = {
		Mass = 2750,
		
		LightsTable = "frontlines_apc",
		
		AirFriction = -20,
		
		CustomSuspensionTravel = 10,
		
		CustomSteerAngle = 30,
		
		SeatOffset = Vector(-28,0,-10),
		SeatPitch = 0,
		SeatYaw = 0,
		
		PassengerSeats = {
			{
				pos = Vector(18,15,40),
				ang = Angle(0,360,10)
			},
			{
				pos = Vector(-18,15,40),
				ang = Angle(0,360,10)
			},
			{
				pos = Vector(18,-15,40),
				ang = Angle(0,360,10)
			},
			{
				pos = Vector(-18,-15,40),
				ang = Angle(0,360,10)
			},
		},
		
		ExhaustPositions = {
			{
				pos = Vector(-50,-115,57),
				ang = Angle(90,270,0)
			},
			{
				pos = Vector(-50,-115,57),
				ang = Angle(90,270,0)
			},
			{
				pos = Vector(-50,-115,57),
				ang = Angle(90,270,0)
			},
			{
				pos = Vector(50,-115,57),
				ang = Angle(90,270,0)
			},
			{
				pos = Vector(50,-115,57),
				ang = Angle(90,270,0)
			},
			{
				pos = Vector(50,-115,57),
				ang = Angle(90,270,0)
			},
		},
		
		OnSpawn = function(ent)
		ent:SetSkin(math.random(0,2))
		end,
		
		OnTick = function(ent)
			ent:SetBodygroup(1, 0)
		end,
		
		StrengthenSuspension = false, -- stiffer suspension.
		
		FrontWheelRadius = 23,
		FrontHeight = 17,
		FrontConstant = 28000,
		FrontDamping = 2800,
		FrontRelativeDamping = 2800,
		
        RearWheelRadius = 23,
		RearHeight = 15,
		RearConstant = 32000,
		RearDamping = 2900,
		RearRelativeDamping = 2900,

		FastSteeringAngle = 120,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 7,

		MaxHealth = 8000,
		IsArmored = true,
		
MaxGrip = 150,
Efficiency = 1,
GripOffset = -0.10,
BrakePower = 70,
BulletProofTires = true,

IdleRPM = 1000,
LimitRPM = 5000,
PeakTorque = 70,
PowerbandStart = 1500,
PowerbandEnd = 4800,
Turbocharged = false,
Supercharged = false,
	
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
Gears = {-0.1,0,0.1,0.2,0.3,0.38}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_frontlines_apc_gunless", IV )

local light_table = {

	L_HeadLampPos = Vector(32,120,39),
	L_HeadLampAng = Angle(20,90,0),

	R_HeadLampPos = Vector(-32,120,39),
	R_HeadLampAng = Angle(20,90,0),

	L_RearLampPos = Vector(32,120,39),
	L_RearLampAng = Angle(0,-90, 0),

	R_RearLampPos = Vector(-32,120,39),
	R_RearLampAng = Angle(0,-90,0),
	
	Headlight_sprites = { 
		Vector(-37,105,57),
		Vector(37,105,57),
	},
	Headlamp_sprites = { 
		Vector(-43,105,57),
		Vector(43,105,57),
	},
	Rearlight_sprites = {
		Vector(-44,-97,60),
		Vector(44,-97,60),
	},
}
list.Set( "simfphys_lights", "frontlines_jeep", light_table)

local light_table = {

	L_HeadLampPos = Vector(32,120,39),
	L_HeadLampAng = Angle(20,90,0),

	R_HeadLampPos = Vector(-32,120,39),
	R_HeadLampAng = Angle(20,90,0),

	L_RearLampPos = Vector(32,120,39),
	L_RearLampAng = Angle(0,-90, 0),

	R_RearLampPos = Vector(-32,120,39),
	R_RearLampAng = Angle(0,-90,0),
	
	Headlight_sprites = { 
		Vector(-44,148,52),
		Vector(44,148,52),
	},
	Headlamp_sprites = { 
		Vector(-33,148,52),
		Vector(33,148,52),
	},
	Rearlight_sprites = {
		Vector(-51,-120,70),
		Vector(51,-120,70),
	},
}
list.Set( "simfphys_lights", "frontlines_apc", light_table)