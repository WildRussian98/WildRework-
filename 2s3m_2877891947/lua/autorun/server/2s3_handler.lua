simfphys = istable( simfphys ) and simfphys or {}

simfphys.ManagedVehicles = istable( simfphys.ManagedVehicles ) and simfphys.ManagedVehicles or {}
simfphys.Weapons = istable( simfphys.Weapons ) and simfphys.Weapons or {}
simfphys.weapon = {}

util.AddNetworkString( "avx_misc_register_tank" )

sound.Add( {
	name = "moar_loop",
	channel = CHAN_WEAPON,
	volume = 100,
	level = 125,
	pitch = { 100, 110 },
	sound = "m5a2/cannons/fire/moar/moar_loop.wav",
} )

sound.Add( {
	name = "moar_down",
	channel = CHAN_STATIC,
	volume = 100,
	level = 125,
	pitch = { 100, 110 },
	sound = "m5a2/cannons/fire/moar/spin_down.wav",
} )

sound.Add( {
	name = "gauss_fire",
	channel = CHAN_ITEM,
	volume = 1.0,
	level = 140,
	pitch = { 90, 110 },
	sound = "m5a2/cannons/fire/gauss/gauss_fire.wav",
} )

sound.Add( {
	name = "singularity_fire",
	channel = CHAN_ITEM,
	volume = 1.0,
	level = 140,
	pitch = { 90, 110 },
	sound = "m5a2/cannons/fire/singularity/sing_shoot.wav",
} )

sound.Add( {
	name = "singularity_charge",
	channel = CHAN_ITEM,
	volume = 1.0,
	level = 140,
	pitch = { 90, 110 },
	sound = "m5a2/cannons/fire/singularity/sing_charge.wav",
} )

sound.Add( {
	name = "gauss_reload",
	channel = CHAN_ITEM,
	volume = 1.0,
	level = 70,
	pitch = { 90, 110 },
	sound = "m5a2/cannons/reload/gauss_reload.wav",
} )

sound.Add( {
	name = "cannon_reload",
	channel = CHAN_ITEM,
	volume = 100,
	level = 125,
	pitch = { 100, 110 },
	sound = "m5a2/cannons/reload/m5a2reload.wav",
} )

sound.Add( {
	name = "moac_fire",
	channel = CHAN_WEAPON,
	volume = 1.0,
	level = 140,
	pitch = { 90, 110 },
	sound = {"^m5a2/cannons/fire/moac/moac_fire1.wav","^m5a2/cannons/fire/moac/moac_fire2.wav","^m5a2/cannons/fire/moac/moac_fire3.wav","^m5a2/cannons/fire/moac/moac_fire4.wav"}
} )

sound.Add( {
	name = "shiten_fire",
	channel = CHAN_ITEM,
	volume = 100,
	level = 125,
	pitch = { 100, 110 },
	sound = {"^m5a2/mg/shiten/shiten_fire1.wav","^m5a2/mg/shiten/shiten_fire2.wav","^m5a2/mg/shiten/shiten_fire3.wav"}
} )

function simfphys.FireMOARProjectile( data )
	if not data then return end
	if not istable( data.filter ) then return end
	if not isvector( data.shootOrigin ) then return end
	if not isvector( data.shootDirection ) then return end
	if not IsValid( data.attacker ) then return end
	if not IsValid( data.attackingent ) then return end
	
	local projectile = ents.Create( "simfphys_moarproj" )
	projectile:SetPos( data.shootOrigin )
	projectile:SetAngles( data.shootDirection:Angle() )
	projectile:SetOwner( data.attackingent )
	projectile.Attacker = data.attacker
	projectile.AttackingEnt = data.attackingent 
	
	local filter = data.filter 
	table.insert( filter, projectile )
	
	projectile.Force = data.Force and data.Force or 100
	projectile.Damage = data.Damage and data.Damage or 100
	projectile.BlastRadius = data.BlastRadius and data.BlastRadius or 200
	projectile.BlastDamage = data.BlastDamage and data.BlastDamage or 50
	projectile:SetBlastEffect( isstring( data.BlastEffect ) and data.BlastEffect or "simfphys_tankweapon_explosion" )
	projectile:SetSize( data.Size and data.Size or 1 )
	projectile.Filter = filter
	projectile:Spawn()
	projectile:Activate()
