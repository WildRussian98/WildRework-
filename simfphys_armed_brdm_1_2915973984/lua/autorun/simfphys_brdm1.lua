local Category = "Легкая бронетехника"

local IV = {
	Name = "БРДМ-1",
	Model = "models/brdm1/brdm1.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = Category,
	SpawnOffset = Vector(0,0,50),

	Members = {
		Mass = 5700,
		LightsTable = "brdm1",

           GibModels = {
			"models/brdm1/brdm1.mdl",
		},
		CustomWheels = true,
		IsArmored = true,
		BulletProofTires = true,
		EnginePos = Vector(65,0,55),
		CustomSuspensionTravel = 1.5,
		FirstPersonViewPos = Vector(0,-36,12),
		
		
		CustomWheelModel = "models/brdm1/brdm1_wheel.mdl",
		CustomWheelPosFL = Vector(52,33.5,9.5),
		CustomWheelPosFR = Vector(52,-33.5,9.5),		
		CustomWheelPosRL = Vector(-62,33.5,9.5),
		CustomWheelPosRR = Vector(-62,-33.5,9.5),
		
		CustomWheelAngleOffset = Angle(0,90,0),
		
		CustomMassCenter = Vector(0,0,15),
		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(-20,-15,60),
		SeatPitch = 5,
		SeatYaw = 90,
		
		PassengerSeats = {
			{
				pos = Vector(-15,-15,30),
				ang = Angle(0,-90,0)			
			},
			{
				pos = Vector(-45,12,30),
				ang = Angle(0,-180,10)
			},
			{
				pos = Vector(-45,-12,30),
				ang = Angle(0,-360,10)
			},
			{
				pos = Vector(-45,0,30),
				ang = Angle(0,-90,10)
			},
			},
		ExhaustPositions = {
			{
				pos = Vector(-94,21,28),
				ang = Angle(90,165,0),
			},
		},

		
		FrontHeight = 1,
		FrontConstant = 90000,
		FrontDamping = 7000,
		FrontRelativeDamping = 4000,
		
		RearHeight = 1,
		RearConstant = 90000,
		RearDamping = 7000,
		RearRelativeDamping = 4000,
		
		FastSteeringAngle = 1000,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 3,
		
		MaxGrip = 110,
		Efficiency = 1.0,
		GripOffset = -2,
		BrakePower = 40,

		MaxHealth = 5500,

		IdleRPM = 228,
		LimitRPM = 2300,
		PeakTorque = 180,
		PowerbandStart = 750,
		PowerbandEnd = 2000,
		Turbocharged = false,
		Supercharged = false,
		
		FuelFillPos = Vector(-61.34,49.71,15.98),
		--FuelType = FUELTYPE_DIESEL,
		FuelTankSize = 280, -- 120
		
		PowerBias = 0,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/misc/Nanjing_loop.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/misc/m50.wav",
		Sound_MidPitch = 1,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 58,
		Sound_MidFadeOutRate = 0.476,
		
		Sound_High = "simulated_vehicles/misc/v8high2.wav",
		Sound_HighPitch = 1,
		Sound_HighVolume = 0.75,
		Sound_HighFadeInRPMpercent = 58,
		Sound_HighFadeInRate = 0.19,
		
		Sound_Throttle = "",
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "simulated_vehicles/horn_2.wav",
		
		ForceTransmission = 1,
		
		DifferentialGear = 0.27,
		Gears = {-0.09,0,0.09,0.18,0.28,0.35,0.4,0.5}
	}
}
list.Set( "simfphys_vehicles", "simfphys_brdm1", IV )
local light_table = {
	L_HeadLampPos = Vector(91,25.5,57),
	L_HeadLampAng = Angle(0,0,0),

	R_HeadLampPos = Vector(91,-25,57),
	R_HeadLampAng = Angle(0,0,0),
	
	Headlight_sprites = { 
{
		pos = Vector(91,34.5,55.5),
		size = 55,
},
{
		pos = Vector(91,-34,55.5),
		size = 55,
},
{
		pos = Vector(91,25.5,57),
		size = 55,
},
{
		pos = Vector(91,-25,57),
		size = 55,
},

},
	Headlamp_sprites = { 
{
		pos = Vector(91,34.5,55.5),
		size = 55,
},
{
		pos = Vector(91,-34,55.5),
		size = 55,
},
{
		pos = Vector(91,25.5,57),
		size = 55,
},
{
		pos = Vector(91,-25,57),
		size = 55,
},
{
		pos = Vector(7,28.5,75),
		size = 55,
},

},
	Rearlight_sprites = {
{
		pos = Vector(-104,22,59),
		size = 50,
},

},
	Brakelight_sprites = {
{
		pos = Vector(-104,22,59),
		size = 50,
},
},
	Reverselight_sprites = {
{
		pos = Vector(-104,22,59),
		size = 50,
},
},
	DelayOn = 0.1,
	DelayOff = 0.1,
	
	Turnsignal_sprites = {
		Left = {

{
		pos = Vector(91,34.5,55.5),
		size = 55,
},
	},
		Right = {

{
		pos = Vector(91,-34,55.5),
		size = 55,
},
		},
	}
}
list.Set( "simfphys_lights", "brdm1", light_table)
