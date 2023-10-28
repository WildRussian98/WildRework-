
local light_table = {
	L_HeadLampPos = Vector(-32.85,147.6,45.07),
	L_HeadLampAng = Angle(15,90,0),
	R_HeadLampPos = Vector(32.85,147.6,45.07),
	R_HeadLampAng = Angle(15,90,0),
	
	Headlight_sprites = { 
		Vector(-54.5,130,52.07),
		Vector(54.5,130,52.07)
	},
	Rearlight_sprites = {
		Vector(-46.5,-126,74),
		Vector(46.5,-126,74)
	},
	Brakelight_sprites = {
		Vector(-46.5,-126,74),
		Vector(46.5,-126,74)
	},
	
}
list.Set( "simfphys_lights", "m142a1_thor", light_table)

local V = {
	Name = "M142A1 THOR",
	Model = "models/crysis/m142a1/m142a1_thor.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Тяжелая бронетехника",
	SpawnOffset = Vector(0,0,30),
	SpawnAngleOffset = 90,

	Members = {
		Mass = 8000,
		AirFriction = 0,
		Inertia = Vector(10000,30000,50000),
		
		LightsTable = "m142a1_thor",
		
		OnSpawn = 
			function(ent) 
				ent:SetSkin(math.random(0,1))
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
		
		MaxHealth = 10000,
		
		IsArmored = true,
		
		NoWheelGibs = true,
		
		FirstPersonViewPos = Vector(0,-50,50),
		
		FrontWheelRadius = 29,
		RearWheelRadius = 29,
		
		EnginePos = Vector(0,60,69.45),
		
		CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		CustomWheelModel = "models/props_c17/canisterchunk01g.mdl",
		--CustomWheelModel = "models/props_vehicles/apc_tire001.mdl",
		
		CustomWheelPosFL = Vector(-55,98,32),
		CustomWheelPosFR = Vector(55,98,32),
		CustomWheelPosML = Vector(-55,8,32),
		CustomWheelPosMR = Vector(55,8,32),
		CustomWheelPosRL = Vector(-55,-86,32),
		CustomWheelPosRR = Vector(55,-86,32),
		CustomWheelAngleOffset = Angle(0,0,0),
		
		CustomMassCenter = Vector(0,0,15),
		
		CustomSteerAngle = 60,
		
		SeatOffset = Vector(60,1,34),
		SeatPitch = -15,
		SeatYaw = 0,
		
		ModelInfo = {
			WheelColor = Color(0,0,0,0),
		},

		
		PassengerSeats = {
			{
				pos = Vector(20,30,31),
				ang = Angle(0,0,0)
			},
-------------------------------------------	
			{
				pos = Vector(38,-39,29),
				ang = Angle(0,90,0)
			},
			{
				pos = Vector(-38,-39,29),
				ang = Angle(0,-90,0)
			},
-------------------------------------------			
			{
				pos = Vector(38,-70,29),
				ang = Angle(0,90,0)
			},
			{
				pos = Vector(-38,-70,29),
				ang = Angle(0,-90,0)
			},
------------------------------------------			
			{
				pos = Vector(38,-96,29),
				ang = Angle(0,90,0)
			},
			{
				pos = Vector(-38,-96,29),
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

		FastSteeringAngle = 20,
		SteeringFadeFastSpeed = 400,
		
		TurnSpeed = 4,
		
		MaxGrip = 800,
		Efficiency = 1,
		GripOffset = -300,
		BrakePower = 100,
		BulletProofTires = true,
		
		IdleRPM = 700,
		LimitRPM = 3000,
		PeakTorque = 130,
		PowerbandStart = 700,
		PowerbandEnd = 4800,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = true,
		
		FuelFillPos = Vector(30,60,69.45),
		FuelType = FUELTYPE_DIESEL,
		FuelTankSize = 250,
		
		PowerBias = -0.3,
		
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
		Gears = {-0.082,0,0.08,0.1,0.12,0.14}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_m142a1", V )
