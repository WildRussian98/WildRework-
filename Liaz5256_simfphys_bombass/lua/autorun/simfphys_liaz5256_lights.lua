local light_table = {
	ModernLights = false,
	
	L_HeadLampPos = Vector(261,46,124.5),
	L_HeadLampAng = Angle(9,0,0),
	R_HeadLampPos = Vector(261,-47.5,124.5),
	R_HeadLampAng = Angle(9,0,0),
	
	L_RearLampPos = Vector(-200,36,33),
	L_RearLampAng = Angle(45,180,0),
	R_RearLampPos = Vector(-200,-36,33),
	R_RearLampAng = Angle(45,180,0),
	
	Headlight_sprites = {
		{
			pos = Vector(261,46,124.5),
			size = 23,
		},		
		{
			pos = Vector(261,-47.5,124.5),
			size = 23,
		},
		{
			pos = Vector(261,47,124.5),
			size = 23,
		},		
		{
			pos = Vector(261,-48.5,124.5),
			size = 23,
		},
		{
			pos = Vector(261,48,124.5),
			size = 23,
		},		
		{
			pos = Vector(261,-49.5,124.5),
			size = 23,
		},
		{
			pos = Vector(265,45,31),
			size = 55,
		},		
		{
			pos = Vector(264.5,-46.5,31),
			size = 55,
		},
		{
			pos = Vector(264.5,45,31),
			size = 55,
		},		
		{
			pos = Vector(264.5,-44.5,31),
			size = 55,
		},
		{
			pos = Vector(264.5,43,31),
			size = 55,
		},		
		{
			pos = Vector(264.5,-46.5,31),
			size = 55,
		},
		{
			pos = Vector(264.5,43,31),
			size = 55,
		},		
		{
			pos = Vector(264.5,-44.5,31),
			size = 55,
		}
	},
	Headlamp_sprites = { 
		{
			pos = Vector(264.5,45,31),
			size = 55,
		},		
		{
			pos = Vector(264.5,-46.5,31),
			size = 55,
		},
		{
			pos = Vector(264.5,45,31),
			size = 55,
		},		
		{
			pos = Vector(264.5,-44.5,31),
			size = 55,
		},
		{
			pos = Vector(264.5,43,31),
			size = 55,
		},		
		{
			pos = Vector(264.5,-46.5,31),
			size = 55,
		},
		{
			pos = Vector(264.5,43,31),
			size = 55,
		},		
		{
			pos = Vector(264.5,-44.5,31),
			size = 55,
		}
	},
	Rearlight_sprites = {
		{
			pos = Vector(-267.5,-52,46),
			size = 35,
		},
		{
			pos = Vector(-267.5,50.5,46),
			size = 35,
		},
		{
			pos = Vector(-267.5,-52,46),
			size = 35,
		},
		{
			pos = Vector(-267.5,50.5,46),
			size = 35,
		},
		{
			pos = Vector(-267.5,-52,46),
			size = 35,
		},
		{
			pos = Vector(-267.5,50.5,46),
			size = 35,
		},
		{
			pos = Vector(-265,47.25,120.5),
			size = 22,
		},
		{
			pos = Vector(-265,-48.75,120.5),
			size = 22,
		},
		{
			pos = Vector(-265,45.25,120.5),
			size = 22,
		},
		{
			pos = Vector(-265,-46.75,120.5),
			size = 22,
		},
		{
			pos = Vector(-265,46.25,120.5),
			size = 22,
		},
		{
			pos = Vector(-265,-47.75,120.5),
			size = 22,
		}
	},
	Brakelight_sprites = {
		{
			pos = Vector(-267.5,-52,39),
			size = 45,
		},
		{
			pos = Vector(-267.5,50.5,39),
			size = 45,
		},
		{
			pos = Vector(-267.5,-52,39),
			size = 45,
		},
		{
			pos = Vector(-267.5,50.5,39),
			size = 45,
		},
		{
			pos = Vector(-267.5,-52,39),
			size = 45,
		},
		{
			pos = Vector(-267.5,50.5,39),
			size = 45,
		}		
	},
	Reverselight_sprites = {
		{
			pos = Vector(-267.5,-52,32),
			size = 35,
		},
		{
			pos = Vector(-267.5,50.5,32),
			size = 35,
		},
		{
			pos = Vector(-267.5,-52,32),
			size = 35,
		},
		{
			pos = Vector(-267.5,50.5,32),
			size = 35,
		}
	},
	FogLight_sprites = {
		{
			pos = Vector(263.5,47.5,11.5),
			size = 45,
		},		
		{
			pos = Vector(263.5,-49,11.5),
			size = 45,
		},
		{
			pos = Vector(263.5,47.5,11.5),
			size = 45,
		},		
		{
			pos = Vector(263.5,-49,11.5),
			size = 45,
		},
		{
			pos = Vector(263.5,47.5,11.5),
			size = 45,
		},		
		{
			pos = Vector(263.5,-49,11.5),
			size = 45,
		}
	},
			Turnsignal_sprites = {
		Left = {
		    {pos = Vector(261.5,54,28),size = 27},
		    {pos = Vector(261.5,54,28),size = 27},
		    {pos = Vector(261.5,54,32),size = 27},
		    {pos = Vector(261.5,54,34),size = 27},
		    {pos = Vector(261.5,54,34),size = 27},
		    {pos = Vector(261.5,54,32),size = 27},
		    {pos = Vector(261.5,54,30),size = 27},
		    {pos = Vector(261.5,54,30),size = 27},
		    {pos = Vector(259.5,54,28),size = 30},
		    {pos = Vector(259.5,54,28),size = 30},
		    {pos = Vector(259.5,54,31),size = 27},
		    {pos = Vector(259.5,54,31),size = 27},
		    {pos = Vector(-267.5,50.5,53),size = 45},
		    {pos = Vector(-267.5,50.5,53),size = 45},
		    {pos = Vector(-267.5,50.5,53),size = 45},
		    {pos = Vector(-267.5,50.5,53),size = 45},
		    {pos = Vector(181,58.5,54.5),size = 22},
		    {pos = Vector(181,58.5,54.5),size = 22},
		    {pos = Vector(180,58.5,54.5),size = 22},
		    {pos = Vector(180,58.5,54.5),size = 22},
		    {pos = Vector(179,58.5,54.5),size = 22},
		    {pos = Vector(179,58.5,54.5),size = 22},
		},	
		Right = {
		    {pos = Vector(261.5,-55.5,28),size = 27},
		    {pos = Vector(261.5,-55.5,28),size = 27},
		    {pos = Vector(261.5,-55.5,32),size = 27},
		    {pos = Vector(261.5,-55.5,34),size = 27},
		    {pos = Vector(261.5,-55.5,34),size = 27},
		    {pos = Vector(261.5,-55.5,32),size = 27},
		    {pos = Vector(261.5,-55.5,30),size = 27},
		    {pos = Vector(261.5,-55.5,30),size = 27},
		    {pos = Vector(259.5,-55.5,28),size = 30},
		    {pos = Vector(259.5,-55.5,28),size = 30},
		    {pos = Vector(259.5,-55.5,31),size = 27},
		    {pos = Vector(259.5,-55.5,31),size = 27},
		    {pos = Vector(-267.5,-52,53),size = 45},
		    {pos = Vector(-267.5,-52,53),size = 45},
		    {pos = Vector(-267.5,-52,53),size = 45},
		    {pos = Vector(-267.5,-52,53),size = 45},
		    {pos = Vector(184.5,-60,54.5),size = 22},
		    {pos = Vector(184.5,-60,54.5),size = 22},
		    {pos = Vector(183.5,-60,54.5),size = 22},
		    {pos = Vector(183.5,-60,54.5),size = 22},
		    {pos = Vector(182.5,-60,54.5),size = 22},
		    {pos = Vector(182.5,-60,54.5),size = 22},
		}
	},
}
list.Set( "simfphys_lights", "liaz5256", light_table)