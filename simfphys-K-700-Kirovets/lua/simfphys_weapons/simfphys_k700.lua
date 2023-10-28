--local ClipSize = 15
--local CanSwepRP = 0

--local k700_susdata = {}
local k700_susdata = {}
for i = 1,2 do
	k700_susdata[i] = {
		attachment = "sus_left_attach_" .. i,
		poseparameter = "suspension_left_" .. i,
	}

	local ir = i + 2

	k700_susdata[ir] = {
		attachment = "sus_right_attach_" .. i,
		poseparameter = "suspension_right_" .. i,
	}
end

function simfphys.weapon:ValidClasses()
	return { "sim_fphys_k700" }
end

function simfphys.weapon:GetForwardSpeed( vehicle )
	return vehicle.ForwardSpeed
end

function simfphys.weapon:IsOnGround( vehicle )
	return vehicle.susOnGround == true
end

function simfphys.weapon:Initialize( vehicle )

end

function simfphys.weapon:ModPhysics( vehicle, wheelslocked )
	if wheelslocked and self:IsOnGround( vehicle ) then
		local phys = vehicle:GetPhysicsObject()
		phys:ApplyForceCenter( -vehicle:GetVelocity() * phys:GetMass() * 0.04 )
	end
end

function simfphys.weapon:UpdateSuspension( vehicle )
	if not vehicle.filterEntities then
		vehicle.filterEntities = player.GetAll()
		table.insert(vehicle.filterEntities, vehicle)

		for i, wheel in pairs( ents.FindByClass( "gmod_sent_vehicle_fphysics_wheel" ) ) do
			table.insert(vehicle.filterEntities, wheel)
		end
	end

	vehicle.oldDist = istable( vehicle.oldDist ) and vehicle.oldDist or {}

	vehicle.susOnGround = false
	local Up = vehicle:GetUp()

	for i, v in pairs( k700_susdata ) do
		local pos = vehicle:GetAttachment( vehicle:LookupAttachment( k700_susdata[i].attachment ) ).Pos + Up * 10

		local trace = util.TraceHull( {
			start = pos,
			endpos = pos + Up * - 100,
			maxs = Vector(10,10,0),
			mins = -Vector(10,10,0),
			filter = vehicle.filterEntities,
		} )
		local Dist = (pos - trace.HitPos):Length() - 50 -- 50 За просед гуслей

		if trace.Hit then
			vehicle.susOnGround = true
		end

		vehicle.oldDist[i] = vehicle.oldDist[i] and (vehicle.oldDist[i] + math.Clamp(Dist - vehicle.oldDist[i],-5,1)) or 0

		vehicle:SetPoseParameter(k700_susdata[i].poseparameter, vehicle.oldDist[i] )
	end
end

function simfphys.weapon:DoWheelSpin( vehicle )
	local spin_r = (vehicle.VehicleData[ "spin_4" ] + vehicle.VehicleData[ "spin_6" ])
	local spin_l = (vehicle.VehicleData[ "spin_3" ] + vehicle.VehicleData[ "spin_5" ])

	net.Start( "simfphys_update_tracks", true )
		net.WriteEntity( vehicle )
		net.WriteFloat( spin_r )
		net.WriteFloat( spin_l )
	net.Broadcast()

	vehicle:SetPoseParameter("spin_wheels_right", spin_r)
	vehicle:SetPoseParameter("spin_wheels_left", spin_l )
end

function simfphys.weapon:Think( vehicle )
	if not IsValid( vehicle ) or not vehicle:IsInitialized() then return end

	vehicle.wOldPos = vehicle.wOldPos or Vector(0,0,0)
	local deltapos = vehicle:GetPos() - vehicle.wOldPos
	vehicle.wOldPos = vehicle:GetPos()

	local handbrake = vehicle:GetHandBrakeEnabled()

	self:UpdateSuspension( vehicle )
	self:DoWheelSpin( vehicle )
	self:ModPhysics( vehicle, handbrake )

end