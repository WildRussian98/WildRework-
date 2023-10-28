ENT.Type 				= "anim"
ENT.Base 				= "base_entity"
ENT.PrintName 			= "ATGM"
ENT.Author 				= ""
ENT.Information 		= ""

ENT.Spawnable 			= false


AddCSLuaFile()

ENT.Model = "models/weapons/w_missile_closed.mdl"
ENT.FuseTime = 30
ENT.ArmTime = 0.25
ENT.Ticks = 0

if SERVER then

function ENT:Initialize()
    self:SetModel( self.Model )
    self:SetMoveType( MOVETYPE_VPHYSICS )
    self:SetSolid( SOLID_VPHYSICS )
    self:PhysicsInit( SOLID_VPHYSICS )
    self:SetCollisionGroup( COLLISION_GROUP_PROJECTILE )
    self:DrawShadow( true )

    local phys = self:GetPhysicsObject()
    if phys:IsValid() then
        phys:Wake()
        phys:SetBuoyancyRatio(0)
        phys:EnableGravity( false )
    end

    self.MotorSound = CreateSound( self, "simulated_vehicles/weapons/Missile_2.ogg")
    self.MotorSound:Play()
end

function ENT:OnRemove()
    self.MotorSound:Stop()
end

end

local images_muzzle = {"effects/muzzleflash1", "effects/muzzleflash2", "effects/muzzleflash3", "effects/muzzleflash4"}

local function TableRandomChoice(tbl)
    return tbl[math.random(#tbl)]
end

function ENT:Think()
    if CLIENT then
        if self.Ticks % 5 == 0 then
            local emitter = ParticleEmitter(self:GetPos())

            if !self:IsValid() or self:WaterLevel() > 2 then return end

            local smoke = emitter:Add("particle/smokesprites_0001", self:GetPos())
            smoke:SetVelocity( VectorRand() * 2 )
            smoke:SetGravity( Vector(math.Rand(0, 0), math.Rand(0, 0), math.Rand(0, 0)) )
            smoke:SetDieTime( math.Rand(3.0, 4.5) )
            smoke:SetStartAlpha( 255 )
            smoke:SetEndAlpha( 0 )
            smoke:SetStartSize( 5 )
            smoke:SetEndSize( 40 )
            smoke:SetRoll( math.Rand(-5, 5) )
            smoke:SetRollDelta( math.Rand(-0.2,0.2) )
            smoke:SetColor( 220, 220, 220 )
            smoke:SetAirResistance( 10 )
            smoke:SetPos( self:GetPos() )
            smoke:SetLighting( false )
            emitter:Finish()
        end

        local emitter = ParticleEmitter(self:GetPos())

        local fire = emitter:Add(TableRandomChoice(images_muzzle), self:GetPos())
        fire:SetVelocity(self:GetAngles():Forward() * -100)
        fire:SetDieTime(0.1)
        fire:SetStartAlpha(255)
        fire:SetEndAlpha(0)
        fire:SetStartSize(22)
        fire:SetEndSize(0)
        fire:SetRoll( math.Rand(-180, 180) )
        fire:SetColor(255, 255, 255)
        fire:SetPos(self:GetPos())

        emitter:Finish()

        self.Ticks = self.Ticks + 4
    end
end

function ENT:Detonate()
    if !self:IsValid() then return end
    local effectdata = EffectData()
        effectdata:SetOrigin( self:GetPos() )

    if self:WaterLevel() >= 1 then
        util.Effect( "WaterSurfaceExplosion", effectdata )
    else
        util.Effect( "simfphys_explosion", effectdata)
    end

    local attacker = self

    if self.Owner:IsValid() then
        attacker = self.Owner
    end

    util.BlastDamage(self, attacker, self:GetPos(), 256, 40)
    self:FireBullets({
        Attacker = attacker,
        Damage = 3500,
        Tracer = 1,
        Distance = 85,
        Dir = self:GetAngles():Forward(),
        Src = self:GetPos(),
        IgnoreEntity = self,
        Callback = function(att, tr, dmg)
            util.Decal("Scorch", tr.StartPos, tr.HitPos - (tr.HitNormal * 64), self)

            dmg:SetDamageType(DMG_BLAST)
        end
    })

    self:Remove()
end

function ENT:PhysicsCollide(colData, collider)
    self:Detonate()
end

function ENT:Draw()
    self:DrawModel()
end