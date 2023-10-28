function EFFECT:Init( data )
	local vehicle = data:GetEntity()

	local ID = vehicle:LookupAttachment( "muzzle_agl" )
	if ID == 0 then return end

	local Attachment = vehicle:GetAttachment( ID )

	local Pos = Attachment.Pos
	local Dir = Attachment.Ang:Forward()
	local vel = vehicle:GetVelocity()

	self.emitter = ParticleEmitter( Pos, false )

	self:Muzzle( Pos, Dir, vel )

	self.Time = 17.5
	self.DieTime = CurTime() + self.Time
	self.AttachmentID = ID
	self.Vehicle = vehicle
end

function EFFECT:Muzzle( pos, dir, vel )
	if not self.emitter then return end

   local particle = self.emitter:Add( "effects/ar2_altfire1b", pos )

   if particle then
      particle:SetVelocity( dir * math.Rand(50,200) + vel )
      particle:SetDieTime( 0.1 )
      particle:SetStartAlpha( 255 )
      particle:SetStartSize( 25 )
      particle:SetEndSize( 0 )
      particle:SetRoll( math.Rand( -1, 1 ) )
      particle:SetColor( 255,255,255 )
      particle:SetCollide( false )
   end

   for i = 0,3 do
		local particle = self.emitter:Add( "particles/smokey", pos )

		local rCol = math.Rand(120,140)

		if particle then
			particle:SetVelocity( dir * math.Rand(300,1300) + VectorRand() * math.Rand(0,300) + vel )
			particle:SetDieTime( math.Rand(0.5, 1) )
			particle:SetAirResistance( math.Rand(300,600) )
			particle:SetStartAlpha( math.Rand(50,150) )
			particle:SetStartSize( math.Rand(5,20) )
			particle:SetEndSize( math.Rand(50,60) )
			particle:SetRoll( math.Rand(-1,1) )
			particle:SetColor( rCol,rCol,rCol )
			particle:SetGravity( VectorRand() * 200 + Vector(0,0,200) )
			particle:SetCollide( false )
		end
	end

	local light = DynamicLight(self:EntIndex())
	if (light) then
		light.Pos = pos
		light.r = 255
		light.g = 206
		light.b = 122
		light.Brightness = 6
		light.Decay = 5100
		light.Size = 256
		light.DieTime = CurTime() + 0.1
	end
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end
