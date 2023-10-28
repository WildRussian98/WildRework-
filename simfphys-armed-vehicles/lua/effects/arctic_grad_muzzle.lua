function EFFECT:Init( data )

	local vehicle = data:GetEntity()
	local Attachment = vehicle:GetAttachment( data:GetAttachment() )

	local Pos = Attachment.Pos
	local Dir = -Attachment.Ang:Up()
	local vel = vehicle:GetVelocity()

	self.emitter = ParticleEmitter( Pos, false )

	self:Muzzle( Pos, Dir, vel )
end

function EFFECT:Muzzle( pos, dir, vel )
	if not self.emitter then return end

	local particle = self.emitter:Add( "effects/ar2_altfire1b", pos )

	if particle then
		particle:SetVelocity( dir * math.Rand(50,200) + vel )
		particle:SetDieTime( 0.2 )
		particle:SetStartAlpha( 255 )
		particle:SetStartSize( 300 )
		particle:SetEndSize( 0 )
		particle:SetRoll( math.Rand( -1, 1 ) )
		particle:SetColor( 255,255,255 )
		particle:SetCollide( false )
	end

	for i = 0,5 do
		local particle = self.emitter:Add( "particle/smokesprites_0001", pos )

		local rCol = math.Rand(100,120)

		if particle then
			particle:SetDieTime( math.Rand(1,4) )
			particle:SetAirResistance( math.Rand(300,600) )
			particle:SetStartAlpha( math.Rand(50,150) )
			particle:SetStartSize( math.Rand(5,20) )
			particle:SetEndSize( math.Rand(150,200) )
			particle:SetRoll( math.Rand(-1,1) )
			particle:SetColor( rCol,rCol,rCol )
			particle:SetGravity( VectorRand() * 20 + Vector(0,0,200) )
			particle:SetCollide( true )
			particle:SetBounce( 0.3 )
		end
	end

	local light = DynamicLight(self:EntIndex())
	if light then
		light.Pos = pos
		light.r = 255
		light.g = 206
		light.b = 122
		light.Brightness = 8
		light.Decay = 5100
		light.Size = 512
		light.DieTime = CurTime() + 0.1
	end
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end
