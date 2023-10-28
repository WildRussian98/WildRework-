AddCSLuaFile()

local langtbl = {
	["ru"] = "К-700 ''Кировец''",
	["uk"] = "К-700 ''Кировец''",
}
local NameLang = langtbl[GetConVar("gmod_language"):GetString()] or "K-700 ''Kirovets''"

local model = "models/sim_fphys_k700/k700.mdl"


local light_table = {
	ModernLights = false, -- грубо говоря, ксенон или старые фары. True - ксенон, false - старые
	R_HeadLampPos = Vector(157.6, -46.6, 57.45), -- рассположение обычных фар (правых - R)
	R_HeadLampAng = Angle(180,180,0), -- угол поворота фар

	L_HeadLampPos = Vector(157.6, 46.6, 57.45), -- рассположение обычных фар (левых - L)
	L_HeadLampAng = Angle(180,180,0), -- угол поворота фар

	R_RearLampPos = Vector(-149,-57,83.3), -- расположение задних фар
	R_RearLampAng = Angle(0,180,0), -- угол поворота фар

	L_RearLampPos = Vector(-149,57,83.3), -- расположение задних фар
	L_RearLampAng = Angle(0,180,0), -- угол поворота фар

	Headlight_sprites = { -- Обычные фары
		{pos =  Vector(154.6, -43.9, 65.2+1),size = 40,material="sprites/light_ignorez_new"},
		{pos =  Vector(154.6, -43.9, 65.2-1),size = 40,material="sprites/light_ignorez_new"},
		
		{pos =  Vector(154.6, 1+43.9, 65.2+1),size = 40,material="sprites/light_ignorez_new"},
		{pos =  Vector(154.6, 1+43.9, 65.2-1),size = 40,material="sprites/light_ignorez_new"},
		
		{pos =  Vector(157.6, -46.6, 57.45),size = 200,material="sprites/light_ignorez_new"},
		{pos =  Vector(157.6, 1+46.6, 57.45),size = 200,material="sprites/light_ignorez_new"},
	},
	Headlamp_sprites = { -- дальние
		{pos =  Vector(157.6, -46.6, 57.45),size = 200,material="sprites/light_ignorez_new"},
		{pos =  Vector(157.6, 1+46.6, 57.45),size = 200,material="sprites/light_ignorez_new"},
	},
	FogLight_sprites = { -- противотуманки
		{pos =  Vector(-31.6, -42.66, 162.3),size = 150,material="sprites/light_ignorez_new"},
		{pos =  Vector(-31.6, -42.66, 162.3),size = 150,material="sprites/light_ignorez_new"},
		
		{pos =  Vector(-31.6, 1+42.66, 162.3),size = 150,material="sprites/light_ignorez_new"},
		{pos =  Vector(-31.6, 1+42.66, 162.3),size = 150,material="sprites/light_ignorez_new"},
		
		{pos =  Vector(-31.6, 0.5, 167.2),size = 150,material="sprites/light_ignorez_new"},
		{pos =  Vector(-31.6, 0.5, 167.2),size = 150,material="sprites/light_ignorez_new"},
	},
	Rearlight_sprites = { -- задние фары
	},
	Brakelight_sprites = { -- тормозные огни
	},
	Reverselight_sprites = { -- фары заднего хода
	},
	Turnsignal_sprites = { -- поворотники
		Right = { -- правый
			{pos =  Vector(154.6, -46, 65.2),size = 50,material="sprites/light_ignorez_new", color = Color(255,140,0)},
			{pos =  Vector(154.6, -48, 65.2),size = 50,material="sprites/light_ignorez_new", color = Color(255,140,0)},
			{pos =  Vector(154.6, -50, 65.2),size = 50,material="sprites/light_ignorez_new", color = Color(255,140,0)},
		},
		Left = { -- левый
			{pos =  Vector(154.6, 46, 65.2),size = 50,material="sprites/light_ignorez_new", color = Color(255,140,0)},
			{pos =  Vector(154.6, 48, 65.2),size = 50,material="sprites/light_ignorez_new", color = Color(255,140,0)},
			{pos =  Vector(154.6, 50, 65.2),size = 50,material="sprites/light_ignorez_new", color = Color(255,140,0)},
		},
	}
}
list.Set( "simfphys_lights", "k700", light_table) -- здесь тебе нужно изменить "test" на любое другое название, например "myfirstsimfcar"


