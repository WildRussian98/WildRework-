local V = {
	Name = "БМП-1",
	Model = "models/avx/bmp1.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Средняя бронетехника",
	SpawnOffset = Vector(0,0,60),
	SpawnAngleOffset = 180,

	Members = {
		Mass = 15000,
		AirFriction = 0,
		--Inertia = Vector(14017.5,46543,47984.5),
		Inertia = Vector(20000,80000,100000),

		MaxHealth = 8200,

		IsArmored = true,

		OnSpawn = 
			function(ent) 
				ent:SetSkin(math.random(0,1))
				ent:SetNWBool( "simfphys_NoRacingHud", true )
				ent:SetNWBool( "simfphys_NoHud", true ) 
			end,
			
		ApplyDamage = function( ent, damage, type ) 
			simfphys.TankApplyDamage(ent, damage, type)
		end,

		NoWheelGibs = true,

		FirstPersonViewPos = Vector(-10,-30,20),

		FrontWheelRadius = 35,
		RearWheelRadius = 35,

		EnginePos = Vector(50,-15,60),

		CustomWheels = true,
		CustomSuspensionTravel = 10,

		CustomWheelModel = "models/props_c17/canisterchunk01g.mdl",
		--CustomWheelModel = "models/props_vehicles/apc_tire001.mdl",

		CustomWheelPosRL = Vector(-122,-25,25),
		CustomWheelPosRR = Vector(-122,25,25),
		CustomWheelPosML = Vector(0,-25,25),
		CustomWheelPosMR = Vector(0,25,25),
		CustomWheelPosFL = Vector(110,-25,25),
		CustomWheelPosFR = Vector(110,25,25),
		CustomWheelAngleOffset = Angle(0,0,90),

		CustomMassCenter = Vector(0,0,0),

		CustomSteerAngle = 60,

		SeatOffset = Vector(0,0,48),
		SeatPitch = -15,
		SeatYaw = 90,

		ModelInfo = {
			WheelColor = Color(0,0,0,0),
		},

		PassengerSeats = {
			{
				pos = Vector(0,0,32),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(0,0,32),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(0,0,32),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(0,0,32),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(0,0,32),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(0,0,32),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(0,0,32),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(-20,-30,60),
				ang = Angle(0,180,0)
			},
			{
				pos = Vector(-50,-30,60),
				ang = Angle(0,180,0)
			},
			{
				pos = Vector(-90,-30,60),
				ang = Angle(0,180,0)
			},
			{
				pos = Vector(-20,30,60),
				ang = Angle(0,360,0)
			},
			{
				pos = Vector(-50,30,60),
				ang = Angle(0,360,0)
			},
			{
				pos = Vector(-90,30,60),
				ang = Angle(0,360,0)
			},
		},

		FrontHeight = 1,
		FrontConstant = 50000,
		FrontDamping = 30000,
		FrontRelativeDamping = 300000,

		RearHeight = 1,
		RearConstant = 50000,
		RearDamping = 20000,
		RearRelativeDamping = 20000,

		FastSteeringAngle = 20,
		SteeringFadeFastSpeed = 300,

		TurnSpeed = 6,

		MaxGrip = 800,
		Efficiency = 1,
		GripOffset = -300,
		BrakePower = 100,
		BulletProofTires = true,

		IdleRPM = 100,
		LimitRPM = 2800,
		PeakTorque = 310,
		PowerbandStart = 600,
		PowerbandEnd = 2500,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = true,

		FuelFillPos = Vector(139.42,-3.68,38.38),
		FuelType = FUELTYPE_DIESEL,
		FuelTankSize = 220,
		
		PowerBias = -0.3,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/t90ms/idle.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/t90ms/low.wav",
		Sound_MidPitch = 1.5,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 100,
		Sound_MidFadeOutRate = 1,
		
		Sound_High = "simulated_vehicles/t90ms/high.wav",
		Sound_HighPitch = 1.5,
		Sound_HighVolume = 0.7,
		Sound_HighFadeInRPMpercent = 50,
		Sound_HighFadeInRate = 0.2,
		
		Sound_Throttle = "",
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "common/null.wav",
		ForceTransmission = 1,
		
		DifferentialGear = 0.4,
		Gears = {-0.06,0,0.06,0.08,0.1,0.12}
	}
}
list.Set( "simfphys_vehicles", "avx_bmp1", V )