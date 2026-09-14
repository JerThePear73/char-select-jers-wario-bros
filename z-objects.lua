if not _G.charSelectExists then return end

local afterImageDurr = 0
local afterImageStartOpacity = 0

local E_MODEL_PARTICLE_RING = smlua_model_util_get_id('jers_wario_ring_particle_geo')
local E_MODEL_AFTER_IMAGE_WARIO = smlua_model_util_get_id('jers_wario_after_image_geo')
local E_MODEL_AFTER_IMAGE_WALUIGI = smlua_model_util_get_id('jers_waluigi_after_image_geo')

gPlayerObjects = {}
for i = 0, (MAX_PLAYERS - 1) do
    gPlayerObjects[i] = nil
    gPlayerSyncTable[i].jwarRingFrame = 0
end

------------

local ringScale = 1.2

define_custom_obj_fields({
    oPlayerIndex = 'u32',
})

function jwar_ring_particle_anim(node, matStackIndex)
    local asSwitchNode = cast_graph_node(node)
    local m = geo_get_mario_state()
    local s = gPlayerSyncTable[m.playerIndex]
    local toNode = s.jwarRingFrame
    if is_game_paused() then return end

    if s.jwarRingFrame > 10 then
        s.jwarRingFrame = 1
    else
        s.jwarRingFrame = s.jwarRingFrame + 1
    end
    asSwitchNode.selectedCase = toNode
end

function ring_particle_init(o)
    o.oFlags = OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    o.hookRender = 1
    obj_scale(o, ringScale)
    o.oFaceAngleRoll = 0 - degrees_to_sm64(90)
    cur_obj_hide()
end
function ring_particle_loop(o)
    local m = gMarioStates[o.oPlayerIndex]

    -- if the player is off screen, hide the obj
    if m.marioBodyState.updateTorsoTime ~= gMarioStates[0].marioBodyState.updateTorsoTime then
        cur_obj_hide()
        return
    end

    -- update pallet
    local np = gNetworkPlayers[o.oPlayerIndex]
    if np ~= nil then
        o.globalPlayerIndex = np.globalIndex
    end

    -- check if this should be activated
    if obj_is_hidden(o) ~= 0 then
        cur_obj_unhide()
        obj_set_model_extended(o, E_MODEL_PARTICLE_RING)
        obj_scale(o, ringScale)
    end

    if (m.action == ACT_WAR_SH_BASH or m.action == ACT_WAR_SH_BASH_JUMP) and m.forwardVel > 30 then
        cur_obj_unhide()
    else
        cur_obj_hide()
    end
end

local id_bhvRingParticle = hook_behavior(nil, OBJ_LIST_DEFAULT, true, ring_particle_init, ring_particle_loop, "bhvRingParticle")

function after_image_init(o)
	local index = network_local_index_from_global(o.globalPlayerIndex) or 255
  	if index == 255 then
  		obj_mark_for_deletion(o)
  		return
  	end
  	local m = gMarioStates[index]
	o.oFlags = OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
	o.oOpacity = 0

	vec3f_copy(o.header.gfx.pos, m.marioObj.header.gfx.pos)
	vec3f_copy(o.header.gfx.scale, m.marioObj.header.gfx.scale)
	vec3s_copy(o.header.gfx.angle, m.marioObj.header.gfx.angle)
	o.header.gfx.animInfo.animID = m.marioObj.header.gfx.animInfo.animID
	o.header.gfx.animInfo.curAnim = m.marioObj.header.gfx.animInfo.curAnim
	o.header.gfx.animInfo.animYTrans = m.marioObj.header.gfx.animInfo.animYTrans
	o.header.gfx.animInfo.animAccel = 0
	o.header.gfx.animInfo.animFrame = m.marioObj.header.gfx.animInfo.animFrame
	o.header.gfx.animInfo.animTimer = m.marioObj.header.gfx.animInfo.animTimer
	o.header.gfx.animInfo.animFrameAccelAssist = 0
end
function after_image_loop(o)
  	o.oOpacity = afterImageStartOpacity - (o.oTimer * (afterImageStartOpacity/afterImageDurr))
  	o.header.gfx.animInfo.animAccel = -1
  	if o.oTimer >= afterImageDurr then
  		obj_mark_for_deletion(o)
  	end
end

local id_bhvAfterImage = hook_behavior(nil, OBJ_LIST_UNIMPORTANT, true, after_image_init, after_image_loop, "id_bhvAfterImage")

------------

local function on_sync_valid()
    for i = 0, (MAX_PLAYERS - 1) do
        gPlayerObjects[i] = {
            [1] = spawn_non_sync_object(id_bhvRingParticle, E_MODEL_PARTICLE_RING, 0, 0, 0,
            function(o)
                o.oPlayerIndex = i
            end)
        }
    end
end

local function on_object_render(o)
    local m = gMarioStates[o.oPlayerIndex]
    if get_id_from_behavior(o.behavior) == id_bhvRingParticle then
        local rot = (((m.forwardVel - (bashSpeedBase + 18))/3)*1000)

        o.oPosX = m.pos.x
        o.oPosY = m.pos.y + 80
        o.oPosZ = m.pos.z
        --o.oFaceAnglePitch = o.oFaceAnglePitch + rot
        o.oFaceAngleYaw = m.marioObj.header.gfx.angle.y - degrees_to_sm64(90)
    
        -- if the player is off screen, move the obj to the player origin
        if m.marioBodyState.updateTorsoTime ~= gMarioStates[0].marioBodyState.updateTorsoTime then
            --o.oPosX = m.pos.x
            o.oPosY = m.pos.y
            --o.oPosZ = m.pos.z
        end
    
        o.header.gfx.pos.x = o.oPosX
        o.header.gfx.pos.y = o.oPosY
        o.header.gfx.pos.z = o.oPosZ
    end
end

hook_event(HOOK_ON_OBJECT_RENDER, on_object_render)
hook_event(HOOK_ON_SYNC_VALID, on_sync_valid)

function spawn_after_images(m, frame, durr, opacity, arg)
	if m.marioObj.header.gfx.node.flags & GRAPH_RENDER_ACTIVE == 0 or is_player_active(m) == 0 then return end
    local afterImageModel = 0 
    if arg == ARG_WARIO then
        afterImageModel = E_MODEL_AFTER_IMAGE_WARIO
    elseif arg == ARG_WALUIGI then
        afterImageModel = E_MODEL_AFTER_IMAGE_WALUIGI
    end

	if get_global_timer() % frame == 0 then
		spawn_non_sync_object(
			id_bhvAfterImage,
			afterImageModel,
			m.marioObj.header.gfx.pos.x,
			m.marioObj.header.gfx.pos.y,
			m.marioObj.header.gfx.pos.z,
			function(o)
				afterImageDurr = durr
				afterImageStartOpacity = opacity
				o.globalPlayerIndex = network_global_index_from_local(m.playerIndex)
                o.parentObj = m.marioObj
			end
		)
	end
end