end

function simfphys.FireTankGaussProjectile( data )
	if not data then return end
	if not istable( data.filter ) then return end
	if not isvector( data.shootOrigin ) then return end
	if not isvector( data.shootDirection ) then return end
	if not IsValid( data.attacker ) then return end
	if not IsValid( data.attackingent ) then return end
	
	local projectile = ents.Create( "simfphys_tank_gaussproj" )
	projectile:SetPos( data.shootOrigin )
	projectile:SetAngles( data.shootDirection:Angle() )
	projectile:SetOwner( data.attackingent )
	projectile.Attacker = data.attacker
	projectile.AttackingEnt = data.attackingent 
	
	local filter = data.filter 
	table.insert( filter, projectile )
	
	projectile.Force = data.Force and data.Force or 100
	projectile.Damage = data.Damage and data.Damage or 100
	projectile.BlastRadius = data.BlastRadius and data.BlastRadius or 200
	projectile.BlastDamage = data.BlastDamage and data.BlastDamage or 50
	projectile:SetBlastEffect( isstring( data.BlastEffect ) and data.BlastEffect or "simfphys_tankweapon_explosion" )
	projectile:SetSize( data.Size and data.Size or 1 )
	projectile.Filter = filter
	projectile:Spawn()
	projectile:Activate()
end

function simfphys.FireMOAСProjectile( data )
	if not data then return end
	if not istable( data.filter ) then return end
	if not isvector( data.shootOrigin ) then return end
	if not isvector( data.shootDirection ) then return end
	if not IsValid( data.attacker ) then return end
	if not IsValid( data.attackingent ) then return end
	
	local projectile = ents.Create( "simfphys_moacproj" )
	projectile:SetPos( data.shootOrigin )
	projectile:SetAngles( data.shootDirection:Angle() )
	projectile:SetOwner( data.attackingent )
	projectile.Attacker = data.attacker
	projectile.AttackingEnt = data.attackingent 
	
	local filter = data.filter 
	table.insert( filter, projectile )
	
	projectile.Force = data.Force and data.Force or 100
	projectile.Damage = data.Damage and data.Damage or 100
	projectile:SetSize( data.Size and data.Size or 1 )
	projectile.Spread = data.Spread or Vector(0,0,0)
	projectile.Tracer = data.Tracer or 0
	projectile.HullSize = data.HullSize or 1
	projectile.Filter = filter
	projectile:Spawn()
	projectile:Activate()
end

function simfphys.FireSingProjectile( data )
	if not data then return end
	if not istable( data.filter ) then return end
	if not isvector( data.shootOrigin ) then return end
	if not isvector( data.shootDirection ) then return end
	if not IsValid( data.attacker ) then return end
	if not IsValid( data.attackingent ) then return end
	
	local projectile = ents.Create( "simfphys_singproj" )
	projectile:SetPos( data.shootOrigin )
	projectile:SetAngles( data.shootDirection:Angle() )
	projectile:SetOwner( data.attackingent )
	projectile.Attacker = data.attacker
	projectile.AttackingEnt = data.attackingent 
	
	local filter = data.filter 
	table.insert( filter, projectile )
	
	projectile.Force = data.Force and data.Force or 100
	projectile.Damage = data.Damage and data.Damage or 100
	projectile.BlastRadius = data.BlastRadius and data.BlastRadius or 200
	projectile.BlastDamage = data.BlastDamage and data.BlastDamage or 50
	projectile:SetBlastEffect( isstring( data.BlastEffect ) and data.BlastEffect or "simfphys_tankweapon_explosion" )
	projectile:SetSize( data.Size and data.Size or 1 )
	projectile.Filter = filter
	projectile:Spawn()
	projectile:Activate()
end