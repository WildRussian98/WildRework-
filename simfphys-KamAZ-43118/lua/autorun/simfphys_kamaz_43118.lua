AddCSLuaFile()

local model = "models/sim_fphys_kamaz_43118/kamaz_43118.mdl"


local light_table = {
	ModernLights = true, -- грубо говоря, ксенон или старые фары. True - ксенон, false - старые
	R_HeadLampPos = Vector(32.04, 134.7-80, 38.46)*1.25, -- рассположение обычных фар (правых - R)
	R_HeadLampAng = Angle(180,-90,0), -- угол поворота фар

	L_HeadLampPos = Vector(-32.04, 134.7-80, 38.46)*1.25, -- рассположение обычных фар (левых - L)
	L_HeadLampAng = Angle(180,-90,0), -- угол поворота фар

	R_RearLampPos = Vector(36.7, -132.2-80, 45.0)*1.25, -- расположение задних фар
	R_RearLampAng = Angle(0,-90,0), -- угол поворота фар

	L_RearLampPos = Vector(-36.7, -132.2-80, 45.0)*1.25, -- расположение задних фар
	L_RearLampAng = Angle(0,-90,0), -- угол поворота фар

	Headlight_sprites = { -- Обычные фары
		{pos =  Vector(37.3, 135.33-80, 38.45)*1.25, size = 100, color = Color(245, 250, 255, 200), material="sprites/light_ignorez_new"},
		{pos =  Vector(37.3, 135.33-80, 38.45)*1.25, size = 30, color = Color(245, 250, 255, 200), material="sprites/light_ignorez_new"},
		
		{pos =  Vector(-37.3, 135.33-80, 38.45)*1.25, size = 100, color = Color(245, 250, 255, 200), material="sprites/light_ignorez_new"},
		{pos =  Vector(-37.3, 135.33-80, 38.45)*1.25, size = 30, color = Color(245, 250, 255, 200), material="sprites/light_ignorez_new"},
	},
	Headlamp_sprites = { -- дальние
		{pos =  Vector(32.04, 134.7-80, 38.46)*1.25, size = 100, color = Color(245, 250, 255), material="sprites/light_ignorez_new"},
		{pos =  Vector(32.04, 134.7-80, 38.46)*1.25, size = 40, color = Color(245, 250, 255), material="sprites/light_ignorez_new"},
		{pos =  Vector(-32.04, 134.7-80, 38.46)*1.25, size = 100, color = Color(245, 250, 255), material="sprites/light_ignorez_new"},
		{pos =  Vector(-32.04, 134.7-80, 38.46)*1.25, size = 40, color = Color(245, 250, 255), material="sprites/light_ignorez_new"},
	},
	FogLight_sprites = { -- противотуманки
		{pos =  Vector(41.13, 134.78-80, 39.79)*1.25, size = 60, color = Color(245, 250, 255), material="sprites/light_ignorez_new"},
		{pos =  Vector(-41.13, 134.78-80, 39.79)*1.25, size = 60, color = Color(245, 250, 255), material="sprites/light_ignorez_new"},
		
		---
		
		{pos =  Vector(6.9, 119.3-80, 105.7)*1.25, size = 20, color = Color(255, 255, 0, 150), material="sprites/light_ignorez_new"},
		{pos =  Vector(6.9, 119.3-80, 105.7)*1.25, size = 80, color = Color(255, 140, 0), material="sprites/light_ignorez_new"},
		
		{pos =  Vector(0.3, 119.3-80, 105.7)*1.25, size = 20, color = Color(255, 255, 0, 150), material="sprites/light_ignorez_new"},
		{pos =  Vector(0.3, 119.3-80, 105.7)*1.25, size = 80, color = Color(255, 140, 0), material="sprites/light_ignorez_new"},
		
		{pos =  Vector(-6.3, 119.3-80, 105.7)*1.25, size = 20, color = Color(255, 255, 0, 150), material="sprites/light_ignorez_new"},
		{pos =  Vector(-6.3, 119.3-80, 105.7)*1.25, size = 80, color = Color(255, 140, 0), material="sprites/light_ignorez_new"},
		
		
		{pos =  Vector(32.72, 117.14-80, 105.15)*1.25, size = 60, color = Color(245, 250, 255), material="sprites/light_ignorez_new"},
		{pos =  Vector(-32.72, 117.14-80, 105.15)*1.25, size = 60, color = Color(245, 250, 255), material="sprites/light_ignorez_new"},
		
	},
	Rearlight_sprites = { -- задние фары
		{pos = Vector(36.7, -132.2-80, 45.0)*1.25,size = 20,color = Color(255,150,0,50),material="sprites/light_ignorez_new"},
		{pos = Vector(36.7+0.65, -132.2-80, 45.0+1.1)*1.25,size = 30,color = Color(255,20,0,185),material="sprites/light_ignorez_new"},
		{pos = Vector(36.7-0.75, -132.2-80, 45.0+1.1)*1.25,size = 30,color = Color(255,20,0,185),material="sprites/light_ignorez_new"},
		{pos = Vector(36.7+0.65, -132.2-80, 45.0)*1.25,size = 30,color = Color(255,20,0,185),material="sprites/light_ignorez_new"},
		{pos = Vector(36.7-0.75, -132.2-80, 45.0)*1.25,size = 30,color = Color(255,20,0,185),material="sprites/light_ignorez_new"},
		{pos = Vector(36.7+0.65, -132.2-80, 45.0-1.1)*1.25,size = 30,color = Color(255,20,0,185),material="sprites/light_ignorez_new"},
		{pos = Vector(36.7-0.75, -132.2-80, 45.0-1.1)*1.25,size = 30,color = Color(255,20,0,185),material="sprites/light_ignorez_new"},
		
		{pos = Vector(-36.7, -132.2-80, 45.0)*1.25,size = 20,color = Color(255,150,0,50),material="sprites/light_ignorez_new"},
		{pos = Vector(-36.7+0.65, -132.2-80, 45.0+1.1)*1.25,size = 30,color = Color(255,20,0,185),material="sprites/light_ignorez_new"},
		{pos = Vector(-36.7-0.75, -132.2-80, 45.0+1.1)*1.25,size = 30,color = Color(255,20,0,185),material="sprites/light_ignorez_new"},
		{pos = Vector(-36.7+0.65, -132.2-80, 45.0)*1.25,size = 30,color = Color(255,20,0,185),material="sprites/light_ignorez_new"},
		{pos = Vector(-36.7-0.75, -132.2-80, 45.0)*1.25,size = 30,color = Color(255,20,0,185),material="sprites/light_ignorez_new"},
		{pos = Vector(-36.7+0.65, -132.2-80, 45.0-1.1)*1.25,size = 30,color = Color(255,20,0,185),material="sprites/light_ignorez_new"},
		{pos = Vector(-36.7-0.75, -132.2-80, 45.0-1.1)*1.25,size = 30,color = Color(255,20,0,185),material="sprites/light_ignorez_new"},
	},
	Brakelight_sprites = { -- тормозные огни
		{pos = Vector(30.2, -132.2-80, 45.0)*1.25,size = 20,color = Color(255,150,0,65),material="sprites/light_ignorez_new"},
		{pos = Vector(30.2+0.55, -132.2-80, 45.0+1.1)*1.25,size = 20,color = Color(255,20,0),material="sprites/light_ignorez_new"},
		{pos = Vector(30.2-0.55, -132.2-80, 45.0+1.1)*1.25,size = 20,color = Color(255,20,0),material="sprites/light_ignorez_new"},
		{pos = Vector(30.2+0.55, -132.2-80, 45.0)*1.25,size = 20,color = Color(255,20,0),material="sprites/light_ignorez_new"},
		{pos = Vector(30.2-0.55, -132.2-80, 45.0)*1.25,size = 20,color = Color(255,20,0),material="sprites/light_ignorez_new"},
		{pos = Vector(30.2+0.55, -132.2-80, 45.0-1.1)*1.25,size = 20,color = Color(255,20,0),material="sprites/light_ignorez_new"},
		{pos = Vector(30.2-0.55, -132.2-80, 45.0-1.1)*1.25,size = 20,color = Color(255,20,0),material="sprites/light_ignorez_new"},
		
		{pos = Vector(-30.2, -132.2-80, 45.0)*1.25,size = 20,color = Color(255,150,0,65),material="sprites/light_ignorez_new"},
		{pos = Vector(-30.2+0.55, -132.2-80, 45.0+1.1)*1.25,size = 20,color = Color(255,20,0),material="sprites/light_ignorez_new"},
		{pos = Vector(-30.2-0.55, -132.2-80, 45.0+1.1)*1.25,size = 20,color = Color(255,20,0),material="sprites/light_ignorez_new"},
		{pos = Vector(-30.2+0.55, -132.2-80, 45.0)*1.25,size = 20,color = Color(255,20,0),material="sprites/light_ignorez_new"},
		{pos = Vector(-30.2-0.55, -132.2-80, 45.0)*1.25,size = 20,color = Color(255,20,0),material="sprites/light_ignorez_new"},
		{pos = Vector(-30.2+0.55, -132.2-80, 45.0-1.1)*1.25,size = 20,color = Color(255,20,0),material="sprites/light_ignorez_new"},
		{pos = Vector(-30.2-0.55, -132.2-80, 45.0-1.1)*1.25,size = 20,color = Color(255,20,0),material="sprites/light_ignorez_new"},
	},
	Reverselight_sprites = { -- фары заднего хода
		{pos = Vector(32.4, -132.2-80, 45.0)*1.25,size = 20,material="sprites/light_ignorez_new", color = Color(255, 255, 255, 100)},
		
		{pos = Vector(32.4+0.45, -132.2-80, 45.0+1.2)*1.25,size = 30,material="sprites/light_ignorez_new", color = Color(220, 205, 160, 200)},
		{pos = Vector(32.4-0.45, -132.2-80, 45.0+1.2)*1.25,size = 30,material="sprites/light_ignorez_new", color = Color(220, 205, 160, 200)},
		{pos = Vector(32.4+0.45, -132.2-80, 45.0)*1.25,size = 30,material="sprites/light_ignorez_new", color = Color(220, 205, 160, 200)},
		{pos = Vector(32.4-0.45, -132.2-80, 45.0)*1.25,size = 30,material="sprites/light_ignorez_new", color = Color(220, 205, 160, 200)},
		{pos = Vector(32.4+0.45, -132.2-80, 45.0-1.2)*1.25,size = 30,material="sprites/light_ignorez_new", color = Color(220, 205, 160, 200)},
		{pos = Vector(32.4-0.45, -132.2-80, 45.0-1.2)*1.25,size = 30,material="sprites/light_ignorez_new", color = Color(220, 205, 160, 200)},
		
		---
		
		{pos = Vector(-32.4, -132.2-80, 45.0)*1.25,size = 20,material="sprites/light_ignorez_new", color = Color(255, 255, 255, 100)},
		
		{pos = Vector(-32.4+0.45, -132.2-80, 45.0+1.2)*1.25,size = 30,material="sprites/light_ignorez_new", color = Color(220, 205, 160, 200)},
		{pos = Vector(-32.4-0.45, -132.2-80, 45.0+1.2)*1.25,size = 30,material="sprites/light_ignorez_new", color = Color(220, 205, 160, 200)},
		{pos = Vector(-32.4+0.45, -132.2-80, 45.0)*1.25,size = 30,material="sprites/light_ignorez_new", color = Color(220, 205, 160, 200)},
		{pos = Vector(-32.4-0.45, -132.2-80, 45.0)*1.25,size = 30,material="sprites/light_ignorez_new", color = Color(220, 205, 160, 200)},
		{pos = Vector(-32.4+0.45, -132.2-80, 45.0-1.2)*1.25,size = 30,material="sprites/light_ignorez_new", color = Color(220, 205, 160, 200)},
		{pos = Vector(-32.4-0.45, -132.2-80, 45.0-1.2)*1.25,size = 30,material="sprites/light_ignorez_new", color = Color(220, 205, 160, 200)},
	},
	Turnsignal_sprites = { -- поворотники
		Right = { -- правый
			{pos =  Vector(41.13, 134.78-80, 37.06)*1.25, size = 60, color = Color(255, 140, 0), material="sprites/light_ignorez_new"},
			{pos =  Vector(41.13, 134.78-80, 37.06)*1.25, size = 20, color = Color(255, 255, 0, 150), material="sprites/light_ignorez_new"},
			
			{pos =  Vector(44, 88-80, 52.47)*1.25, size = 60, color = Color(255, 140, 0), material="sprites/light_ignorez_new"},
			{pos =  Vector(44, 88-80, 52.47)*1.25, size = 20, color = Color(255, 255, 0, 150), material="sprites/light_ignorez_new"},
			
			{pos = Vector(41.7, -132.2-80, 45.0)*1.25,size = 20,color = Color(255,255,0,100),material="sprites/light_ignorez_new"},
			{pos = Vector(41.7+0.65, -132.2-80, 45.0+1.1)*1.25,size = 30,color = Color(255,120,0),material="sprites/light_ignorez_new"},
			{pos = Vector(41.7-0.75, -132.2-80, 45.0+1.1)*1.25,size = 30,color = Color(255,120,0),material="sprites/light_ignorez_new"},
			{pos = Vector(41.7+0.65, -132.2-80, 45.0)*1.25,size = 30,color = Color(255,120,0),material="sprites/light_ignorez_new"},
			{pos = Vector(41.7-0.75, -132.2-80, 45.0)*1.25,size = 30,color = Color(255,120,0),material="sprites/light_ignorez_new"},
			{pos = Vector(41.7+0.65, -132.2-80, 45.0-1.1)*1.25,size = 30,color = Color(255,120,0),material="sprites/light_ignorez_new"},
			{pos = Vector(41.7-0.75, -132.2-80, 45.0-1.1)*1.25,size = 30,color = Color(255,120,0),material="sprites/light_ignorez_new"},
		},
		Left = { -- левый
			{pos =  Vector(-41.13, 134.78-80, 37.06)*1.25, size = 60, color = Color(255, 140, 0), material="sprites/light_ignorez_new"},
			{pos =  Vector(-41.13, 134.78-80, 37.06)*1.25, size = 20, color = Color(255, 255, 0, 150), material="sprites/light_ignorez_new"},
			
			{pos =  Vector(-44, 88-80, 52.47)*1.25, size = 60, color = Color(255, 140, 0), material="sprites/light_ignorez_new"},
			{pos =  Vector(-44, 88-80, 52.47)*1.25, size = 20, color = Color(255, 255, 0, 150), material="sprites/light_ignorez_new"},
			
			{pos = Vector(-41.7, -132.2-80, 45.0)*1.25,size = 20,color = Color(255,255,0,100),material="sprites/light_ignorez_new"},
			{pos = Vector(-41.7+0.65, -132.2-80, 45.0+1.1)*1.25,size = 30,color = Color(255,120,0),material="sprites/light_ignorez_new"},
			{pos = Vector(-41.7-0.75, -132.2-80, 45.0+1.1)*1.25,size = 30,color = Color(255,120,0),material="sprites/light_ignorez_new"},
			{pos = Vector(-41.7+0.65, -132.2-80, 45.0)*1.25,size = 30,color = Color(255,120,0),material="sprites/light_ignorez_new"},
			{pos = Vector(-41.7-0.75, -132.2-80, 45.0)*1.25,size = 30,color = Color(255,120,0),material="sprites/light_ignorez_new"},
			{pos = Vector(-41.7+0.65, -132.2-80, 45.0-1.1)*1.25,size = 30,color = Color(255,120,0),material="sprites/light_ignorez_new"},
			{pos = Vector(-41.7-0.75, -132.2-80, 45.0-1.1)*1.25,size = 30,color = Color(255,120,0),material="sprites/light_ignorez_new"},
		},
	},
	ems_sounds = { "vehicles/sim_fphys_kamaz_43118/siren0.wav", "vehicles/sim_fphys_kamaz_43118/siren1.wav", "vehicles/sim_fphys_kamaz_43118/siren2.wav" },
	ems_sprites = {
		{
			pos = Vector(21.23, -136.26-80, 106)*1.25, 
			size = 150, 
			material = "sprites/light_ignorez_new", 
			Colors = {
				Color(0, 100, 255, 255), 
				Color(0, 100, 255, 200), 
				Color(0, 100, 255, 175), 
				Color(0, 100, 255, 150), 
				Color(0, 100, 255, 125), 
				Color(0, 100, 255, 100), 
				Color(0, 100, 255, 75), 
				Color(0, 100, 255, 25), 
				Color(0, 0, 0), 
				Color(0, 0, 0), 
				Color(0, 0, 0), 
				Color(0, 0, 0), 
				Color(0, 100, 255, 25), 
				Color(0, 100, 255, 75), 
				Color(0, 100, 255, 100), 
				Color(0, 100, 255, 125), 
				Color(0, 100, 255, 150), 
				Color(0, 100, 255, 175), 
				Color(0, 100, 255, 200), 
			}, 
			Speed = 0.035,
			OnBodyGroups = {[2]={0}}
		},
		{
			pos = Vector(21.23, -136.26-80, 106)*1.25, 
			size = 40, 
			material = "sprites/light_ignorez_new", 
			Colors = {
				Color(0, 200, 255, 255), 
				Color(0, 200, 255, 200), 
				Color(0, 200, 255, 175), 
				Color(0, 200, 255, 150), 
				Color(0, 200, 255, 125), 
				Color(0, 200, 255, 100), 
				Color(0, 200, 255, 75), 
				Color(0, 200, 255, 25), 
				Color(0, 0, 0), 
				Color(0, 0, 0), 
				Color(0, 0, 0), 
				Color(0, 0, 0), 
				Color(0, 200, 255, 25), 
				Color(0, 200, 255, 75), 
				Color(0, 200, 255, 100), 
				Color(0, 200, 255, 125), 
				Color(0, 200, 255, 150), 
				Color(0, 200, 255, 175), 
				Color(0, 200, 255, 200), 
			}, 
			Speed = 0.035,
			OnBodyGroups = {[2]={0}}
		},
		
	----
		
		{
			pos = Vector(9.25, 102.9-80, 113.77)*1.25, 
			size = 150, 
			material = "sprites/light_ignorez_new", 
			Colors = {
				Color(0, 100, 255, 255), 
				Color(0, 100, 255, 200), 
				Color(0, 100, 255, 175), 
				Color(0, 100, 255, 150), 
				Color(0, 100, 255, 125), 
				Color(0, 100, 255, 100), 
				Color(0, 100, 255, 75), 
				Color(0, 100, 255, 25), 
				Color(0, 0, 0), 
				Color(0, 0, 0), 
				Color(0, 0, 0), 
				Color(0, 0, 0), 
				Color(0, 100, 255, 25), 
				Color(0, 100, 255, 75), 
				Color(0, 100, 255, 100), 
				Color(0, 100, 255, 125), 
				Color(0, 100, 255, 150), 
				Color(0, 100, 255, 175), 
				Color(0, 100, 255, 200), 
			}, 
			Speed = 0.035,
			OnBodyGroups = {[2]={0}}
		},
		{
			pos = Vector(9.25, 102.9-80, 113.77)*1.25, 
			size = 40, 
			material = "sprites/light_ignorez_new", 
			Colors = {
				Color(0, 200, 255, 255), 
				Color(0, 200, 255, 200), 
				Color(0, 200, 255, 175), 
				Color(0, 200, 255, 150), 
				Color(0, 200, 255, 125), 
				Color(0, 200, 255, 100), 
				Color(0, 200, 255, 75), 
				Color(0, 200, 255, 25), 
				Color(0, 0, 0), 
				Color(0, 0, 0), 
				Color(0, 0, 0), 
				Color(0, 0, 0), 
				Color(0, 200, 255, 25), 
				Color(0, 200, 255, 75), 
				Color(0, 200, 255, 100), 
				Color(0, 200, 255, 125), 
				Color(0, 200, 255, 150), 
				Color(0, 200, 255, 175), 
				Color(0, 200, 255, 200), 
			}, 
			Speed = 0.035,
			OnBodyGroups = {[2]={0}}
		},
		
		{
			pos = Vector(-9.13, 102.9-80, 113.77)*1.25, 
			size = 150, 
			material = "sprites/light_ignorez_new", 
			Colors = {
				Color(0, 100, 255, 100), 
				Color(0, 100, 255, 125), 
				Color(0, 100, 255, 150), 
				Color(0, 100, 255, 175), 
				Color(0, 100, 255, 200), 
				Color(0, 100, 255, 255), 
				Color(0, 100, 255, 200), 
				Color(0, 100, 255, 175), 
				Color(0, 100, 255, 150), 
				Color(0, 100, 255, 125), 
				Color(0, 100, 255, 100), 
				Color(0, 100, 255, 75), 
				Color(0, 100, 255, 25), 
				Color(0, 0, 0), 
				Color(0, 0, 0), 
				Color(0, 0, 0), 
				Color(0, 0, 0), 
				Color(0, 100, 255, 25), 
				Color(0, 100, 255, 75), 
			}, 
			Speed = 0.035,
			OnBodyGroups = {[2]={0}}
		},
		{
			pos = Vector(-9.13, 102.9-80, 113.77)*1.25, 
			size = 40, 
			material = "sprites/light_ignorez_new", 
			Colors = {
				Color(0, 200, 255, 100), 
				Color(0, 200, 255, 125), 
				Color(0, 200, 255, 150), 
				Color(0, 200, 255, 175), 
				Color(0, 200, 255, 200), 
				Color(0, 200, 255, 255), 
				Color(0, 200, 255, 200), 
				Color(0, 200, 255, 175), 
				Color(0, 200, 255, 150), 
				Color(0, 200, 255, 125), 
				Color(0, 200, 255, 100), 
				Color(0, 200, 255, 75), 
				Color(0, 200, 255, 25), 
				Color(0, 0, 0), 
				Color(0, 0, 0), 
				Color(0, 0, 0), 
				Color(0, 0, 0), 
				Color(0, 200, 255, 25), 
				Color(0, 200, 255, 75), 
			}, 
			Speed = 0.035,
			OnBodyGroups = {[2]={0}}
		},
		
		{
			pos = Vector(19.9, 102.9-80, 113.77)*1.25, 
			size = 150, 
			material = "sprites/light_ignorez_new", 
			Colors = {
				Color(0, 0, 0), 
				Color(0, 0, 0), 
				Color(0, 0, 0), 
				Color(0, 100, 255, 25), 
				Color(0, 100, 255, 75), 
				Color(0, 100, 255, 100), 
				Color(0, 100, 255, 125), 
				Color(0, 100, 255, 150), 
				Color(0, 100, 255, 175), 
				Color(0, 100, 255, 200), 
				Color(0, 100, 255, 255), 
				Color(0, 100, 255, 200), 
				Color(0, 100, 255, 175), 
				Color(0, 100, 255, 150), 
				Color(0, 100, 255, 125), 
				Color(0, 100, 255, 100), 
				Color(0, 100, 255, 75), 
				Color(0, 100, 255, 25), 
				Color(0, 0, 0), 
			}, 
			Speed = 0.035,
			OnBodyGroups = {[2]={0}}
		},
		{
			pos = Vector(19.9, 102.9-80, 113.77)*1.25, 
			size = 40, 
			material = "sprites/light_ignorez_new", 
			Colors = {
				Color(0, 0, 0), 
				Color(0, 0, 0), 
				Color(0, 0, 0), 
				Color(0, 200, 255, 25), 
				Color(0, 200, 255, 75), 
				Color(0, 200, 255, 100), 
				Color(0, 200, 255, 125), 
				Color(0, 200, 255, 150), 
				Color(0, 200, 255, 175), 
				Color(0, 200, 255, 200), 
				Color(0, 200, 255, 255), 
				Color(0, 200, 255, 200), 
				Color(0, 200, 255, 175), 
				Color(0, 200, 255, 150), 
				Color(0, 200, 255, 125), 
				Color(0, 200, 255, 100), 
				Color(0, 200, 255, 75), 
				Color(0, 200, 255, 25), 
				Color(0, 0, 0), 
			}, 
			Speed = 0.035,
			OnBodyGroups = {[2]={0}}
		},
		
		{
			pos = Vector(-19.9, 102.9-80, 113.77)*1.25, 
			size = 150, 
			material = "sprites/light_ignorez_new", 
			Colors = {
				Color(0, 100, 255, 150), 
				Color(0, 100, 255, 125), 
				Color(0, 100, 255, 100), 
				Color(0, 100, 255, 75), 
				Color(0, 100, 255, 25), 
				Color(0, 0, 0), 
				Color(0, 0, 0), 
				Color(0, 0, 0), 
				Color(0, 0, 0), 
				Color(0, 100, 255, 25), 
				Color(0, 100, 255, 75), 
				Color(0, 100, 255, 100), 
				Color(0, 100, 255, 125), 
				Color(0, 100, 255, 150), 
				Color(0, 100, 255, 175), 
				Color(0, 100, 255, 200), 
				Color(0, 100, 255, 255), 
				Color(0, 100, 255, 200), 
				Color(0, 100, 255, 175), 
			}, 
			Speed = 0.035,
			OnBodyGroups = {[2]={0}}
		},
		{
			pos = Vector(-19.9, 102.9-80, 113.77)*1.25, 
			size = 40, 
			material = "sprites/light_ignorez_new", 
			Colors = {
				Color(0, 200, 255, 150), 
				Color(0, 200, 255, 125), 
				Color(0, 200, 255, 100), 
				Color(0, 200, 255, 75), 
				Color(0, 200, 255, 25), 
				Color(0, 0, 0), 
				Color(0, 0, 0), 
				Color(0, 0, 0), 
				Color(0, 0, 0), 
				Color(0, 200, 255, 25), 
				Color(0, 200, 255, 75), 
				Color(0, 200, 255, 100), 
				Color(0, 200, 255, 125), 
				Color(0, 200, 255, 150), 
				Color(0, 200, 255, 175), 
				Color(0, 200, 255, 200), 
				Color(0, 200, 255, 255), 
				Color(0, 200, 255, 200), 
				Color(0, 200, 255, 175), 
			}, 
			Speed = 0.035,
			OnBodyGroups = {[2]={0}}
		},
	},
}
list.Set( "simfphys_lights", "kamaz_43118_pol", light_table) -- здесь тебе нужно изменить "test" на любое другое название, например "myfirstsimfcar"

