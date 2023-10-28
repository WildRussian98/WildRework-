local light_table = {
	ModernLights = false, -- грубо говоря, ксенон или старые фары. True - ксенон, false - старые
	L_HeadLampPos = Vector(-160.6,-41,15.0), -- рассположение обычных фар (левых - L)
	L_HeadLampAng = Angle(180,0,0), -- угол поворота фар

	R_HeadLampPos = Vector(-160.6,41,15.0), -- рассположение обычных фар (правых - R)
	R_HeadLampAng = Angle(180,0,0), -- угол поворота фар

	L_RearLampPos = Vector(157,-44.5,-0.4), -- расположение задних фар
	L_RearLampAng = Angle(180,0,0), -- угол поворота фар

	R_RearLampPos = Vector(157,44.5,-0.4), -- расположение задних фар
	R_RearLampAng = Angle(180,0,0), -- угол поворота фар
	
		Headlight_sprites = { 

		Vector(-160.6,41,15.0),
		
		Vector(-160.6,-41,16.0),
		
		Vector(-160.6,41,15.0),
		
		Vector(-160.6,-41,15.0),
		
		Vector(-160.6,41,16.0),
		
		Vector(-160.6,-41,16.0),
		
		

	
	},

	Headlamp_sprites = { 
	
			Vector(-160.6,41,15.0),
		
		Vector(-160.6,-41,16.0),
		
		Vector(-160.6,41,15.0),
		
		Vector(-160.6,-41,15.0),
		
		Vector(-160.6,41,16.0),
		
		Vector(-160.6,-41,16.0),
		
				Vector(-100.6,-52,46.0),
		Vector(-100.6,-52,46.0),
		Vector(-100.6,-52,47.0),
		Vector(-100.6,-52,47.0),
	
	},
	
	Rearlight_sprites = {
		
		Vector(157,44.0,-0.4),
		
		Vector(157,-44,-0.4),
		
		Vector(157,44,-0.4),
		
		Vector(157,-44,-0.4),
		
		Vector(157,44,-0.4),
		
		Vector(157,-44,-0.4),

	},

	Brakelight_sprites = {
	
				Vector(157,44.0,-0.4),
		
		Vector(157,-44,-0.4),
		
		Vector(157,44,-0.4),
		
		Vector(157,-44,-0.4),
		
		Vector(157,44,-0.4),
		
		Vector(157,-44,-0.4),


	},
	
	DelayOn = 0.3,
	DelayOff = 0,
}
list.Set( "simfphys_lights", "sanchezGrad", light_table) -- здесь тебе нужно изменить "test" на любое другое название, например "myfirstsimfcar"


local V = {
	Name = "БМ-21 Град",
	Model = "models/grad_ural_armed.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Артиллерия",
	SpawnOffset = Vector(0 ,0,40),

	Members = {
		Mass = 5500,
		MaxHealth = 5100,
		
		LightsTable = "sanchezGrad", -- название light_table
		
		IsArmored = true,
	    FrontWheelRadius = 29,--радиус переднего колеса
		RearWheelRadius = 29,--радиус заднего колеса
		
	    CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		CustomWheelModel = "models/grad_wheel.mdl",
		CustomWheelModel_R  = "models/grad_wheel.mdl",
		CustomWheelPosFL = Vector(-125.499998474121,48.900001525879, -10),
		CustomWheelPosFR = Vector(-125.499998474121,-48.900001525879,-10),
		CustomWheelPosML = Vector(50.900003051758,48.900001525879,-10),		
		CustomWheelPosMR = Vector(50.900003051758,-48.900001525879,-10),
		CustomWheelPosRL = Vector(115.900003051758,48.900001525879,-10),		
		CustomWheelPosRR = Vector(115.900003051758,-48.900001525879,-10),
		CustomWheelAngleOffset = Angle(0,90,0),

		
		CustomMassCenter = Vector(0,0,3.5),
		EnginePos = Vector(-120,0,4),
		
		
		CustomSteerAngle = 35,
		CustomWheelCamber = 0,
		
		SeatOffset = Vector(50,-25,56),
		SeatPitch = 0,
		SeatYaw = -90,

		
		PassengerSeats = {
						{
				pos = Vector(-50,25,25),
				ang = Angle(0,90,0) -- Vector(ширина, длина, высота),
			},
		},
		
			ExhaustPositions = {
		},
		
		FrontHeight = 15,
		FrontConstant = 100000,
		FrontDamping = 12000,
		FrontRelativeDamping = 2000,
		
		RearHeight = 15,
		RearConstant = 100000,
		RearDamping = 12000,
		RearRelativeDamping = 2000,
		
		FastSteeringAngle = 8,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 6,
		
		MaxGrip = 120,
		Efficiency = 0.7,
		GripOffset = -0,
		BrakePower = 65,

		IdleRPM = 700,
		LimitRPM = 4000,
		PeakTorque = 200,
		PowerbandStart = 700,
		PowerbandEnd = 3600,
		Turbocharged = false,
		Supercharged = false,
		
		
		FuelFillPos = Vector(-20,-65,10),
        FuelType = FUELTYPE_DIESEL,
		FuelTankSize = 80,

		
		PowerBias = 0,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "vehicles/crane/crane_startengine1.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/alfaromeo/alfaromeo_low.wav",
		Sound_MidPitch = 0.5,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 100,
		Sound_MidFadeOutRate = 1,
		
		Sound_High = "",
		
		Sound_Throttle = "simulated_vehicles/alfaromeo/alfaromeo_mid.wav",
		
		snd_horn = "simulated_vehicles/horn_2.wav",
		
		DifferentialGear = 0.3,
		Gears = {-0.16,0,0.15,0.2,0.25,0.32}
	}
}
list.Set( "simfphys_vehicles", "simphys_ural_grad", V )
