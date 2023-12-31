function AVX.FirePhysProjectile( data )
	if not data then return end
	if not istable( data.filter ) then return end
	if not isvector( data.shootOrigin ) then return end
	if not isvector( data.shootDirection ) then return end
	if not IsValid( data.attacker ) then return end
	if not IsValid( data.attackingent ) then return end

	local projectile = ents.Create( "avx_tankprojectile" )
	projectile:SetPos( data.shootOrigin )
	projectile:SetAngles( data.shootDirection:Angle() )
	projectile:SetOwner( data.attackingent )
	projectile.Attacker = data.attacker
	projectile.AttackingEnt = data.attackingent 
	
	local filter = data.filter 
	table.insert( filter, projectile )

	projectile.Force = data.Force and data.Force or 100
	projectile.MuzzleVelocity = data.MuzzleVelocity
	projectile.Damage = data.Damage and data.Damage or 100
	projectile.BlastRadius = data.BlastRadius and data.BlastRadius or 200
	projectile.BlastDamage = data.BlastDamage and data.BlastDamage or 50
	projectile:SetBlastEffect( isstring( data.BlastEffect ) and data.BlastEffect or "simfphys_tankweapon_explosion" )
	projectile:SetSize( data.Size and data.Size or 1 )
	projectile.Filter = filter
	projectile:Spawn()
	projectile:Activate()
end