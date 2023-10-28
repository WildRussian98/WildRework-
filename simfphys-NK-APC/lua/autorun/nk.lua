
local light_table = {
	L_HeadLampPos = Vector(-32.85,147.6,45.07),
	L_HeadLampAng = Angle(15,90,0),
	R_HeadLampPos = Vector(32.85,147.6,45.07),
	R_HeadLampAng = Angle(15,90,0),
	
	Headlight_sprites = { 
		Vector(-38,134,49.5),
		Vector(38,134,49.5)
	},
	Rearlight_sprites = {
		Vector(-41,-132,38.5),
		Vector(41,-132,38.5)
	},
	Brakelight_sprites = {
		Vector(-41,-132,38.5),Vector(-41,-132,38.5),
		Vector(41,-132,38.5),Vector(41,-132,38.5)
	},
	
}
list.Set( "simfphys_lights", "NK", light_table)

local V = {
	Name = "APC (KPA)",
	Model = "models/crysis/kpa_apc/kndr_apc.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Средняя бронетехника",
	SpawnOffset = Vector(0,0,30),
	SpawnAngleOffset = 90,

	Members = {
		Mass = 8000,
		AirFriction = 0,
		Inertia = Vector(10000,30000,50000),
		
		LightsTable = "NK",
		
		OnSpawn = 
			function(ent) 
				ent:SetNWBool( "simfphys_NoRacingHud", true )
				ent:SetNWBool( "simfphys_NoHud", false ) 
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
					ent.Gib:SetPoseParameter("cannon_aim_pitch", pitch )
				end
			end,
		
		MaxHealth = 8500,
		
		IsArmored = true,
		
		NoWheelGibs = true,
		
		FirstPersonViewPos = Vector(0,-50,50),
		
		FrontWheelRadius = 29,
		RearWheelRadius = 29,
		
		EnginePos = Vector(20,65,69.45),
		
		CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		CustomWheelModel = "models/props_c17/canisterchunk01g.mdl",
		
		CustomWheelPosFL = Vector(-48,80,16),
		CustomWheelPosFR = Vector(48,80,16),
		CustomWheelPosML = Vector(-48,0,16),
		CustomWheelPosMR = Vector(48,0,16),
		CustomWheelPosRL = Vector(-48,-80,16),
		CustomWheelPosRR = Vector(48,-80,16),
		CustomWheelAngleOffset = Angle(0,0,0),
		
		CustomMassCenter = Vector(0,0,5),
		
		CustomSteerAngle = 30,
		
		SeatOffset = Vector(60,1,34),
		SeatPitch = -15,
		SeatYaw = 0,
		
		ModelInfo = {
			WheelColor = Color(0,0,0,0),
		},

		
		PassengerSeats = {
			{
				pos = Vector(0,-10,26),
				ang = Angle(0,0,0)
			},
-------------------------------------------	
			{
				pos = Vector(25,-50,23),
				ang = Angle(0,90,0)
			},
			{
				pos = Vector(-25,-50,23),
				ang = Angle(0,-90,0)
			},
-------------------------------------------			
			{
				pos = Vector(25,-78,23),
				ang = Angle(0,90,0)
			},
			{
				pos = Vector(-25,-78,23),
				ang = Angle(0,-90,0)
			},
------------------------------------------			
			{
				pos = Vector(25,-106,23),
				ang = Angle(0,90,0)
			},
			{
				pos = Vector(-25,-106,23),
				ang = Angle(0,-90,0)
			},
		},
		
		FrontHeight = 15,
		FrontConstant = 50000,
		FrontDamping = 8000,
		FrontRelativeDamping = 40000,

		RearHeight = 15,
		RearConstant = 50000,
		RearDamping = 8000,
		RearRelativeDamping = 40000,

		FastSteeringAngle = 18,
		SteeringFadeFastSpeed = 400,
		
		TurnSpeed = 4,
		
		MaxGrip = 800,
		Efficiency = 1,
		GripOffset = -300,
		BrakePower = 100,
		BulletProofTires = true,
		
		IdleRPM = 700,
		LimitRPM = 5000,
		PeakTorque = 140,
		PowerbandStart = 700,
		PowerbandEnd = 4800,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = true,
		
		FuelFillPos = Vector(-40,50,50),
		FuelType = FUELTYPE_DIESEL,
		FuelTankSize = 250,
		
		PowerBias = 0,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/t90ms/idle.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/t90ms/low.wav",
		Sound_MidPitch = 1.3,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 60,
		Sound_MidFadeOutRate = 0.4,
		
		Sound_High = "simulated_vehicles/t90ms/high.wav",
		Sound_HighPitch = 1.2,
		Sound_HighVolume = 1,
		Sound_HighFadeInRPMpercent = 45,
		Sound_HighFadeInRate = 0.2,
		
		Sound_Throttle = "",
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "common/null.wav",
		ForceTransmission = 1,
		
		DifferentialGear = 0.3,
		Gears = {-0.1,0,0.08,0.09,0.11,0.14,0.17}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_tank_kpa_apc", V )