local V = {
	Name = NameLang, -- название машины в меню
	Model = model, -- модель машины (в вкладке дополнения и проп авто)
	Category = "Грузовики", -- категория в которой будет машина
	SpawnAngleOffset = 90,
	--SpawnOffset = Vector(0,0,-45),

	Members = {
		Mass = 3000, -- масса авто
		MaxHealth = 5200,
		ModelInfo = {
			Color = Color(255, 195, 93),
			WheelColor = Color(0,0,0,0)
		},
		
		
		SpeedoMax = -1, -- какая максималка на спидометре(может работать криво)

		LightsTable = "k700", -- название light_table

		AirFriction = -300000,

		CustomMassCenter = Vector(0,0,-1), 

		SeatOffset = Vector(-10, 0, -5), -- положение водительского сидения
		SeatPitch = 5,
		FirstPersonViewPos = Vector(0,-15,7),

		PassengerSeats = { -- пассажирские места
			{
				pos = Vector(-5,-24,108),
				ang = Angle(0,-90,0) -- Vector(ширина, длина, высота),
			},
		},

		ExhaustPositions = { -- позиция выхлопа
        	{
                pos = Vector(54, 0.6, 171.5),
                ang = Angle(0,-90,0),
        	},
			{
                pos = Vector(54, 0.6, 171.5),
                ang = Angle(0,-90,0),
        	},
			{
                pos = Vector(54, 0.6, 171.5),
                ang = Angle(0,-90,0),
        	},
        },

		CustomWheels = true,
		CustomSuspensionTravel = 15, -- 10
		CustomSteerAngle = 35,
		CustomWheelModel = "models/props_vehicles/carparts_tire01a.mdl",
		CustomWheelPosRL = Vector(-112,-55,47),
		CustomWheelPosRR = Vector(-112,55,47),
		CustomWheelPosFL = Vector(47,-55,47),
		CustomWheelPosFR = Vector(47,55,47),
		CustomWheelAngleOffset = Angle(0,90,0),
		
		EnginePos = Vector(110, 0.5, 100),

		StrengthenSuspension = false, -- жесткая подвеска.

		FrontWheelRadius = 40,--радиус переднего колеса
		RearWheelRadius = 40,--радиус заднего колеса
		
		FrontHeight = 12, -- высота передней подвески
		FrontConstant = 90000,
		FrontDamping = 5000,
		FrontRelativeDamping = 8000,

		RearHeight = 12, -- высота задней подвески
		RearConstant = 90000,
		RearDamping = 5000,
		RearRelativeDamping = 8000,

		FastSteeringAngle = 20,
		SteeringFadeFastSpeed = 600,

		TurnSpeed = 2,

		MaxGrip = 50,
		Efficiency = 2,
		GripOffset = -3,
		BrakePower = 50, -- сила торможения

		IdleRPM = 350, -- мин. кол-во оборотов
		LimitRPM = 2100, -- макс. кол-во оборотов
		Revlimiter = false, -- Если true - Когда стрелка спидометра доходит до красного обозначения, она не проходит дальше, если false - это игнорируется
		PeakTorque = 100, -- крутящий момент
		PowerbandStart = 350, -- какие обороты на нейтральной передаче
		PowerbandEnd = 2000, -- ограничение по оборотам
		Turbocharged = false, -- турбо false = нет, true = да
		Supercharged = false, -- супер заряд
		Backfire = false, -- стреляющий выхлоп

		FuelFillPos = Vector(140, -32, 84), -- положение заправки
		FuelType = FUELTYPE_DIESEL, -- тип топлива
		FuelTankSize = 150, -- размер бака

		PowerBias = 0, -- привод. 1 - задний, 0 - полный, -1 - передний

		EngineSoundPreset = -1,
--
		snd_pitch = 0.8,
		snd_idle = "simulated_vehicles/tractor/car_traktor_start2.wav",

		snd_low = "simulated_vehicles/misc/m50.wav",
		snd_low_revdown = "simulated_vehicles/misc/m50.wav", -- это всё звук
		snd_low_pitch = 1.4,

		snd_mid = "simulated_vehicles/tractor/car_traktor2.wav",
		snd_mid_gearup = "simulated_vehicles/misc/v8high2.wav",
		snd_mid_geardown = "simulated_vehicles/misc/v8high2.wav",
		snd_mid_pitch = 1.4,

		snd_horn = "simulated_vehicles/horn_7.wav",

--
		DifferentialGear = 0.025,
		Gears = {-0.5, 0, 0.5, 1.0, 1.5, 2.0, 2.5} -- кол-во передач и "мощность"
	}
}

if (file.Exists( model, "GAME" )) then
	list.Set( "simfphys_vehicles", "sim_fphys_k700", V )
else
	if CLIENT then chat.AddText(Color(255,40,0), "Model ", model, " doesn't exist! Please, check requirements of this addon") end
end


