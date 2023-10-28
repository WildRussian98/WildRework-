
local Materials = {
	"particle/smokesprites_0001",
	"particle/smokesprites_0002",


}
function EFFECT:Init( data )
	local Pos = data:GetOrigin()
	
	self:Explosion( Pos )
	
	local random = math.random(1,3)
	
	if random == 1 then
		sound.Play( "", Pos, 95, 100, 1 )
	elseif random == 2 then
		sound.Play( "", Pos, 95, 140, 1 )
	else
		sound.Play( "", Pos, 95, 100, 1 )
	end
end

function EFFECT:Explosion( pos )
	local emitter = ParticleEmitter( pos, false )
	
	for i = 0,60 do
		local particle = emitter:Add( Materials[math.random(1,table.Count( Materials ))], pos )
		
		if particle then
			particle:SetVelocity( VectorRand() * 800 )
			particle:SetDieTime( math.Rand(2,2.5) )
			particle:SetAirResistance( math.Rand(200,600) ) 
			particle:SetStartAlpha( 255 )
			particle:SetStartSize( math.Rand(100,200) )
			particle:SetEndSize( math.Rand(200,300) )
			particle:SetRoll( math.Rand(-1,1) )
			particle:SetColor( 70,70,80 )
			particle:SetGravity( Vector( 0, 0, 100 ) )
			particle:SetCollide( false )
		end
	end
	
	for i = 0, 200 do
		local particle = emitter:Add( "particle/Particle_Glow_04_Additive", pos )
		
		if particle then
			particle:SetVelocity( VectorRand() * 1000 )
			particle:SetDieTime( 0.2 )
			particle:SetStartAlpha( 255 )
			particle:SetStartSize( 1 )
			particle:SetEndSize( math.Rand(400,400) )
			particle:SetEndAlpha( 100 )
			particle:SetRoll( math.Rand( -1, 1 ) )
			particle:SetColor( 150,150,255 )
			particle:SetCollide( false )
		end
	end
	for i = 0, 40 do
		local particle = emitter:Add( "particle/smokesprites_0001", pos )
		
		if particle then
			particle:SetVelocity( VectorRand() * 500 )
			particle:SetAirResistance(-68.167394537726 )
			particle:SetDieTime( 0.1 )
			particle:SetStartAlpha( 255 )
			particle:SetStartSize( 10 )
			particle:SetEndSize( math.Rand(250,300) )
			particle:SetEndAlpha( 100 )
			particle:SetRoll( math.Rand( -1, 1 ) )
			particle:SetColor( 255,0,0 )
				particle:SetGravity( Vector( 0, 0, 300 ) )
			particle:SetCollide( false )
		end
	end
	
    for i = 0, 90 do
        local particle = emitter:Add( "particle/warp1_warp", pos )
        
        if particle then
            particle:SetVelocity(Vector(math.random(-1000,1000),math.random(-1000,1000),math.random(0,0)))
            particle:SetDieTime( 3 )
            particle:SetStartAlpha( math.Rand(255,255) )
            particle:SetEndAlpha( 0 )
            particle:SetStartSize( 255 )
            particle:SetEndSize( math.Rand(400,400) )
            particle:SetRoll(math.Rand( 0, 360 ))
            particle:SetColor( 255,255,255 )
            particle:SetGravity( Vector(0,0,0) ) 
            particle:SetAirResistance(-68.167394537726 )  
            particle:SetCollide( true )
			particle:SetBounce(0.1419790559388)
        end
    end
	
	emitter:Finish()
	
	local dlight = DynamicLight( math.random(0,9999) )
	if dlight then
		dlight.pos = pos
		dlight.r = 0
		dlight.g = 175
		dlight.b = 255
		dlight.brightness = 8
		dlight.Decay = 12
		dlight.Size = 300
		dlight.DieTime = CurTime() + 0.1
	end
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end
