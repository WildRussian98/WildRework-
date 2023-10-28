
local Materials = {
}

function EFFECT:Init( data )
	local vehicle = data:GetEntity()
	
	if not IsValid( vehicle ) then return end
	
	local ID = vehicle:LookupAttachment( "cannon_muzzle" )
	if ID == 0 then return end
	
	local Attachment = vehicle:GetAttachment( ID )
	
	local Pos = Attachment.Pos
	local Dir = Attachment.Ang:Forward()
	local vel = vehicle:GetVelocity()
	
	self.emitter = ParticleEmitter( Pos, false )
	
	self:Muzzle( Pos, Dir, vel )
	
	self.Time = math.Rand(3,6)
	self.DieTime = CurTime() + self.Time
	self.AttachmentID = ID
	self.Vehicle = vehicle
end

function EFFECT:Muzzle( pos, dir, vel )
	if not self.emitter then return end

	for i = 0,20 do
		local particle = self.emitter:Add( "effects/muzzleflash2", pos )

		if particle then
			particle:SetVelocity( dir * math.Rand(50,200) + vel )
			particle:SetDieTime( 0.1 )
			particle:SetStartAlpha( 255 )
			particle:SetStartSize( math.random(15,25) )
			particle:SetEndSize( 0 )
			particle:SetRoll( math.Rand( -1, 1 ) )
			particle:SetColor( 0,172,255 )
			particle:SetCollide( false )
		end
	end
	
	for i = 0,10 do
		local particle = self.emitter:Add( "effects/valk/electric_arcs", pos )

		if particle then
			particle:SetVelocity( dir * math.Rand(50,200) + vel )
			particle:SetDieTime( 0.1 )
			particle:SetStartAlpha( 255 )
			particle:SetStartSize( math.random(15,25) )
			particle:SetEndSize( 0 )
			particle:SetRoll( math.Rand( -1, 1 ) )
			particle:SetColor( 0,172,255 )
			particle:SetCollide( false )
		end
	end
	
	local light = DynamicLight(self:EntIndex())
	if (light) then
		light.Pos = pos
		light.r = 0
		light.g = 175
		light.b = 255
		light.Brightness = 4
		light.Decay = 10
		light.Size = 200
		light.DieTime = CurTime() + 0.1
	end
end

function EFFECT:Think()
	local vehicle = self.Vehicle
	if not IsValid( vehicle ) then return false end
end

function EFFECT:Render()
end
