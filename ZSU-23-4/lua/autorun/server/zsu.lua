simfphys = istable( simfphys ) and simfphys or {}

simfphys.ManagedVehicles = istable( simfphys.ManagedVehicles ) and simfphys.ManagedVehicles or {}
simfphys.Weapons = istable( simfphys.Weapons ) and simfphys.Weapons or {}
simfphys.weapon = {}

util.AddNetworkString( "avx_misc_register_tank" )
util.AddNetworkString( "simfphys_tank_do_effect" )

sound.Add( {
	name = "Type912_cannons",
	channel = CHAN_STATIC,
	volume = 1,
	level = 125,
	pitch = { 90, 110 },
	sound = "^crysis/type912/fire/fire_loop.wav",
} )

sound.Add( {
	name = "Type912_cannon_tails",
	channel = CHAN_STATIC,
	volume = 1,
	level = 125,
	pitch = { 90, 110 },
	sound = {"^crysis/type912/fire/tail1.wav","^crysis/type912/fire/tail2.wav","^crysis/type912/fire/tail3.wav","^crysis/type912/fire/tail4.wav","^crysis/type912/fire/tail5.wav",},
} )

sound.Add( {
	name = "Type912_rockets",
	channel = CHAN_STATIC,
	volume = 1,
	level = 125,
	pitch = { 90, 110 },
	sound = "^crysis/type912/fire/missile.wav",
} )

sound.Add( {
	name = "Type912_reload",
	channel = CHAN_STATIC,
	volume = 1,
	level = 125,
	pitch = { 90, 110 },
	sound = "^crysis/type912/fire/reload.wav",
} )

function simfphys.FireAAHitScan( data )
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
			util.Effect( "simfphys_AA_tracer", effectdata )
		end
	end
end