if CLIENT then
	local function SetupPixVis(v)
		for k, v in pairs(ents.FindByClass("gmod_sent_vehicle_fphysics_base")) do
			if v:GetModel() == model then
				for i, sprite in pairs(v.running) do
					sprite.PixVis = util.GetPixelVisibleHandle()
				end
				for i, sprite in pairs(v.stop) do
					sprite.PixVis = util.GetPixelVisibleHandle()
				end
				for i, sprite in pairs(v.turn.right) do
					sprite.PixVis = util.GetPixelVisibleHandle()
				end
				for i, sprite in pairs(v.turn.left) do
					sprite.PixVis = util.GetPixelVisibleHandle()
				end
			end
		end
	end
	
	local function Lights_Draw( v, tbl, alpha)
		for i, sprite in pairs(tbl) do
			
			
			local LightPos 
			
			if sprite.pos:ToTable()[2] > 0 then
				LightPos = v:LocalToWorld( sprite.pos+Vector(sprite.pos:ToTable()[2]*v:GetVehicleSteer()*(-0.4))+v:WorldToLocal(v:GetBonePosition(v:LookupBone("RLight_L"))) )
			else
				LightPos = v:LocalToWorld( sprite.pos+Vector(sprite.pos:ToTable()[2]*v:GetVehicleSteer()*(-0.4))+v:WorldToLocal(v:GetBonePosition(v:LookupBone("RLight_R"))) )
			end
			
			local Visible = util.PixelVisible( LightPos, 4, sprite.PixVis )
			local s_col = sprite.color
			local s_mat = Material(sprite.material)
			local s_size = sprite.size
			
				
			if Visible and Visible >= 0.6 then
				Visible = (Visible - 0.6) / 0.4
				render.SetMaterial( s_mat )
				
				--if not v.Sprites then return end
				--for k, spr in pairs(v.Sprites) do
					--if spr.pos == sprite.pos and not spr.Damaged then
				--print("B")
				render.DrawSprite( LightPos, s_size, s_size,  Color( s_col["r"], s_col["g"], s_col["b"],  s_col["a"]*Visible ) )
					--end
				--end					
			end
		end
	end

	hook.Add("PostDrawTranslucentRenderables", "Simfphys_K700_Lights", function()
		for k,v in pairs(ents.FindByClass("gmod_sent_vehicle_fphysics_base")) do
			if v:GetModel() == model then	
				
				if not v.running then
					v.running = {
						{pos =  Vector(0, 3.0, 0),size = 20,material="sprites/light_ignorez_new", color = Color(255,150,0, 50)},
						{pos =  Vector(0, 3.0, 0),size = 60,material="sprites/light_ignorez_new", color = Color(255,20,0, 200)},
						
						{pos =  Vector(0, -3.0, 0),size = 20,material="sprites/light_ignorez_new", color = Color(255,150,0, 50)},
						{pos =  Vector(0, -3.0, 0),size = 60,material="sprites/light_ignorez_new", color = Color(255,20,0, 200)},
					}
					
					v.stop = {
						{pos =  Vector(0, 0.5, 0),size = 20,material="sprites/light_ignorez_new", color = Color(255,150,0, 100)},
						{pos =  Vector(0, 0.5, 0),size = 60,material="sprites/light_ignorez_new", color = Color(255,20,0)},
						
						{pos =  Vector(0, -0.5, 0),size = 20,material="sprites/light_ignorez_new", color = Color(255,150,0, 100)},
						{pos =  Vector(0, -0.5, 0),size = 60,material="sprites/light_ignorez_new", color = Color(255,20,0)},
					}
					
					v.turn = {
						right = {
							{pos =  Vector(0, -6, 0),size = 20,material="sprites/light_ignorez_new", color = Color(255,200,0, 100)},
							{pos =  Vector(0, -6, 0),size = 60,material="sprites/light_ignorez_new", color = Color(255,120,0)},
						},
						left = {
							{pos =  Vector(0, 6, 0),size = 20,material="sprites/light_ignorez_new", color = Color(255,200,0, 100)},
							{pos =  Vector(0, 6, 0),size = 60,material="sprites/light_ignorez_new", color = Color(255,120,0)},
						}
					}
					SetupPixVis(v)
				end
				
				if v:GetIsBraking() then
					Lights_Draw(v, v.stop)
				end
				
				if v:GetLightsEnabled() then
					Lights_Draw(v, v.running)
					v:SetSubMaterial(3, "models/sim_fphys_k700/interior_on")
				else
					v:SetSubMaterial(3, "models/sim_fphys_k700/interior")
				end
				
				if v.flashnum == 1 then
					if v.signal_right then
						Lights_Draw(v, v.turn.right)					
					end
					if v.signal_left then
						Lights_Draw(v, v.turn.left)					
					end
				end
				
			end
		end
	end)
end