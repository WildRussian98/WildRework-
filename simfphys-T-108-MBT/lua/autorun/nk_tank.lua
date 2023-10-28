
local light_table = {
	L_HeadLampPos = Vector(-64,140,53.5),Vector(-58,140,53.5),
	L_HeadLampAng = Angle(15,90,0),
	R_HeadLampPos = Vector(64,140,53.5),Vector(58,140,53.5),
	R_HeadLampAng = Angle(15,90,0),
	
	Headlight_sprites = { 
		Vector(-36.5,114,59),Vector(-36.5,114,59),
		Vector(36.5,114,59),Vector(36.5,114,59),
	},
	Rearlight_sprites = {
		Vector(-62,-148,61.5),
		Vector(63,-148,61.5),
	},
	Brakelight_sprites = {
		Vector(-62,-148,61.5),Vector(-62,-148,61.5),
		Vector(63,-148,61.5),Vector(63,-148,61.5),
	},
	
}
list.Set( "simfphys_lights", "t108", light_table)

local V = {
	Name = "T-108",
	Model = "models/crysis/nk_tank/nk_tank.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Тяжелая бронетехника",
	SpawnOffset = Vector(0,0,30),
	SpawnAngleOffset = 90,

	Members = {
		Mass = 8000,
		AirFriction = 0,
		Inertia = Vector(10000,30000,50000),
		
		LightsTable = "t108",
		
		OnSpawn = 
			function(ent) 
				ent:SetNWBool( "simfphys_NoRacingHud", true )
				ent:SetNWBool( "simfphys_NoHud", false ) 
				ent:SetSkin(math.random(0,1))	
			end,

		ApplyDamage = function( ent, damage, type ) 
			simfphys.TankApplyDamage(ent, damage, type)
		end,
		
		OnDestroyed =
			function(ent)
				if IsValid( ent.Gib ) then
					ent.Gib:PhysicsInit(6)
					ent.Gib:SetCollisionGroup(0)
					local yaw = ent.sm_pp_yaw or 0
					local pitch = ent.sm_pp_pitch or 0
					ent.Gib:SetPoseParameter("cannon_aim_yaw", yaw )
					ent.Gib:SetPoseParameter("cannon_aim_pitch", -pitch )
				end
			end,
		
		MaxHealth = 12500,
		
		IsArmored = true,
		
		NoWheelGibs = true,
		
		FirstPersonViewPos = Vector(0,-50,50),
		
		FrontWheelRadius = 29,
		RearWheelRadius = 29,
		
		EnginePos = Vector(0,-125.72,69.45),
		
		CustomWheels = true,
		CustomSuspensionTravel = 5,
		
		CustomWheelModel = "models/props_c17/canisterchunk01g.mdl",
		--CustomWheelModel = "models/props_vehicles/apc_tire001.mdl",
		
		CustomWheelPosFL = Vector(-60,90,32),
		CustomWheelPosFR = Vector(60,90,32),
		CustomWheelPosML = Vector(-60,0,32),
		CustomWheelPosMR = Vector(60,0,32),
		CustomWheelPosRL = Vector(-60,-90,32),
		CustomWheelPosRR = Vector(60,-90,32),
		CustomWheelAngleOffset = Angle(0,0,90),
		
		CustomMassCenter = Vector(0,0,10),
		
		CustomSteerAngle = 60,
		
		SeatOffset = Vector(85,1,29),
		SeatPitch = -15,
		SeatYaw = 0,
		
		ModelInfo = {
			WheelColor = Color(0,0,0,0),
		},
			
		ExhaustPositions = {
			{
				pos = Vector(72,-115,62),
				ang = Angle(90,0,0)
			},
			{
				pos = Vector(72,-115,58),
				ang = Angle(90,0,0)
			},
			
			{
				pos = Vector(72,-110,62),
				ang = Angle(90,0,0)
			},
			{
				pos = Vector(72,-110,58),
				ang = Angle(90,0,0)
			},
			
			{
				pos = Vector(72,-105,62),
				ang = Angle(90,0,0)
			},
			{
				pos = Vector(72,-105,58),
				ang = Angle(90,0,0)
			},
			
			{
				pos = Vector(72,-100,62),
				ang = Angle(90,0,0)
			},
			{
				pos = Vector(72,-100,58),
				ang = Angle(90,0,0)
			},
			
			{
				pos = Vector(72,-95,62),
				ang = Angle(90,0,0)
			},
			{
				pos = Vector(72,-95,58),
				ang = Angle(90,0,0)
			},
			
			{
				pos = Vector(72,-90,62),
				ang = Angle(90,0,0)
			},
			{
				pos = Vector(72,-90,58),
				ang = Angle(90,0,0)
			},
			
			{
				pos = Vector(72,-85,62),
				ang = Angle(90,0,0)
			},
			{
				pos = Vector(72,-85,58),
				ang = Angle(90,0,0)
			},
		},

		
		PassengerSeats = {
			{
				pos = Vector(28,-8,83),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(-25,-5,45),
				ang = Angle(0,0,0)
			}
		},
		
		FrontHeight = 15,
		FrontConstant = 50000,
		FrontDamping = 8000,
		FrontRelativeDamping = 40000,

		RearHeight = 15,
		RearConstant = 50000,
		RearDamping = 8000,
		RearRelativeDamping = 40000,

		FastSteeringAngle = 20,
		SteeringFadeFastSpeed = 400,
		
		TurnSpeed = 4,
		
		MaxGrip = 800,
		Efficiency = 1,
		GripOffset = -300,
		BrakePower = 100,
		BulletProofTires = true,
		
		IdleRPM = 700,
		LimitRPM = 5000,
		PeakTorque = 130,
		PowerbandStart = 700,
		PowerbandEnd = 4800,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = true,
		
		FuelFillPos = Vector(65,-146,71),
		FuelType = FUELTYPE_DIESEL,
		FuelTankSize = 250,
		
		PowerBias = -0.3,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/t90ms/idle.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/t90ms/low.wav",
		Sound_MidPitch = 1.7,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 100,
		Sound_MidFadeOutRate = 1,
		
		Sound_High = "simulated_vehicles/t90ms/high.wav",
		Sound_HighPitch = 1.7,
		Sound_HighVolume = 0.7,
		Sound_HighFadeInRPMpercent = 50,
		Sound_HighFadeInRate = 0.2,
		
		Sound_Throttle = "",
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "common/null.wav",
		ForceTransmission = 1,
		
		DifferentialGear = 0.3,
		Gears = {-0.1,0,0.08,0.11,0.13,0.15}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_tank_t108", V )

local V = {
	Name = "T-108A",
	Model = "models/crysis/nk_tank/tac/tac_tank.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Артиллерия",
	SpawnOffset = Vector(0,0,30),
	SpawnAngleOffset = 90,

	Members = {
		Mass = 8000,
		AirFriction = 0,
		Inertia = Vector(10000,30000,50000),
		
		LightsTable = "t108",
		
		OnSpawn = 
			function(ent) 
				ent:SetNWBool( "simfphys_NoRacingHud", true )
				ent:SetNWBool( "simfphys_NoHud", false ) 
				ent:SetSkin(math.random(0,1))	
			end,

		ApplyDamage = function( ent, damage, type ) 
			simfphys.TankApplyDamage(ent, damage, type)
		end,
		
		OnDestroyed =
			function(ent)
				if IsValid( ent.Gib ) then
					ent.Gib:PhysicsInit(6)
					ent.Gib:SetCollisionGroup(0)
					local yaw = ent.sm_pp_yaw or 0
					local pitch = ent.sm_pp_pitch or 0
					ent.Gib:SetPoseParameter("cannon_aim_yaw", yaw )
					ent.Gib:SetPoseParameter("cannon_aim_pitch", -pitch )
				end
			end,
		
		MaxHealth = 12500,
		
		IsArmored = true,
		
		NoWheelGibs = true,
		
		FirstPersonViewPos = Vector(0,-50,50),
		
		FrontWheelRadius = 29,
		RearWheelRadius = 29,
		
		EnginePos = Vector(0,-125.72,69.45),
		
		CustomWheels = true,
		CustomSuspensionTravel = 5,
		
		CustomWheelModel = "models/props_c17/canisterchunk01g.mdl",
		--CustomWheelModel = "models/props_vehicles/apc_tire001.mdl",
		
		CustomWheelPosFL = Vector(-60,90,32),
		CustomWheelPosFR = Vector(60,90,32),
		CustomWheelPosML = Vector(-60,0,32),
		CustomWheelPosMR = Vector(60,0,32),
		CustomWheelPosRL = Vector(-60,-90,32),
		CustomWheelPosRR = Vector(60,-90,32),
		CustomWheelAngleOffset = Angle(0,0,90),
		
		CustomMassCenter = Vector(0,0,10),
		
		CustomSteerAngle = 60,
		
		SeatOffset = Vector(85,1,29),
		SeatPitch = -15,
		SeatYaw = 0,
		
		ModelInfo = {
			WheelColor = Color(0,0,0,0),
		},
			
		ExhaustPositions = {
			{
				pos = Vector(72,-115,62),
				ang = Angle(90,0,0)
			},
			{
				pos = Vector(72,-115,58),
				ang = Angle(90,0,0)
			},
			
			{
				pos = Vector(72,-110,62),
				ang = Angle(90,0,0)
			},
			{
				pos = Vector(72,-110,58),
				ang = Angle(90,0,0)
			},
			
			{
				pos = Vector(72,-105,62),
				ang = Angle(90,0,0)
			},
			{
				pos = Vector(72,-105,58),
				ang = Angle(90,0,0)
			},
			
			{
				pos = Vector(72,-100,62),
				ang = Angle(90,0,0)
			},
			{
				pos = Vector(72,-100,58),
				ang = Angle(90,0,0)
			},
			
			{
				pos = Vector(72,-95,62),
				ang = Angle(90,0,0)
			},
			{
				pos = Vector(72,-95,58),
				ang = Angle(90,0,0)
			},
			
			{
				pos = Vector(72,-90,62),
				ang = Angle(90,0,0)
			},
			{
				pos = Vector(72,-90,58),
				ang = Angle(90,0,0)
			},
			
			{
				pos = Vector(72,-85,62),
				ang = Angle(90,0,0)
			},
			{
				pos = Vector(72,-85,58),
				ang = Angle(90,0,0)
			},
		},

		
		PassengerSeats = {
			{
				pos = Vector(28,-8,83),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(-25,-5,45),
				ang = Angle(0,0,0)
			}
		},
		
		FrontHeight = 15,
		FrontConstant = 50000,
		FrontDamping = 8000,
		FrontRelativeDamping = 40000,

		RearHeight = 15,
		RearConstant = 50000,
		RearDamping = 8000,
		RearRelativeDamping = 40000,

		FastSteeringAngle = 20,
		SteeringFadeFastSpeed = 400,
		
		TurnSpeed = 4,
		
		MaxGrip = 800,
		Efficiency = 1,
		GripOffset = -300,
		BrakePower = 100,
		BulletProofTires = true,
		
		IdleRPM = 700,
		LimitRPM = 5000,
		PeakTorque = 130,
		PowerbandStart = 700,
		PowerbandEnd = 4800,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = true,
		
		FuelFillPos = Vector(65,-146,71),
		FuelType = FUELTYPE_DIESEL,
		FuelTankSize = 250,
		
		PowerBias = -0.3,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/t90ms/idle.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/t90ms/low.wav",
		Sound_MidPitch = 1.7,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 100,
		Sound_MidFadeOutRate = 1,
		
		Sound_High = "simulated_vehicles/t90ms/high.wav",
		Sound_HighPitch = 1.7,
		Sound_HighVolume = 0.7,
		Sound_HighFadeInRPMpercent = 50,
		Sound_HighFadeInRate = 0.2,
		
		Sound_Throttle = "",
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "common/null.wav",
		ForceTransmission = 1,
		
		DifferentialGear = 0.3,
		Gears = {-0.1,0,0.08,0.11,0.13,0.15}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_tank_t108_tac", V )

