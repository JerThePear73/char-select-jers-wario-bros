if not _G.charSelectExists then return end

E_MODEL_PARTICLE_RING = smlua_model_util_get_id('jers_wario_ring_particle_geo')

gPlayerObjects = {}
for i = 0, (MAX_PLAYERS - 1) do
    gPlayerObjects[i] = nil
end

------------

define_custom_obj_fields({
    oPlayerIndex = 'u32',
})

local function ring_particle_init(o)
    o.oFlags = OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    o.hookRender = 1
    obj_scale(o, 1)
    o.oFaceAngleRoll = 0 - degrees_to_sm64(90)
    cur_obj_hide()
end

local function ring_particle_loop(o)
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
        obj_scale(o, 1)
    end

    if (m.action == ACT_WAR_SH_BASH or m.action == ACT_WAR_SH_BASH_JUMP) and m.forwardVel >= 64 then
        cur_obj_unhide()
    else
        cur_obj_hide()
    end
end

local id_bhvRingParticle = hook_behavior(nil, OBJ_LIST_DEFAULT, true, ring_particle_init, ring_particle_loop, "bhvRingParticle")

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
        local rot = (((m.forwardVel - 58)/3)*1000)

        o.oPosX = m.marioObj.header.gfx.pos.x
        o.oPosY = m.marioObj.header.gfx.pos.y + 80
        o.oPosZ = m.marioObj.header.gfx.pos.z
        o.oFaceAnglePitch = o.oFaceAnglePitch + rot
        o.oFaceAngleYaw = m.marioObj.header.gfx.angle.y - degrees_to_sm64(90)
    
        -- if the player is off screen, move the obj to the player origin
        if m.marioBodyState.updateTorsoTime ~= gMarioStates[0].marioBodyState.updateTorsoTime then
            o.oPosX = m.pos.x
            o.oPosY = m.pos.y
            o.oPosZ = m.pos.z
        end
    
        o.oPosX = o.oPosX + sins(m.faceAngle.y) * 10
        o.oPosZ = o.oPosZ + coss(m.faceAngle.y) * 10
    
        o.header.gfx.pos.x = o.oPosX
        o.header.gfx.pos.y = o.oPosY
        o.header.gfx.pos.z = o.oPosZ
    end
end

hook_event(HOOK_ON_OBJECT_RENDER, on_object_render)
hook_event(HOOK_ON_SYNC_VALID, on_sync_valid)