
local Materials = {

}

function EFFECT:Init( data )
	local Pos = data:GetOrigin()
	
	self:Explosion( Pos )
	
	sound.Play( "", Pos, 95, 200, 0.5 )
end

function EFFECT:Explosion( pos )
	local emitter = ParticleEmitter( pos, false )
	
	for i = 0, 40 do
		local particle = emitter:Add( "sprites/flamelet"..math.random(1,5), pos )
		
		if particle then
			particle:SetVelocity( VectorRand() * 300 )
			particle:SetDieTime( 0.14 )
			particle:SetStartAlpha( 255 )
			particle:SetStartSize( 25 )
			particle:SetEndSize( math.Rand(35,35) )
			particle:SetEndAlpha( 100 )
			particle:SetRoll( math.Rand( -1, 1 ) )
			particle:SetColor( 0,172,255 )
			particle:SetCollide( false )
		end
	end
	
	emitter:Finish()
	
	local dlight = DynamicLight( math.random(0,9999) )
	if dlight then
		dlight.pos = pos
		dlight.r = 0
		dlight.g = 175
		dlight.b = 255
		dlight.brightness = 5
		dlight.Decay = 12
		dlight.Size = 110
		dlight.DieTime = CurTime() + 0.1
	end
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end
