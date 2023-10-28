-- thanks to the nice Russian guy who did this for me

local light_table = {

	L_HeadLampPos = Vector(37,108,40),
	L_HeadLampAng = Angle(15,90,0),
	R_HeadLampPos = Vector(-37,108,40),
	R_HeadLampAng = Angle(15,90,0),

	L_RearLampPos = Vector(41,-119.5,45),
	L_RearLampAng = Angle(40,-90,0),
	R_RearLampPos = Vector(-41,-119.5,45),
	R_RearLampAng = Angle(40,-90,0),
	
	Headlight_sprites = { 
		{pos = Vector(37,108,40),material = "sprites/light_ignorez",size = 50},
		
		{pos = Vector(-37,108,40),material = "sprites/light_ignorez",size = 50},
	},
	Headlamp_sprites = { 
	    {pos = Vector(37,108,40),material = "sprites/light_ignorez",size = 50},
		
		{pos = Vector(-37,108,40),material = "sprites/light_ignorez",size = 50},
	},
	
	FogLight_sprites = {

		{pos = Vector(35,107,32),material = "sprites/light_ignorez",size = 40},
		{pos = Vector(39,107,32),material = "sprites/light_ignorez",size = 40},
		--{pos = Vector(41,107,32),material = "sprites/light_ignorez",size = 30},
		
		{pos = Vector(-35,107,32),material = "sprites/light_ignorez",size = 40},
		{pos = Vector(-39,107,32),material = "sprites/light_ignorez",size = 40},
 
	},
	
	
	Rearlight_sprites = {
		{pos = Vector(41,-119.5,45),material = "sprites/light_ignorez",size = 45},
		{pos = Vector(41.5,-120,40),material = "sprites/light_ignorez",size = 45}, 
 		
		{pos = Vector(-41,-119.5,45),material = "sprites/light_ignorez",size = 45},
		{pos = Vector(-41.5,-120,40),material = "sprites/light_ignorez",size = 45}, 
	},
	Brakelight_sprites = {
	    {pos = Vector(41,-119.5,45),material = "sprites/light_ignorez",size = 45},
		{pos = Vector(41.5,-120,40),material = "sprites/light_ignorez",size = 45}, 
 		
		{pos = Vector(-41,-119.5,45),material = "sprites/light_ignorez",size = 45},
		{pos = Vector(-41.5,-120,40),material = "sprites/light_ignorez",size = 45}, 
	},
	Reverselight_sprites = {
		{pos = Vector(-41.5,-120,35),material = "sprites/light_ignorez",size = 40}, 
	    {pos = Vector(41.5,-120,35),material = "sprites/light_ignorez",size = 40}, 
	},
	

	
	
	Turnsignal_sprites = { -- поворотники
		Left = { -- левый
			
      {pos = Vector(-42,106,39.5),material = "sprites/light_ignorez",size = 35},	
	  
	  {pos = Vector(-41,-119.5,50),material = "sprites/light_ignorez",size = 45},	
		},
		Right = { -- правый	
	  {pos = Vector(42,106,39.5),material = "sprites/light_ignorez",size = 35},	
		 
	  {pos = Vector(41,-119.5,50),material = "sprites/light_ignorez",size = 45},
		},
	}
		
		
}
list.Set( "simfphys_lights", "avx_technical", light_table)

local V = {
	Name = "INS2 MLRS Technical",
	Model = "models/avx/technical_mlrs.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Артиллерия",
   SpawnOffset = Vector(0,0,60),
	SpawnAngleOffset = 90,

	Members = {
		LightsTable = "avx_technical",

		Mass = 3600,
		
		MaxHealth = 3200,
		
		IsArmored = true,
		
		EnginePos = Vector(0,73,50),
		
		OnSpawn = function(ent) ent:SetNWBool( "simfphys_NoRacingHud", true )
			ent:SetSkin(math.random(0,1))
		end,
		
		CustomWheels = true,
		CustomSuspensionTravel = 4,
		
		CustomWheelModel = "models/avx/technical_wheel.mdl",
		CustomWheelPosFL = Vector(-34, 76,16),
		CustomWheelPosFR = Vector(34, 76,16),
		CustomWheelPosRL = Vector(-34, -63,16),
		CustomWheelPosRR = Vector(34, -63,16),
		CustomWheelAngleOffset = Angle(0,90,0),
		
		CustomMassCenter = Vector(0,0,0),
		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(-2,-16,64),
		SeatPitch = 0,
		SeatYaw = 0,
		
		FrontWheelRadius = 18,
		RearWheelRadius = 18,
		
		PassengerSeats = {
			{
				pos = Vector(18,8,32),
				ang = Angle(0,0,0)
			},
		},
		
		FrontHeight = 15,
		FrontConstant = 50000,
		FrontDamping = 15000,
		FrontRelativeDamping = 5000,
		
		RearHeight = 15,
		RearConstant = 50000,
		RearDamping = 15000,
		RearRelativeDamping = 5000,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 40,
		
		MaxGrip = 90,
		Efficiency = 1.25,
		GripOffset = -14,
		BrakePower = 120,
		BulletProofTires = false,
		
		IdleRPM = 900,
		LimitRPM = 5500,
		PeakTorque = 220,
		PowerbandStart = 1000,
		PowerbandEnd = 4500,
		Turbocharged = true,
		Supercharged = false,
		
		FuelFillPos = Vector(-61.34,49.71,15.98),
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
		Gears = {-0.09,0,0.09,0.18,0.28,0.35}
	}
}
list.Set( "simfphys_vehicles", "avx_technical_mlrs", V )

local V2 = {
	Name = "INS2 Pickup",
	Model = "models/avx/technical_unarmed.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Автомобили",
   SpawnOffset = Vector(0,0,60),
	SpawnAngleOffset = 90,

   Members = V.Members,
}

list.Set( "simfphys_vehicles", "avx_technical_unarmed", V2 )

if file.Exists("materials/models/vehicles/ins2_humvee/humvee.vmt", "GAME") then

local V3 = {
	Name = "INS2 HMG Technical",
	Model = "models/avx/technical_hmg.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Arctic's INS2 Vehicles",
   SpawnOffset = Vector(0,0,60),
	SpawnAngleOffset = 90,

   Members = V.Members,
}

list.Set( "simfphys_vehicles", "avx_technical_hmg", V3 )

end