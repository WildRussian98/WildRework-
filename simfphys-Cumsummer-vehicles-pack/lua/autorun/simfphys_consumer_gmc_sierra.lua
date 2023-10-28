
AddCSLuaFile()

local light_table = {
	L_HeadLampPos = Vector(120,29,41),
	L_HeadLampAng = Angle(0,0,0),

	R_HeadLampPos = Vector(120,-29,41),
	R_HeadLampAng = Angle(0,0,0),

	L_RearLampPos = Vector(-122,39,40),
	L_RearLampAng = Angle(0,180,0),

	R_RearLampPos = Vector(-122,-39,40),
	R_RearLampAng = Angle(0,180,0),
	
	Headlight_sprites = { 
		Vector(119,34,45),
		Vector(119,34,38),
		
		Vector(119,-34,45),
		Vector(119,-34,38),
	},
	Headlamp_sprites = { 
		Vector(120,29,45),
		Vector(120,29,38),
		
		Vector(120,-29,45),
		Vector(120,-29,38),
	},
	FogLight_sprites = {
		Vector(119,29,20),
		Vector(119,31,20),
		Vector(119,33,20),
		
		Vector(119,-29,20),
		Vector(119,-31,20),
		Vector(119,-33,20),
	},
	Rearlight_sprites = {
		{pos = Vector(-122,39,40), color = Color(200, 0, 0, 240), size = 20},
		{pos = Vector(-122,40,40), color = Color(200, 0, 0, 240), size = 20},
		{pos = Vector(-121,41,40), color = Color(200, 0, 0, 240), size = 20},
		{pos = Vector(-120,42,40), color = Color(200, 0, 0, 240), size = 20},
		{pos = Vector(-119,43,40), color = Color(200, 0, 0, 240), size = 20},
		
		{pos = Vector(-24,-2,81.5), color = Color(200, 0, 0, 240), size = 15},
		{pos = Vector(-24,0,81.5), color = Color(200, 0, 0, 240), size = 15},
		{pos = Vector(-24,2,81.5), color = Color(200, 0, 0, 240), size = 15},
		
		{pos = Vector(-122,-39,40), color = Color(200, 0, 0, 240), size = 20},
		{pos = Vector(-122,-40,40), color = Color(200, 0, 0, 240), size = 20},
		{pos = Vector(-121,-41,40), color = Color(200, 0, 0, 240), size = 20},
		{pos = Vector(-120,-42,40), color = Color(200, 0, 0, 240), size = 20},
		{pos = Vector(-119,-43,40), color = Color(200, 0, 0, 240), size = 20},
	},
	Brakelight_sprites = {
		{pos = Vector(-122,39,52), color = Color(190, 0, 0, 220), size = 35},
		{pos = Vector(-122,40,52), color = Color(190, 0, 0, 220), size = 35},
		{pos = Vector(-121,41,52), color = Color(190, 0, 0, 220), size = 35},
		{pos = Vector(-120,42,52), color = Color(190, 0, 0, 220), size = 35},
		{pos = Vector(-119,43,52), color = Color(190, 0, 0, 220), size = 35},
		
		{pos = Vector(-24,-2,81.5), color = Color(220, 0, 0, 240), size = 15},
		{pos = Vector(-24,0,81.5), color = Color(220, 0, 0, 240), size = 15},
		{pos = Vector(-24,2,81.5), color = Color(220, 0, 0, 240), size = 15},
		
		{pos = Vector(-122,-39,52), color = Color(190, 0, 0, 220), size = 35},
		{pos = Vector(-122,-40,52), color = Color(190, 0, 0, 220), size = 35},
		{pos = Vector(-121,-41,52), color = Color(190, 0, 0, 220), size = 35},
		{pos = Vector(-120,-42,52), color = Color(190, 0, 0, 220), size = 35},
		{pos = Vector(-119,-43,52), color = Color(190, 0, 0, 220), size = 35},
	},
	Reverselight_sprites = {
		Vector(-122,39,43),
		Vector(-122,40,43),
		Vector(-121,41,43),
		Vector(-120,42,43),
		Vector(-119,43,43),
		
		{pos = Vector(-24,-6,81.5), size = 15},
		{pos = Vector(-24,-4,81.5), size = 15},
		{pos = Vector(-24,6,81.5), size = 15},
		{pos = Vector(-24,4,81.5), size = 15},
		
		Vector(-122,-39,43),
		Vector(-122,-40,43),
		Vector(-121,-41,43),
		Vector(-120,-42,43),
		Vector(-119,-43,43),
	},
	Turnsignal_sprites = {
		Left = {
		{pos = Vector(116,38,45), color = Color(255, 75, 0, 210), size = 30},
		{pos = Vector(115,39,45), color = Color(255, 75, 0, 210), size = 30},
		{pos = Vector(116,38,38.5), color = Color(255, 75, 0, 210), size = 20},
		{pos = Vector(115,39,38.5), color = Color(255, 75, 0, 210), size = 20},
			
		Vector(-122,39,46),
		Vector(-122,40,46),
		Vector(-121,41,46),
		Vector(-120,42,46),
		Vector(-119,43,46),
		},
		Right = {
		{pos = Vector(116,-38,45), color = Color(255, 75, 0, 210), size = 30},
		{pos = Vector(115,-39,45), color = Color(255, 75, 0, 210), size = 30},
		{pos = Vector(116,-38,38.5), color = Color(255, 75, 0, 210), size = 20},
		{pos = Vector(115,-39,38.5), color = Color(255, 75, 0, 210), size = 20},
			
		Vector(-122,-39,46),
		Vector(-122,-40,46),
		Vector(-121,-41,46),
		Vector(-120,-42,46),
		Vector(-119,-43,46),
		},
	}
}
list.Set( "simfphys_lights", "CP_GMC_Sierra", light_table)

