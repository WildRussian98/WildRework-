local light_table = {
	L_HeadLampPos = Vector(87,19,42),
	L_HeadLampAng = Angle(0,0,0),
	R_HeadLampPos = Vector(87,-19,42),
	R_HeadLampAng = Angle(0,0,0),
	
	L_RearLampPos = Vector(-73,25,34),
	L_RearLampAng = Angle(0,180,0),
	R_RearLampPos = Vector(-73,-25,34),
	R_RearLampAng = Angle(0,180,0),
	
	Headlight_sprites = { 
		Vector(87,19,42),Vector(87,19,42),
		Vector(87,-19,42),Vector(87,-19,42),
	},
	Headlamp_sprites = { 
		Vector(87,19,42),Vector(87,19,42),
		Vector(87,-19,42),Vector(87,-19,42),

		Vector( 41,32,59.5),
	},
	Rearlight_sprites = {
		Vector(-73,25,34),Vector(-75,25,34),
		Vector(-73,-25,34),Vector(-75,-25,34),
	},
	Brakelight_sprites = {
		Vector(-73,25,34),Vector(-75,25,34),
		Vector(-73,-25,34),Vector(-75,-25,34),
	},
}
list.Set( "simfphys_lights", "UAZ", light_table)

