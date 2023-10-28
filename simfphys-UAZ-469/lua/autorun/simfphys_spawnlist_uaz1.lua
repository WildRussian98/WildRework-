local Category = "Автомобили"

local V = {
	Name = "УАЗ-469",
	Model = "models/uaz_469.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = Category,
	SpawnOffset = Vector(0,0,65),

	Members = {
		Mass = 2500,
		MaxHealth = 3400,
		Vector(0,0,0),
		LightsTable = "UAZ",
		CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		OnSpawn = 
		function(ent) 
			ent:SetSkin(math.random(0,4))
		end,
		
		FrontWheelRadius = 15,		-- if you set CustomWheels to true then the script will figure the radius out by itself using the CustomWheelModel
		RearWheelRadius = 15,
		
		CustomWheelModel = "models/uaz_469_wheel.mdl",
		CustomWheelPosFL = Vector(62,25,10),
		CustomWheelPosFR = Vector(62,-25,10),
		CustomWheelPosRL = Vector(-46,25,10),	
		CustomWheelPosRR = Vector(-46,-25,10),
		CustomWheelAngleOffset = Angle(90,0,0),
		
		CustomMassCenter = Vector(1,0,12),
		
		CustomSteerAngle = 25,
		
		SeatOffset = Vector(7,-16,62),
		SeatPitch = 0,
		SeatYaw = 90,
		
		PassengerSeats = {
			{
				pos = Vector(8,-16,28),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(-22,-16,31),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(-22,0,31),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(-22,16,31),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(-57,15,31),
				ang = Angle(0,180,0)
			},
			{
				pos = Vector(-57,-15,31),
				ang = Angle(0,0,0)
			}
		},	
				
		ExhaustPositions = {
			{
				pos = Vector(-75,-12,20),
				ang = Angle(90,180,0)
			}
		},
		
		OnSpawn = function(ent)
		ent:SetSkin(math.random(0,5))
		end,
		
		FrontHeight = 1,
		FrontConstant = 90000,
		FrontDamping = 7000,
		FrontRelativeDamping = 4000,
		
		RearHeight = 1,
		RearConstant = 90000,
		RearDamping = 7000,
		RearRelativeDamping = 4000,
		
		FastSteeringAngle = 20,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 4,
		
		MaxGrip = 110,
		Efficiency = 1.0,
		GripOffset = -2,
		BrakePower = 40,
		
		IdleRPM = 950,
		LimitRPM = 6000,
		PeakTorque = 110,
		PowerbandStart = 1800,
		PowerbandEnd = 5800,
		Turbocharged = false,
		IsArmored = false,
		BulletProofTires = false,
		
		PowerBias = 0,
		
		EngineSoundPreset = -1,
		
		EngineSoundPreset = -1,
		
		snd_pitch = 1,
		snd_idle = "simulated_vehicles/jeep/jeep_idle.wav",
		
		snd_low = "simulated_vehicles/jeep/jeep_low.wav",
		snd_low_revdown = "simulated_vehicles/jeep/jeep_revdown.wav",
		snd_low_pitch = 0.9,
		
		snd_mid = "simulated_vehicles/jeep/jeep_mid.wav",
		snd_mid_gearup = "simulated_vehicles/jeep/jeep_second.wav", 
		snd_mid_pitch = 1,
		
		DifferentialGear = 0.45,
		Gears = {-0.08,0,0.08,0.15,0.22,0.28}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_UAZ1", V )	
