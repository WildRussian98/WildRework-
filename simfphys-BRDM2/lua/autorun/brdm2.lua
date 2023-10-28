local light_table = {
	ModernLights = false, -- грубо говоря, ксенон или старые фары. True - ксенон, false - старые
	--[[L_HeadLampPos = Vector(134,-34,21), -- рассположение обычных фар (левых - L)
	L_HeadLampAng = Angle(0,0,0), -- угол поворота фар

	R_HeadLampPos = Vector(134,34,21), -- рассположение обычных фар (правых - R)
	R_HeadLampAng = Angle(0,0,0), -- угол поворота фар]]

	Headlight_sprites = { -- Обычные фары
	{pos =  Vector(134,-34,21),size = 35},
	{pos =  Vector(134,-34,21),size = 35},

	{pos =  Vector(134,34,21),size = 35},
	{pos =  Vector(134,34,21),size = 35},
	},
	Headlamp_sprites = { -- дальние
	{pos =  Vector(134,-34,21),size = 40},
	{pos =  Vector(134,-34,21),size = 40},

	{pos =  Vector(134,34,21),size = 40},
	{pos =  Vector(134,34,21),size = 40},
	
	{pos =  Vector(136,-47,19),size = 60},
	{pos =  Vector(136,-47,19),size = 50},

	{pos =  Vector(136,47,19),size = 60},
	{pos =  Vector(136,47,19),size = 50},
	
	{pos =  Vector(136,40,16),size = 40},
	{pos =  Vector(136,-40,16),size = 40},
	
	--{pos =  Vector(88,-16,53),size = 60},
    --{pos =  Vector(88,-18,53),size = 60},
	},
		FogLight_sprites = {
	{pos =  Vector(88,-16,53),size = 60},
    {pos =  Vector(88,-18,53),size = 60},

	},
	Rearlight_sprites = { -- задние фары
		{pos = Vector(-143,-50.5,22.5),size = 25},
		
	    {pos = Vector(-143,50.5,22.5),size = 25},
	},
	Brakelight_sprites = { -- тормозные огни
		{pos = Vector(-143,-50.5,22.5),size = 25},
		
	    {pos = Vector(-143,50.5,22.5),size = 25},
	},


SubMaterials = {
		off = {
			Base = {
				[13] = ""
			},
		},
		on_lowbeam = {
			Base = {
				[13] = "dk_cars/rc_toys/bandit/lights/lights_low_beam"
			},
		},
		on_highbeam = {
			Base = {
				[13] = "dk_cars/rc_toys/bandit/lights/lights_low_beam"
			},
		},
	}
}
list.Set( "simfphys_lights", "simphys_BRDM2", light_table) -- здесь тебе нужно изменить "test" на любое другое название, например "myfirstsimfcar"


local V = {
	Name = "БРДМ-2",
	Model = "models/vehicles/brdm2/BRDM2.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Легкая бронетехника",

	SpawnOffset = Vector(0,0,60),
	SpawnAngleOffset = 90,

	Members = {
		Mass = 3000,
		MaxHealth = 5200, 
		
		 OnSpawn = function(ent)
			ent:SetSkin(math.random(0,1))

        end,
		
		
        OnTick = function(ent) --ent:SetPoseParameter("vehicle_fuel", ent:GetFuel() / ent:GetMaxFuel()) 
        	--ent:SetNWInt("dangerkiddy_max_value", 53)
            local throttle = ent:GetThrottle()
            local gear = ent:GetGear()
            if gear == 1 then throttle = throttle*(-1) end

            if not ent:EngineActive() then return end
            if throttle > 0 then 
                ent:SetNWInt("_spinnet", ent:GetNWInt("_spinnet")+6)
                ent:SetPoseParameter("vehicle_spinner", ent:GetNWInt("_spinnet"))
            elseif throttle < 0 then 
                ent:SetNWInt("_spinnet", ent:GetNWInt("_spinnet")-6)
                ent:SetPoseParameter("vehicle_spinner", ent:GetNWInt("_spinnet"))
            end
        end,
		
		LightsTable = "simphys_BRDM2",
		
		FirstPersonViewPos = Vector(0,-43,7), -- Vector(-30,0,70),
		
		IsArmored = true,
		NoWheelGibs = true,
	    FrontWheelRadius = 30,--радиус переднего колеса
		RearWheelRadius = 30,--радиус заднего колеса
		
	    CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		CustomWheelModel = "models/vehicles/brdm2/BRDM2_wheel.mdl",
		CustomWheelPosFL = Vector(76.5,50.9,-32),
		CustomWheelPosFR = Vector(76.5,-50.9,-32),
		CustomWheelPosRL = Vector(-85.0,50.9,-32),	
		CustomWheelPosRR = Vector(-85.0,-50.9,-32),
		CustomWheelAngleOffset = Angle(0,-180,0),

		
		CustomMassCenter = Vector(0,0,3.5),
		EnginePos = Vector(-75,0,47),
		
		CustomSteerAngle = 25, -- 25
		CustomWheelCamber = 0,
		
		SeatOffset = Vector(65,-16,25),
		SeatPitch = 0,
		SeatYaw = 90,
		
		PassengerSeats = {
			{
                pos = Vector(72,-20,-5),
                ang = Angle(0,-90,0),
        	},
			{
                pos = Vector(50,-20,-5),
                ang = Angle(0,-90,0),
        	},
			{
                pos = Vector(50,20,-5),
                ang = Angle(0,-90,0),
        	},
						{
                pos = Vector(20,-20,-5),
                ang = Angle(0,-90,0),
        	},
			{
                pos = Vector(20,20,-5),
                ang = Angle(0,-90,0),
        	},
		},
		
		FrontHeight = 8, -- высота передней подвески
		FrontConstant = 50000,
		FrontDamping = 4000,
		FrontRelativeDamping = 4000,

		RearHeight = 8, -- высота задней подвески
		RearConstant = 50000,
		RearDamping = 4000,
		RearRelativeDamping = 4000,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 1, -- 2
		
		MaxGrip = 70,  -- 100
		Efficiency = 1.25,
		GripOffset = 0, -- -14
		BrakePower = 20,
		BulletProofTires = true,
		
		IdleRPM = 228,
		LimitRPM = 1875,
		PeakTorque = 100,
		PowerbandStart = 750,
		PowerbandEnd = 1750,
		Turbocharged = false,
		Supercharged = false,
		
		FuelFillPos = Vector(-61.34,49.71,15.98),
		--FuelType = FUELTYPE_DIESEL,
		FuelTankSize = 280, -- 120
		
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
list.Set( "simfphys_vehicles", "simphys_BRDM2", V )




