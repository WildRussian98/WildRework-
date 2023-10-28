local Materials = {
	"particle/smokesprites_0001",
	"particle/smokesprites_0002",
	"particle/smokesprites_0003",
	"particle/smokesprites_0004",
	"particle/smokesprites_0005",
	"particle/smokesprites_0006",
	"particle/smokesprites_0007",
	"particle/smokesprites_0008",
	"particle/smokesprites_0009",
	"particle/smokesprites_0010",
	"particle/smokesprites_0011",
	"particle/smokesprites_0012",
	"particle/smokesprites_0013",
	"particle/smokesprites_0014",
	"particle/smokesprites_0015",
	"particle/smokesprites_0016"
}
function EFFECT:Init( data )
		
	local Pos = data:GetOrigin()
	
	self:Explosion( Pos )
	
	local random = math.random(1,3)
	
	if random == 1 then
		sound.Play( "simulated_vehicles/weapons/explosions/Close_Distance_1.ogg", Pos, 95, 100, 1 )
		sound.Play( "simulated_vehicles/weapons/explosions/Explosion_Ricochet_1.ogg", Pos, 95, 100, 1 )
	elseif random == 2 then
		sound.Play( "simulated_vehicles/weapons/explosions/Close_Distance_2.ogg", Pos, 95, 140, 1 )
		sound.Play( "simulated_vehicles/weapons/explosions/Explosion_Ricochet_2.ogg", Pos, 95, 140, 1 )
	else
		sound.Play( "simulated_vehicles/weapons/explosions/Close_Distance_3.ogg", Pos, 95, 100, 1 )
		sound.Play( "simulated_vehicles/weapons/explosions/Explosion_Ricochet_3.ogg", Pos, 95, 100, 1 )
	end
end

function EFFECT:Explosion( pos )
	local emitter = ParticleEmitter( pos, false )
	
	for i = 0,60 do
		local particle = emitter:Add( Materials[math.random(1,table.Count( Materials ))], pos )
		
		if particle then
			particle:SetVelocity( VectorRand() * 1300 )
			particle:SetDieTime( math.Rand(3,5) )
			particle:SetAirResistance( math.Rand(100,300) ) 
			particle:SetStartAlpha( 255 )
			particle:SetStartSize( math.Rand(20,60) )
			particle:SetEndSize( math.Rand(150,240) )
			particle:SetRoll( math.Rand(-1,1) )
			particle:SetColor( 80,80,80 )
			particle:SetGravity( Vector( 0, 0, 100 ) )
			particle:SetCollide( false )
		end
	end

	for i = 0,60 do
		local particle = emitter:Add( Materials[math.random(1,table.Count( Materials ))], pos )
		
		if particle then
			particle:SetVelocity( VectorRand() * 1000 )
			particle:SetDieTime( math.Rand(0.1,0.5) )
			particle:SetAirResistance( math.Rand(60,600) ) 
			particle:SetStartAlpha( 255 )
			particle:SetStartSize( math.Rand(50,80) )
			particle:SetEndSize( 120 )
			particle:SetRoll( math.Rand(-1,1) )
			particle:SetColor( 80,80,80 )
			particle:SetGravity( Vector( 0,0, 5000 ) )
			particle:SetCollide( false )
		end
	end
	
	for i = 0, 40 do
		local particle = emitter:Add( "sprites/flamelet"..math.random(1,5), pos )
		
		if particle then
			particle:SetVelocity( VectorRand() * 1000 )
			particle:SetDieTime( 0.14 )
			particle:SetStartAlpha( 255 )
			particle:SetStartSize( 10 )
			particle:SetEndSize( math.Rand(60,120) )
			particle:SetEndAlpha( 100 )
			particle:SetRoll( math.Rand( -1, 1 ) )
			particle:SetColor( 200,150,150 )
			particle:SetCollide( false )
		end
	end
	
	emitter:Finish()
	
	local dlight = DynamicLight( math.random(0,9999) )
	if dlight then
		dlight.pos = pos
		dlight.r = 255
		dlight.g = 180
		dlight.b = 100
		dlight.brightness = 8
		dlight.Decay = 2000
		dlight.Size = 300
		dlight.DieTime = CurTime() + 0.1
	end
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end