AddCSLuaFile()
local light_table = {
	ModernLights = false,

	L_HeadLampPos = Vector(116,33,34),
	L_HeadLampAng = Angle(0,0,0),
	R_HeadLampPos = Vector(116,-33,34),
	R_HeadLampAng = Angle(0,0,0),

	Headlight_sprites = {
		Vector(116,33,34),
		Vector(116,33,34),

		Vector(116,-33,34),
		Vector(116,-33,34)
	},
	Headlamp_sprites = {
		Vector(116,33,34),
		Vector(116,33,34),

		Vector(116,-33,34),
		Vector(116,-33,34)
	},
	Rearlight_sprites = {
		Vector( -113, 29, 27),
		Vector( -113, 29, 27),

		Vector( -113, 23, 27),
		Vector( -113, 23, 27),



		Vector( -113, -29, 27),
		Vector( -113, -29, 27),

		Vector( -113, -23, 27),
		Vector( -113, -23, 27)
	},
	Brakelight_sprites = {
		Vector( -113, 29, 27),
		Vector( -113, 29, 27),

		Vector( -113, 23, 27),
		Vector( -113, 23, 27),


		Vector( -113, -29, 27),
		Vector( -113, -29, 27),

		Vector( -113, -23, 27),
		Vector( -113, -23, 27)
	},
	Turnsignal_sprites = {
		Left = {
			Vector( 113.5, 43.6, 51 ),
			Vector( 113.8, 43.3, 51 ),
			Vector( 114, 43, 51 ),

			Vector( -113, 34.5, 27),
			Vector( -113, 34.5, 27),
		},
		Right = {
			Vector( 113.5, -43.6, 51 ),
			Vector( 113.8, -43.3, 51 ),
			Vector( 114, -43, 51 ),

			Vector( -113, -34.5, 27),
			Vector( -113, -34.5, 27),
		},
	}
}
list.Set( "simfphys_lights", "supine_hla_avia31", light_table)
local V = {
	Name = "Avia - 31",
	Model = "models/supine/vehicle/hla/avia31.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Грузовики",
	SpawnAngleOffset = 90,

	Members = {
		Mass = 2500,
		MaxHealth = 4000,
		OnSpawn = function(ent)
			ent:SetColor(Color(255,255,255))
			if ent.GhostWheels and IsValid(ent.GhostWheels[1]) and IsValid(ent.GhostWheels[2]) then
				ent.GhostWheels[1]:SetBodygroup(1,1)
				ent.GhostWheels[2]:SetBodygroup(1,1)
			end
		end,
		OnTick = function(ent)
			local current = ent:GetPoseParameter("handbrake")
			if ent:GetHandBrakeEnabled() then
				ent:SetPoseParameter("handbrake", current+0.1)
			else
				ent:SetPoseParameter("handbrake", current-0.1)
			end
		end,
		EnginePos = Vector(50,-2.5,44),

		LightsTable = "supine_hla_avia31",

		CustomWheels = true,
		CustomSuspensionTravel = 10,

		CustomWheelModel = "models/opel_blitz/opel_f_wheel.mdl",
        CustomWheelPosFL = Vector(69,41,17),
        CustomWheelPosFR = Vector(69,-41,17),
		CustomWheelPosRL = Vector(-62,39,17),
		CustomWheelPosRR = Vector(-62,-39,17),
		CustomWheelAngleOffset = Angle(0,0,0),

		CustomMassCenter = Vector(0,0,5),

		CustomSteerAngle = 35,

		SeatOffset = Vector(70,-25.5,75),
		SeatPitch = 0,
		SeatYaw = 90,

		PassengerSeats = {
			{
				pos = Vector(80,-25,40),
				ang = Angle(0,-90,0)
			}
		},

		FrontHeight = 10,
		FrontConstant = 45000,
		FrontDamping = 5000,
		FrontRelativeDamping = 3500,

		RearHeight = 10,
		RearConstant = 45000,
		RearDamping = 4500,
		RearRelativeDamping = 35000,

		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 535,

		TurnSpeed = 3,

		MaxGrip = 49,
		Efficiency = 1.1,
		GripOffset = -2,
		BrakePower = 45,

		IdleRPM = 600,
		LimitRPM = 5000,
		PeakTorque = 80,
		PowerbandStart = 1000,
		PowerbandEnd = 4500,
		Turbocharged = false,
		Supercharged = false,

		FuelFillPos = Vector(9.79,35.14,30.77),
		FuelType = FUELTYPE_DIESEL,
		FuelTankSize = 100,

		PowerBias = 1,

		EngineSoundPreset = -1,

		snd_pitch = 1,
		snd_idle = "simulated_vehicles/jeep/jeep_idle.wav",

		snd_low = "simulated_vehicles/jeep/jeep_low.wav",
		snd_low_revdown = "simulated_vehicles/jeep/jeep_revdown.wav",
		snd_low_pitch = 0.9,

		snd_mid = "simulated_vehicles/jeep/jeep_mid.wav",
		snd_mid_gearup = "simulated_vehicles/jeep/jeep_second.wav",
		snd_mid_pitch = 1,

		DifferentialGear = 0.4,
		Gears = {-0.11,0,0.06,0.15,0.22}
	}
}
list.Set("simfphys_vehicles", "supine_hla_avia31", V)
