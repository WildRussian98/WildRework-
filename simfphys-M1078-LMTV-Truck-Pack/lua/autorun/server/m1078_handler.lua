simfphys = istable( simfphys ) and simfphys or {}

simfphys.ManagedVehicles = istable( simfphys.ManagedVehicles ) and simfphys.ManagedVehicles or {}
simfphys.Weapons = istable( simfphys.Weapons ) and simfphys.Weapons or {}
simfphys.weapon = {}

sound.Add( {
	name = "m1078_shiten",
	channel = CHAN_STATIC,
	volume = 1,
	level = 140,
	pitch = { 90, 110 },
	sound = {"^m1078/mg/shiten/shi_fire1.wav","^m1078/mg/shiten/shi_fire2.wav","^m1078/mg/shiten/shi_fire3.wav"}
} )

sound.Add( {
	name = "m1078_moar_loop",
	channel = CHAN_STATIC,
	volume = 1,
	level = 140,
	pitch = { 90, 110 },
	sound = "^m1078/mg/moar/moar_loop.wav"
} )

sound.Add( {
	name = "m1078_moar_down",
	channel = CHAN_STATIC,
	volume = 1,
	level = 140,
	pitch = { 90, 110 },
	sound = "^m1078/mg/moar/spin_down.wav"
} )

sound.Add( {
	name = "m1078_moac",
	channel = CHAN_STATIC,
	volume = 1,
	level = 140,
	pitch = { 90, 110 },
	sound = {"^m1078/mg/moac/moac_fire1.ogg","^m1078/mg/moac/moac_fire2.ogg","^m1078/mg/moac/moac_fire3.ogg","^m1078/mg/moac/moac_fire4.ogg"}
} )

sound.Add( {
	name = "m1078_gauss",
	channel = CHAN_STATIC,
	volume = 1,
	level = 140,
	pitch = { 90, 110 },
	sound = "^m1078/mg/gauss/gauss_fire.ogg"
} )

function simfphys.FireGaussHitScan( data )
	if not data then return end
	if not istable( data.filter ) then return end
	if not isvector( data.shootOrigin ) then return end
	if not isvector( data.shootDirection ) then return end
	if not IsValid( data.attacker ) then return end
	if not IsValid( data.attackingent ) then return end
	
	data.Spread = data.Spread or Vector(0,0,0)
	data.Tracer = data.Tracer or 0
	data.HullSize = data.HullSize or 1
	
	local trace = util.TraceHull( {
		start = data.shootOrigin,
		endpos = data.shootOrigin + (data.shootDirection + Vector(math.Rand(-data.Spread.x,data.Spread.x),math.Rand(-data.Spread.y,data.Spread.y),math.Rand(-data.Spread.x,data.Spread.x)) )* 50000,
		filter = data.filter,
		maxs = data.HullSize,
		mins = -data.HullSize
	} )
	
	local bullet = {}
	bullet.Num 			= 1
	bullet.Src 			= trace.HitPos - data.shootDirection * 5
	bullet.Dir 			= data.shootDirection
	bullet.Spread 		= Vector(0,0,0)
	bullet.Tracer		= 0
	bullet.Force		= (data.Force and data.Force or 1)
	bullet.Damage		= (data.Damage and data.Damage or 1)
	bullet.HullSize		= data.HullSize
	bullet.Attacker 		= data.attacker
	bullet.Callback = function(att, tr, dmginfo)
		if tr.Entity ~= Entity(0) then
			if simfphys.IsCar( tr.Entity ) then
				local effectdata = EffectData()
					effectdata:SetOrigin( tr.HitPos + tr.HitNormal )
					effectdata:SetNormal( tr.HitNormal )
				util.Effect( "stunstickimpact", effectdata, true, true )
			
				sound.Play( Sound( "weapons/fx/rics/ric"..math.random(1,5)..".wav" ), tr.HitPos, 60)
			end
		end
	end
	data.attackingent:FireBullets( bullet )
	
	data.attackingent.hScanTracer = data.attackingent.hScanTracer and (data.attackingent.hScanTracer + 1) or 0
	
	if data.Tracer > 0 then
		if data.attackingent.hScanTracer >= data.Tracer then 
			data.attackingent.hScanTracer = 0
			
			local effectdata = EffectData()
			effectdata:SetStart( data.shootOrigin ) 
			effectdata:SetOrigin( trace.HitPos )
			util.Effect( "simfphys_gauss_tracer", effectdata )
		end
	end
end

function simfphys.FireM1078MOARProjectile( data )
	if not data then return end
	if not istable( data.filter ) then return end
	if not isvector( data.shootOrigin ) then return end
	if not isvector( data.shootDirection ) then return end
	if not IsValid( data.attacker ) then return end
	if not IsValid( data.attackingent ) then return end
	
	local projectile = ents.Create( "simfphys_m1078_moarproj" )
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
