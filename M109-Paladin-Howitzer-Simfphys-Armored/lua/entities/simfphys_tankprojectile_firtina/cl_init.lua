include("shared.lua")

local function RandVector(min,max)
	min = min or -1
	max = max or 1
	
	local vec = Vector(math.Rand(min,max),math.Rand(min,max),math.Rand(min,max))
	return vec
end

function ENT:Initialize()	
	self.PixVis = util.GetPixelVisibleHandle()
	
	self.Materials = {
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
	
	self.OldPos = self:GetPos()
end

local mat = Material( "sprites/animglow02" )
function ENT:Draw()
end

function ENT:Think()
	local curtime = CurTime()
	local pos = self:GetPos()
	
	if pos ~= self.OldPos then
		self:doFX( pos, self.OldPos )
		self.OldPos = pos
	end
	
	return true
end

function ENT:doFX( newpos, oldpos )
	local Sub = (newpos - oldpos)
	local Dir = Sub:GetNormalized()
	local Len = Sub:Length()
	
	for i = 1, Len, 15 do
		local pos = oldpos + Dir * i
		local emitter = ParticleEmitter(pos, false )
		if emitter then
			local particle = emitter:Add( self.Materials[math.random(1, table.Count(self.Materials) )], pos )
			
			if particle then
				particle:SetGravity( Vector(0,0,100) + RandVector() * 50 ) 
				particle:SetVelocity( -self:GetForward() * 500  )
				particle:SetAirResistance( 600 ) 
				particle:SetDieTime( math.Rand(0.5,1.0) )
				particle:SetStartAlpha( 80 )
				particle:SetStartSize( (math.Rand(15,30) / 20) * self:GetSize() )
				particle:SetEndSize( (math.Rand(50,80) / 20) * self:GetSize() )
				particle:SetRoll( math.Rand( -1, 1 ) )
				particle:SetColor( 120,120,120 )
				particle:SetCollide( false )
			end
			
			emitter:Finish()
		end
		
		local emitter = ParticleEmitter( pos, false )
		if emitter then
			local particle = emitter:Add( mat, pos )
			if particle then
				particle:SetVelocity( -self:GetForward() * 300 + self:GetVelocity())
				particle:SetDieTime( 0.1 )
				particle:SetAirResistance( 0 ) 
				particle:SetStartAlpha( 255 )
				particle:SetStartSize( self:GetSize() )
				particle:SetEndSize( 0 )
				particle:SetRoll( math.Rand(-1,1) )
				particle:SetColor( 255,255,255 )
				particle:SetGravity( Vector( 0, 0, 0 ) )
				particle:SetCollide( false )
			end
			
			emitter:Finish()
		end
	end
end

function ENT:OnRemove()
	local effectdata = EffectData()
		effectdata:SetOrigin( self:GetPos() )
	util.Effect( self:GetBlastEffect(), effectdata )
end

function ENT:Explosion( pos )
	local emitter = ParticleEmitter( pos, false )
	
	if not emitter then return end
	
	for i = 0,60 do
		local particle = emitter:Add( self.Materials[math.random(1,table.Count( self.Materials ))], pos )
		
		if particle then
			particle:SetVelocity( RandVector(-1,1) * 600 )
			particle:SetDieTime( math.Rand(7,10) )
			particle:SetAirResistance( math.Rand(200,600) ) 
			particle:SetStartAlpha( 255 )
			particle:SetStartSize( math.Rand(40,80) )
			particle:SetEndSize( math.Rand(80,120) )
			particle:SetRoll( math.Rand(-1,1) )
			particle:SetColor( 50,50,50 )
			particle:SetGravity( Vector( 0, 0, 100 ) )
			particle:SetCollide( false )
		end
	end
	
	for i = 0, 40 do
		local particle = emitter:Add( "sprites/flamelet"..math.random(1,5), pos )
		
		if particle then
			particle:SetVelocity( RandVector(-1,1) * 500 )
			particle:SetDieTime( 0.34 )
			particle:SetStartAlpha( 255 )
			particle:SetStartSize( 10 )
			particle:SetEndSize( math.Rand(100,150) )
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
		dlight.Size = 600
		dlight.DieTime = CurTime() + 0.2
	end
end