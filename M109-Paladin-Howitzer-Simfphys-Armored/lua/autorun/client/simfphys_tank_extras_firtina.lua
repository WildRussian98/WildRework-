local next_think = 0
local next_find = 0
local firtinas = {}

local function firtinasGetAll()
	local firtina_tanks = {}
	
	for i, ent in pairs( ents.FindByClass( "gmod_sent_vehicle_fphysics_base" ) ) do
		local class = ent:GetSpawn_List()
		
		if class == "sim_fphys_tank3" then
			table.insert(firtina_tanks, ent)
		end
	end
	
	return firtina_tanks 
end

local function GetTrackPos( ent, div, smoother )
	local FT =  FrameTime()
	local spin_left = ent.trackspin_l and (-ent.trackspin_l / div) or 0
	local spin_right = ent.trackspin_r and (-ent.trackspin_r / div) or 0
	
	ent.sm_TrackDelta_L = ent.sm_TrackDelta_L and (ent.sm_TrackDelta_L + (spin_left - ent.sm_TrackDelta_L) * smoother) or 0
	ent.sm_TrackDelta_R = ent.sm_TrackDelta_R and (ent.sm_TrackDelta_R + (spin_right- ent.sm_TrackDelta_R) * smoother) or 0

	return {Left = ent.sm_TrackDelta_L,Right = ent.sm_TrackDelta_R}
end

local function UpdatefirtinaScrollTexture( ent )
	local id = ent:EntIndex()

	if not ent.wheel_left_mat then
		ent.wheel_left_mat = CreateMaterial("l_trackmat_"..id.."_left", "VertexLitGeneric", { ["$basetexture"] = "models/bypolat/tanklar/obus/paletler", ["$alphatest"] = "1",  ["$translate"] = "[0.0 0.0 0.0]", ["Proxies"] = { ["TextureTransform"] = { ["translateVar"] = "$translate", ["centerVar"]    = "$center",["resultVar"]    = "$basetexturetransform", } } } )
	end

	if not ent.wheel_right_mat then
		ent.wheel_right_mat = CreateMaterial("l_trackmat_"..id.."_right", "VertexLitGeneric", { ["$basetexture"] = "models/bypolat/tanklar/obus/paletler", ["$alphatest"] = "1", ["$translate"] = "[0.0 0.0 0.0]", ["Proxies"] = { ["TextureTransform"] = { ["translateVar"] = "$translate", ["centerVar"]    = "$center",["resultVar"]    = "$basetexturetransform", } } } )
	end
	
	local TrackPos = GetTrackPos( ent, 90, 0.25 )
	ent.wheel_left_mat:SetVector("$translate", Vector(0,TrackPos.Left,0) )
	ent.wheel_right_mat:SetVector("$translate", Vector(0,TrackPos.Right,0) )

	ent:SetSubMaterial( 6, "!l_trackmat_"..id.."_left" ) 
	ent:SetSubMaterial( 7, "!l_trackmat_"..id.."_right" )

end

local function UpdateTracks()
	if firtinas then
		for index, ent in pairs( firtinas ) do
			if IsValid( ent ) then
				UpdatefirtinaScrollTexture( ent )
			else
				firtinas[index] = nil
			end
		end
	end
end

net.Receive( "simfphys_register_tank", function( length )
	local tank = net.ReadEntity()
	local type = net.ReadString()
	
	if not IsValid( tank ) then return end
	
	if type == "firtina" then
		table.insert(firtinas, tank)
	end
end)

net.Receive( "simfphys_tank_do_effect", function( length )
	local tank = net.ReadEntity()
	if not IsValid( tank ) then return end
	
	local effect = net.ReadString()
	
	if effect == "Muzzle3" then
		local effectdata = EffectData()
			effectdata:SetEntity( tank )
		util.Effect( "simfphys_firtina_muzzle", effectdata )

	elseif effect == "Explosion" then
		local effectdata = EffectData()
			effectdata:SetOrigin( net.ReadVector() )
		util.Effect( "simfphys_tankweapon_explosion", effectdata )
		
	elseif effect == "Explosion_small" then
		local effectdata = EffectData()
			effectdata:SetOrigin( net.ReadVector() )
		util.Effect( "simfphys_tankweapon_explosion_small", effectdata )
	end
end)

net.Receive( "simfphys_update_tracks", function( length )
	local tank = net.ReadEntity()
	if not IsValid( tank ) then return end
	
	tank.trackspin_r = net.ReadFloat() 
	tank.trackspin_l = net.ReadFloat() 
	
end)

local NumCycl = 0
hook.Add( "Think", "simfphys_manage_tanks_firtina", function()
	local curtime = CurTime()
	
	if curtime > next_find then
		next_find = curtime + 30
		
		NumCycl = NumCycl + 1
		if NumCycl >= 3 then
			firtinas = firtinasGetAll()
		end
	end
	
	if curtime > next_think then
		next_think = curtime + 0.02
		
		UpdateTracks()
	end
end )