local V = {
	Name = "GMC Sierra",
	Model = "models/consumerpack/gmc_sierra_1500_canopy/GMC_Sierra_1500_canopy_rigged.mdl",
	ModelOffset = Angle(0,90,0),
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Автомобили",
	SpawnAngleOffset = 90,
	
	Members = {
		Mass = 1910,
		
		CustomMassCenter = Vector(3,0,12),
		EnginePos = Vector(45,0,20),
		
		SpeedoMax = 140,
		
		OnSpawn = 
		function(ent) 
			ent:SetSkin(math.random(0,16))
		end,
		
		LightsTable = "CP_GMC_Sierra",
		
		CustomWheels = true,
		CustomSuspensionTravel = 11,
		
		CustomWheelModel = "models/consumerpack/gmc_sierra_1500_canopy/gmc_sierra_1500_wheel.mdl",
	    CustomWheelPosFL = Vector(89,39,18),
		CustomWheelPosFR = Vector(89,-39,18),
		CustomWheelPosRL = Vector(-76,39,18),	
		CustomWheelPosRR = Vector(-76,-39,18),
		CustomWheelAngleOffset = Angle(0,180,0),
		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(17,-21,65),
        SeatPitch = 0,
		SeatYaw = 90,
		
		PassengerSeats = {
			{
				pos = Vector(21,-21,30),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(-10,21,30),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(-10,0,30),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(-10,-21,30),
				ang = Angle(0,-90,0)
			},
		},
				
		ExhaustPositions = {
			{
				pos = Vector(-110,-40,15),
				ang = Angle(0,0,90)
			},
		},
		
		FuelFillPos = Vector(-38,45,42),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 85,
		
		StrengthenSuspension = false,
		
		FrontHeight = 7,
		FrontConstant = 38000,
		FrontDamping = 2000,
		FrontRelativeDamping = 2000,
		
		RearHeight = 7,
		RearConstant = 38000,
		RearDamping = 2000,
		RearRelativeDamping = 2000,
		
		FastSteeringAngle = 30,
		SteeringFadeFastSpeed = 245,
		
		TurnSpeed = 3.5,
		
		MaxGrip = 75,
		Efficiency = 0.8,
		GripOffset = -2,
		BrakePower = 35,
		
		IdleRPM = 400,
		LimitRPM = 5600,
		PeakTorque = 90,
		PowerbandStart = 500,
		PowerbandEnd = 5000,
		Turbocharged = false,
		Supercharged = false,
		
		PowerBias = 0,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/shelby/shelby_idle.wav",
		Sound_IdlePitch = 0.9,
		
		Sound_Mid = "simulated_vehicles/jalopy/jalopy_mid.wav",
		Sound_MidPitch = 0.9,
		Sound_MidVolume = 3,
		Sound_MidFadeOutRPMpercent = 90,		-- at wich percentage of limitrpm the sound fades out
		Sound_MidFadeOutRate = 0.34,                    --how fast it fades out   0 = instant       1 = never
		
		Sound_High = "simulated_vehicles/misc/nv_onlow_ex.wav",
		Sound_HighPitch = 0.8,
		Sound_HighVolume = 4.0,
		Sound_HighFadeInRPMpercent = 65,
		Sound_HighFadeInRate = 0.24,
		
		Sound_Throttle = "",		-- mutes the default throttle sound
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "simulated_vehicles/horn_3.wav",
		
		DifferentialGear = 0.45,
		Gears = {-0.11,0,0.14,0.25,0.33,0.46,}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_cp_sierra1500", V )