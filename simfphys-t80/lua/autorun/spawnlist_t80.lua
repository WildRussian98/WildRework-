
local light_table = {
	L_HeadLampPos = Vector(-64,140,53.5),Vector(-58,140,53.5),
	L_HeadLampAng = Angle(15,90,0),
	R_HeadLampPos = Vector(64,140,53.5),Vector(58,140,53.5),
	R_HeadLampAng = Angle(15,90,0),
	
	Headlight_sprites = { 
		Vector(-35,123,44),Vector(-35,123,44),
		Vector(35,123,44),Vector(35,123,44),
	},
	
}
list.Set( "simfphys_lights", "t80", light_table)

local V = {
	Name = "T80УД",
	Model = "models/simer/simer/t80.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Тяжелая бронетехника",
	SpawnOffset = Vector(0,0,30),
	SpawnAngleOffset = 90,

	Members = {
		Mass = 8000,
		AirFriction = 0,
		Inertia = Vector(10000,30000,50000),
		
		LightsTable = "t80",
		
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
					ent.Gib:SetPoseParameter("cannon_aim_pitch", -pitch )
				end
			end,
		
		MaxHealth = 13000,
		
		IsArmored = true,
		
		NoWheelGibs = true,
		
		FirstPersonViewPos = Vector(0,-50,50),
		
		FrontWheelRadius = 29,
		RearWheelRadius = 29,
		
		EnginePos = Vector(0,-125.72,69.45),
		
		CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		CustomWheelModel = "models/props_c17/canisterchunk01g.mdl",
		--CustomWheelModel = "models/props_vehicles/apc_tire001.mdl",
		
		CustomWheelPosFL = Vector(-65,112,32),
		CustomWheelPosFR = Vector(65,112,32),
		CustomWheelPosML = Vector(-65,0,32),
		CustomWheelPosMR = Vector(65,0,32),
		CustomWheelPosRL = Vector(-65,-100,32),
		CustomWheelPosRR = Vector(65,-100,32),
		CustomWheelAngleOffset = Angle(0,0,90),
		
		CustomMassCenter = Vector(0,0,8),
		
		CustomSteerAngle = 60,
		
		SeatOffset = Vector(30,0,39),
		SeatPitch = -15,
		SeatYaw = 0,
		
		ModelInfo = {
			WheelColor = Color(0,0,0,0),
		},
			
		ExhaustPositions = {
			{
				pos = Vector(-0,-165,46),
				ang = Angle(90,-90,0)
			},
			{
				pos = Vector(0,-165,46),
				ang = Angle(90,-90,0)
			},
			{
				pos = Vector(-10,-165,46),
				ang = Angle(90,-90,0)
			},
			{
				pos = Vector(10,-165,46),
				ang = Angle(90,-90,0)
			},
			{
				pos = Vector(-20,-165,46),
				ang = Angle(90,-90,0)
			},
			{
				pos = Vector(20,-165,46),
				ang = Angle(90,-90,0)
			},
			{
				pos = Vector(-30,-165,46),
				ang = Angle(90,-90,0)
			},
			{
				pos = Vector(30,-165,46),
				ang = Angle(90,-90,0)
			},
		},

		
		PassengerSeats = {
			{
				pos = Vector(24,-24,52),
				ang = Angle(0,0,0)
			},
		},
		
		FrontHeight = 20,
		FrontConstant = 50000,
		FrontDamping = 8000,
		FrontRelativeDamping = 40000,

		RearHeight = 20,
		RearConstant = 50000,
		RearDamping = 8000,
		RearRelativeDamping = 40000,

		FastSteeringAngle = 20,
		SteeringFadeFastSpeed = 400,
		
		TurnSpeed = 4,
		
		MaxGrip = 3000,
		Efficiency = 1,
		GripOffset = -500,
		BrakePower = 450,
		BulletProofTires = true,
		
		IdleRPM = 600,
		LimitRPM = 5600,
		PeakTorque = 200,
		PowerbandStart = 600,
		PowerbandEnd = 5600,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = true,
		
		FuelFillPos = Vector(65,-146,71),
		FuelType = FUELTYPE_DIESEL,
		FuelTankSize = 250,
		
		PowerBias = -0.3,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/abrams/abrams_low.ogg",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "",
		Sound_MidPitch = 1.5,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 10,
		Sound_MidFadeOutRate = 1,
		
		Sound_High = "simulated_vehicles/abrams/abrams_hight.wav",
		Sound_HighPitch = 1.5,
		Sound_HighVolume = 0.7,
		Sound_HighFadeInRPMpercent = 5,
		Sound_HighFadeInRate = 0.2,
		
		Sound_Throttle = "",
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "common/null.wav",
		ForceTransmission = 1,
		
		DifferentialGear = 0.4,
		Gears = {-0.03,0,0.08}
	}
}
list.Set( "simfphys_vehicles", "t80", V )
