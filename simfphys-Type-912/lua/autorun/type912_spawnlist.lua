
local light_table = {
	L_HeadLampPos = Vector(-50,140,53.5),Vector(-50,140,53.5),
	L_HeadLampAng = Angle(15,90,0),
	R_HeadLampPos = Vector(50,140,53.5),Vector(50,140,53.5),
	R_HeadLampAng = Angle(15,90,0),
	
	Headlight_sprites = { 
		Vector(-47,121,56),Vector(-54,121,56),
		Vector(47,121,56),Vector(54,121,56),
	},
	Rearlight_sprites = {
		Vector(-48,-128,64),
		Vector(48,-128,64),
	},
	Brakelight_sprites = {
		Vector(-48,-128,64),Vector(-48,-128,64),
		Vector(48,-128,64),Vector(48,-128,64),
	},
	
}
list.Set( "simfphys_lights", "type912", light_table)

local V = {
	Name = "Type-912 Quad 50",
	Model = "models/crysis/type912/antiair.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "ЗСУ",
	SpawnOffset = Vector(0,0,30),
	SpawnAngleOffset = 90,

	Members = {
		Mass = 8000,
		AirFriction = 0,
		Inertia = Vector(10000,30000,50000),
		
		LightsTable = "type912",
		
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
		
		MaxHealth = 9000,
		
		IsArmored = true,
		
		NoWheelGibs = true,
		
		FirstPersonViewPos = Vector(0,-50,50),
		
		FrontWheelRadius = 29,
		RearWheelRadius = 29,
		
		EnginePos = Vector(0,-115.72,69.45),
		
		CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		CustomWheelModel = "models/props_c17/canisterchunk01g.mdl",
		
		CustomWheelPosFL = Vector(-55,85,32),
		CustomWheelPosFR = Vector(55,85,32),
		CustomWheelPosML = Vector(-55,0,32),
		CustomWheelPosMR = Vector(55,0,32),
		CustomWheelPosRL = Vector(-55,-75,32),
		CustomWheelPosRR = Vector(55,-75,32),
		CustomWheelAngleOffset = Angle(0,0,90),
		
		CustomMassCenter = Vector(0,0,8),
		
		CustomSteerAngle = 60,
		
		SeatOffset = Vector(78,-15,29),
		SeatPitch = -15,
		SeatYaw = 0,
		
		ModelInfo = {
			WheelColor = Color(0,0,0,0),
		},
			
		ExhaustPositions = {
			{
				pos = Vector(43,-133,46),
				ang = Angle(180,0,0)
			},
			{
				pos = Vector(43,-133,46),
				ang = Angle(180,0,0)
			},
			{
				pos = Vector(43,-133,46),
				ang = Angle(180,0,0)
			},
			{
				pos = Vector(37,-133,46),
				ang = Angle(180,0,0)
			},
			{
				pos = Vector(37,-133,46),
				ang = Angle(180,0,0)
			},
			{
				pos = Vector(37,-133,46),
				ang = Angle(180,0,0)
			},
		},

		
		PassengerSeats = {
			{
				pos = Vector(0,0,40),
				ang = Angle(0,0,0)
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

		FastSteeringAngle = 20,
		SteeringFadeFastSpeed = 400,
		
		TurnSpeed = 4,
		
		MaxGrip = 800,
		Efficiency = 1,
		GripOffset = -300,
		BrakePower = 100,
		BulletProofTires = true,
		
		IdleRPM = 700,
		LimitRPM = 3500,
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
		
		DifferentialGear = 0.4,
		Gears = {-0.03,0,0.04,0.06,0.07}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_anti_air", V )