local V = {
	Name = "КАМАЗ-43118", -- название машины в меню
	Model = model, -- модель машины (в вкладке дополнения и проп авто)
	Category = "Автобусы", -- категория в которой будет машина
	
	Members = {
		Mass = 3500, -- масса авто
		MaxHealth = 4800,
		
		OnSpawn = 
		function(ent) 
			ent:SetSkin(math.random(0,2))
		end,		
		
		OnTick = function(v)
		
			if not v.fuel then
				v.fuel = 0
				v.oil = 0
				v.charge = 0
			end
			
			v.speed = v:GetVelocity():Length()/1700
			v:SetPoseParameter("speedo", v.speed)
			
			if v:EngineActive() then
				v.fuel = Lerp(0.05, v.fuel, v:GetFuel()/v:GetMaxFuel() )
				v.oil = Lerp(0.05, v.oil, v:GetCurHealth()/v:GetMaxHealth()/2+0.3 )
			else
				v.fuel = Lerp(0.05, v.fuel, 0 )
				v.oil = Lerp(0.05, v.oil, 0 )
			end
			
			if v:GetLightsEnabled() then
				v:SetSubMaterial(11, "models/sim_fphys_kamaz_43118/tumbl_on")
				v:SetSubMaterial(12, "models/sim_fphys_kamaz_43118/gauges_on")
				v:SetSubMaterial(10, "models/sim_fphys_kamaz_43118/gauges2_on")
			else
				v:SetSubMaterial(11, "models/sim_fphys_kamaz_43118/tumbl")
				v:SetSubMaterial(12, "models/sim_fphys_kamaz_43118/gauges")
				v:SetSubMaterial(10, "models/sim_fphys_kamaz_43118/gauges2")
			end
			
			v:SetPoseParameter("oil", v.oil )
			v:SetPoseParameter("charge", v.oil )
			v:SetPoseParameter("fuel", v.fuel )
			
			if StormFox or StormFox2 then
			
				if not v.oldwipers then 
					v.oldwipers = 0
					v.wipers = 0
				end
				
				if StormFox then
					if StormFox.IsRaining() and v:EngineActive() then
						v.wipers = math.sin((CurTime()-v.oldwipers)/0.6)
					else
						if v:GetPoseParameter("wipers") > 0.01 then
							v.wipers = math.sin((CurTime()-v.oldwipers)/0.6)
						else
							v.oldwipers = CurTime()
						end
					end
				elseif StormFox2 then
					if StormFox2.Weather.HasDownfall() and v:EngineActive() then
						v.wipers = math.sin((CurTime()-v.oldwipers)/0.6)
					else
						if v:GetPoseParameter("wipers") > 0.01 then
							v.wipers = math.sin((CurTime()-v.oldwipers)/0.6)
						else
							v.oldwipers = CurTime()
						end
					end
				end
				
				v:SetPoseParameter("wipers", v.wipers)
			
			end
			
		end,
		
		SpeedoMax = -1, -- какая максималка на спидометре(может работать криво)

		LightsTable = "kamaz_43118_pol", -- название light_table
		
		ModelInfo = {
			Skin = 1
		},

		AirFriction = -300000,

		EnginePos = Vector(0,30,45),

		CustomMassCenter = Vector(0,0,-1), 

		SeatOffset = Vector(5, -33, 110), -- положение водительского сидения
		SeatPitch = 10,
		FirstPersonViewPos = Vector(1, -10, 8),
		
		PassengerSeats = { -- пассажирские места
			{
				pos = Vector(33,25,80),
				ang = Angle(0,0,0) -- Vector(ширина, длина, высота),
			},
		---
			{
				pos = Vector(-35,-120,82),
				ang = Angle(0,0,0) -- Vector(ширина, длина, высота),
			},
			{
				pos = Vector(-35,-160,82),
				ang = Angle(0,0,0) -- Vector(ширина, длина, высота),
			},
			{
				pos = Vector(-35,-200,82),
				ang = Angle(0,0,0) -- Vector(ширина, длина, высота),
			},
		---
			{
				pos = Vector(35,-120,82),
				ang = Angle(0,0,0) -- Vector(ширина, длина, высота),
			},
			{
				pos = Vector(35,-160,82),
				ang = Angle(0,0,0) -- Vector(ширина, длина, высота),
			},
			{
				pos = Vector(35,-200,82),
				ang = Angle(0,0,0) -- Vector(ширина, длина, высота),
			},
		---
			{
				pos = Vector(-30,-245,82),
				ang = Angle(0,0,0) -- Vector(ширина, длина, высота),
			},
			
			{
				pos = Vector(30,-245,82),
				ang = Angle(0,0,0) -- Vector(ширина, длина, высота),
			},
		},

		ExhaustPositions = { -- позиция выхлопа
			{
                pos = Vector(-41.9, 19.14-80, 24.06)*1.25,
                ang = Angle(90,-180,0),
        	},
			{
                pos = Vector(-41.9, 19.14-80, 24.06)*1.25,
                ang = Angle(90,-180,0),
        	},
        },

		StrengthenSuspension = false, -- жесткая подвеска.
		
		CustomWheels = true,
		CustomWheelModel = "models/sim_fphys_kamaz_43118/kamaz_43118_wheel.mdl",

		CustomWheelPosFR = Vector(36, 92.1-80, 20)*1.25,
		CustomWheelPosFL = Vector(-36, 92.1-80, 20)*1.25,
		CustomWheelPosMR = Vector(36, -115, 20)*1.25,
		CustomWheelPosML = Vector(-36, -115, 20)*1.25,
		CustomWheelPosRR = Vector(36, -162, 20)*1.25,
		CustomWheelPosRL = Vector(-36, -162, 20)*1.25,

		FrontWheelRadius = 24,--радиус переднего колеса
		RearWheelRadius = 24,--радиус заднего колеса

		CustomWheelAngleOffset = Angle(0,-90,0),
		CustomSuspensionTravel = 1,
		CustomSteerAngle = 35,

		FrontHeight = 7, -- высота передней подвески
		FrontConstant = 35000,
		FrontDamping = 5000,
		FrontRelativeDamping = 5000,

		RearHeight = 4, -- высота задней подвески
		RearConstant = 35000,
		RearDamping = 5000,
		RearRelativeDamping = 5000,

		FastSteeringAngle = 16,
		SteeringFadeFastSpeed = 700,

		TurnSpeed = 2,

		MaxGrip = 145,
		Efficiency = 2,
		GripOffset = -3,
		BrakePower = 40, -- сила торможения

		IdleRPM = 600, -- мин. кол-во оборотов
		LimitRPM = 3000, -- макс. кол-во оборотов
		Revlimiter = false, -- Если true - Когда стрелка спидометра доходит до красного обозначения, она не проходит дальше, если false - это игнорируется
		PeakTorque = 85, -- крутящий момент
		PowerbandStart = 600, -- какие обороты на нейтральной передаче
		PowerbandEnd = 2500, -- ограничение по оборотам
		Turbocharged = false, -- турбо false = нет, true = да
		Supercharged = false, -- супер заряд
		Backfire = false, -- стреляющий выхлоп

		FuelFillPos = Vector(-42.5, 40-80, 47.5)*1.25, -- положение заправки
		FuelType = FUELTYPE_DIESEL, -- тип топлива
		FuelTankSize = 300, -- размер бака

		PowerBias = 0, -- привод. 1 - задний, 0 - полный, -1 - передний

		EngineSoundPreset = -1,
--
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

--
		DifferentialGear = 0.35,
		Gears = {-0.15, 0, 0.15, 0.2, 0.25, 0.3, 0.35} -- кол-во передач и "мощность"
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_kamaz_43118_pol", V )
