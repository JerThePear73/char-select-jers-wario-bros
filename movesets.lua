local gExtraStates = {}
for i = 0, MAX_PLAYERS - 1 do
    gExtraStates[i] = {}
    local e = gExtraStates[i]
    e.gfxY = 0
    e.canBash = true
end

local ACT_WAR_SH_BASH = allocate_mario_action(ACT_GROUP_MOVING | ACT_FLAG_MOVING | ACT_FLAG_ATTACKING)
local ACT_WAR_SH_BASH_JUMP = allocate_mario_action(ACT_GROUP_AIRBORNE | ACT_FLAG_AIR | ACT_FLAG_ATTACKING | ACT_FLAG_CONTROL_JUMP_HEIGHT)
local ACT_WAL_SH_BASH = allocate_mario_action(ACT_GROUP_MOVING | ACT_FLAG_MOVING | ACT_FLAG_ATTACKING)
local ACT_WAL_SH_BASH_JUMP = allocate_mario_action(ACT_GROUP_AIRBORNE | ACT_FLAG_AIR | ACT_FLAG_ATTACKING | ACT_FLAG_CONTROL_JUMP_HEIGHT)
local ACT_HUMBLE_GP = allocate_mario_action(ACT_GROUP_AIRBORNE | ACT_FLAG_AIR | ACT_FLAG_ATTACKING | ACT_FLAG_ALLOW_VERTICAL_WIND_ACTION)
local ACT_HUMBLE_GP_LAND = allocate_mario_action(ACT_GROUP_STATIONARY | ACT_FLAG_MOVING)
local ACT_HUMBLE_GP_CANCEL = allocate_mario_action(ACT_GROUP_AIRBORNE | ACT_FLAG_AIR | ACT_FLAG_ALLOW_VERTICAL_WIND_ACTION)
local ACT_CORKSCREW = allocate_mario_action(ACT_GROUP_AIRBORNE | ACT_FLAG_AIR | ACT_FLAG_ATTACKING | ACT_FLAG_ALLOW_VERTICAL_WIND_ACTION)

local E_MODEL_PARTICLE_CLONE_WARIO = smlua_model_util_get_id('jers_wario_clone_geo')
local E_MODEL_PARTICLE_RING = smlua_model_util_get_id('jers_wario_ring_particle_geo')
local E_MODEL_PARTICLE_CLONE_WALUIGI = smlua_model_util_get_id('jers_waluigi_clone_geo')

local SOUND_JWAR_SH_BASH = audio_sample_load("JW_SOUND_BASH.ogg")
local SOUND_JWAR_LEAP = audio_sample_load("JW_SOUND_JUMP.ogg")
local SOUND_JWAR_CORKSCREW = audio_sample_load("JW_SOUND_CORKSCREW.ogg")
local SOUND_JWAL_CORKSCREW = audio_sample_load("JW_SOUND_CORKSCREW1.ogg")

local TEX_BAG = get_texture_info('jwar-bag-of-oins')

local PARTICLE_TIMER = 10
local WAR_SH_BASH_MIN = 18
local WAL_SH_BASH_MAX = 20

-- BEHAVIOURS --

local function convert_s16(a)
    return (a + 0x8000) % 0x10000 - 0x8000
end

function dash_attacks(m, o, intee)
    if obj_has_behavior_id(o, id_bhvKingBobomb) ~= 0 and o.oAction ~= 0 then
        o.oMoveAngleYaw = m.faceAngle.y
        o.oAction = 4
        o.oVelY = 50
        o.oForwardVel = 20
    end

    if obj_has_behavior_id(o, id_bhvBobomb) ~= 0 then
        o.oMoveAngleYaw = m.faceAngle.y
        o.oAction = BOBOMB_ACT_LAUNCHED
        o.oVelY = 30
        o.oForwardVel = 50
    end

    if obj_has_behavior_id(o, id_bhvBreakableBoxSmall) ~= 0 then
        o.oMoveAngleYaw = m.faceAngle.y
        o.oVelY = 30
        o.oForwardVel = 40
    end

    if obj_has_behavior_id(o, id_bhvChuckya) ~= 0 then
        o.oMoveAngleYaw = m.faceAngle.y
        o.oAction = 2
        o.oVelY = 30
        o.oForwardVel = 40
    end

    if obj_has_behavior_id(o, id_bhvMrBlizzard) ~= 0 then
        o.oFaceAngleRoll = 0x3000
        o.oMrBlizzardHeldObj = nil
        o.prevObj = o.oMrBlizzardHeldObj
        o.oAction = MR_BLIZZARD_ACT_DEATH
    end

    if obj_has_behavior_id(o, id_bhvHeaveHo) ~= 0 then
        obj_mark_for_deletion(o)
        play_sound(SOUND_GENERAL_BREAK_BOX, m.marioObj.header.gfx.cameraToObject)
        spawn_triangle_break_particles(30, 138, 3.0, 4)
        spawn_non_sync_object(
            id_bhvMrIBlueCoin,
            E_MODEL_BLUE_COIN,
            o.oPosX, o.oPosY, o.oPosZ,
            nil)
    end
    
    if (intee & INTERACT_BULLY) ~= 0 then
        o.oVelY = 30
        o.oForwardVel = 50
    end

    if obj_has_behavior_id(o, id_bhvBreakableBox) ~= 0 then
        obj_mark_for_deletion(o)
        play_sound(SOUND_GENERAL_BREAK_BOX, m.marioObj.header.gfx.cameraToObject)
        spawn_triangle_break_particles(30, 138, 3.0, 4)
        spawn_non_sync_object(
            id_bhvThreeCoinsSpawn,
            E_MODEL_YELLOW_COIN,
            o.oPosX, o.oPosY, o.oPosZ,
            function (coin)
                coin.oVelY = math.random(20, 40)
                coin.oForwardVel = 0
            end)
    end
end

function humble_bump(m, x, y)
    m.forwardVel = x
    m.vel.y = y
    set_mario_action(m, ACT_WAR_SH_BASH_JUMP, 0)
    m.particleFlags = m.particleFlags | PARTICLE_VERTICAL_STAR
    play_sound(SOUND_ACTION_BOUNCE_OFF_OBJECT, m.marioObj.header.gfx.cameraToObject)
    return 0
end

function particle_clone_init(o)
  local index = network_local_index_from_global(o.globalPlayerIndex) or 255
  if index == 255 then
    obj_mark_for_deletion(o)
    return
  end
  local m = gMarioStates[index]
  o.oFlags = OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
  o.oOpacity = 0

  o.oPosX = m.marioObj.header.gfx.pos.x
  o.oPosY = m.marioObj.header.gfx.pos.y
  o.oPosZ = m.marioObj.header.gfx.pos.z
  o.oFaceAnglePitch = m.marioObj.header.gfx.angle.x
  o.oFaceAngleYaw = m.marioObj.header.gfx.angle.y
  o.oFaceAngleRoll = m.marioObj.header.gfx.angle.z
  o.header.gfx.animInfo.animID = m.marioObj.header.gfx.animInfo.animID
  o.header.gfx.animInfo.curAnim = m.marioObj.header.gfx.animInfo.curAnim
  o.header.gfx.animInfo.animYTrans = m.unkB0
  o.header.gfx.animInfo.animAccel = 0            --m.marioObj.header.gfx.animInfo.animAccel
  o.header.gfx.animInfo.animFrame = m.marioObj.header.gfx.animInfo.animFrame
  o.header.gfx.animInfo.animTimer = 0            --m.marioObj.header.gfx.animInfo.animTimer
  o.header.gfx.animInfo.animFrameAccelAssist = 0 --m.marioObj.header.gfx.animInfo.animFrameAccelAssist
  o.header.gfx.scale.x = m.marioObj.header.gfx.scale.x
  o.header.gfx.scale.y = m.marioObj.header.gfx.scale.y
  o.header.gfx.scale.z = m.marioObj.header.gfx.scale.z
end

function particle_clone_loop(o)
  o.oOpacity = 150 - (o.oTimer * (150/PARTICLE_TIMER))
  o.header.gfx.animInfo.animFrame = o.header.gfx.animInfo.animFrame
  if o.oTimer >= PARTICLE_TIMER then
    obj_mark_for_deletion(o)
  end
end

id_bhvParticleClone = hook_behavior(nil, OBJ_LIST_UNIMPORTANT, true, particle_clone_init, particle_clone_loop,
  "bhvParticleClone")


function particle_ring_init(o)
    local index = network_local_index_from_global(o.globalPlayerIndex) or 255
    if index == 255 then
        obj_mark_for_deletion(o)
        return
    end
    local m = gMarioStates[index]
    o.oFlags = OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    o.oFaceAngleRoll = 0 - degrees_to_sm64(90)
    o.header.gfx.scale.x = 0
    o.header.gfx.scale.y = 0
    o.header.gfx.scale.z = 0
end

function particle_ring_loop(o)
    local index = network_local_index_from_global(o.globalPlayerIndex) or 255
    if index == 255 then
        obj_mark_for_deletion(o)
        return
    end
    local m = gMarioStates[index]
    local rot = (((m.forwardVel - 58)/3)*1000)
    o.oPosX = m.marioObj.header.gfx.pos.x
    o.oPosY = m.marioObj.header.gfx.pos.y + 80
    o.oPosZ = m.marioObj.header.gfx.pos.z
    o.oFaceAnglePitch = o.oFaceAnglePitch + rot
    o.oFaceAngleYaw = m.marioObj.header.gfx.angle.y - degrees_to_sm64(90)
    if m.action == ACT_WAR_SH_BASH or m.action == ACT_WAR_SH_BASH_JUMP then
        if m.forwardVel >= 64 then
            o.header.gfx.scale.x = 1
            o.header.gfx.scale.y = 1
            o.header.gfx.scale.z = 1
        else
            o.header.gfx.scale.x = 0
            o.header.gfx.scale.y = 0
            o.header.gfx.scale.z = 0
        end
    else
        obj_mark_for_deletion(o)
    end
end

id_bhvParticleRing = hook_behavior(nil, OBJ_LIST_UNIMPORTANT, true, particle_ring_init, particle_ring_loop,
  "bhvRingParticle")

local function pause_check()
    local m = gMarioStates[0]

    if m.action == ACT_START_SLEEPING or m.action == ACT_SLEEPING or m.actionTimer < 80 and
        (m.action == ACT_STAR_DANCE_EXIT or m.action == ACT_STAR_DANCE_NO_EXIT or m.action == ACT_STAR_DANCE_WATER) then
        return 0.2
    end

    if is_game_paused() or _G.charSelect.is_menu_open() then
        return 0
    end

    return 1
end   


-- CUSTOM ACTIONS --

local function act_war_sh_bash(m)
    m.marioBodyState.eyeState = MARIO_EYES_LOOK_RIGHT
    m.marioBodyState.punchState = 66
    m.particleFlags = m.particleFlags | PARTICLE_DUST

    m.faceAngle.y = m.intendedYaw - approach_s32(convert_s16(m.intendedYaw - m.faceAngle.y), 0, 0x400, 0x400)
    apply_slope_accel(m)

    if (m.actionTimer & 2 == 0) then
        audio_sample_play(SOUND_JWAR_SH_BASH, m.pos, pause_check())
    end

    if m.actionTimer < 2 then
        m.vel.y = 0
    end

    local stepResult = perform_ground_step(m)
    if stepResult == GROUND_STEP_HIT_WALL and m.wall ~= nil then
        if m.wall.object == nil or m.wall.object.oInteractType & (INTERACT_BREAKABLE) == 0 then
            return humble_bump(m, -40, 30)
        end
    elseif stepResult == GROUND_STEP_LEFT_GROUND then
        set_mario_action(m, ACT_WAR_SH_BASH_JUMP, 0)
    end
        
    set_mario_anim_with_accel(m, MARIO_ANIM_RUNNING_UNUSED, m.forwardVel / 6 * 0x10000)
    smlua_anim_util_set_animation(m.marioObj, "JWAR_SH_BASH")

    -- speed
    local add = m.numCoins/4
    if m.numCoins > 100 then
        add = 25
    end
    local speedCap = 40 + add
    local speed = m.forwardVel

    if m.actionTimer < 3 and m.forwardVel < 30 then
        speed = 30
    else
        speed = approach_f32(speed, speedCap, 0.6, 5)
    end
    mario_set_forward_vel(m, speed)

    if m.forwardVel < 10 then
        set_mario_action(m, ACT_WALKING, 0)
        if mario_floor_is_steep(m) then
            set_mario_action(m, ACT_STOMACH_SLIDE, 0)
        end
    end

    if m.input & INPUT_A_PRESSED ~= 0 and m.actionTimer > 5 then
        audio_sample_play(SOUND_JWAR_LEAP, m.pos, pause_check())
        m.vel.y = 50
        set_mario_action(m, ACT_WAR_SH_BASH_JUMP, 0)
    elseif (m.controller.buttonDown & B_BUTTON == 0) or ((is_game_paused() or _G.charSelect.is_menu_open()) and m.playerIndex == 0) then
        if m.prevAction == ACT_WAR_SH_BASH_JUMP then
            set_mario_action(m, ACT_BRAKING, 0)
        elseif m.actionTimer > WAR_SH_BASH_MIN then
            set_mario_action(m, ACT_BRAKING, 0)
        end
    elseif m.input & INPUT_Z_PRESSED ~= 0 then
        set_mario_action(m, ACT_CROUCH_SLIDE, 0)
    --elseif m.floor.normal.y < 0.6 then set_mario_action(m, ACT_WALKING, 0)
    end

    m.actionTimer = m.actionTimer + 1
    return 0
end
hook_mario_action(ACT_WAR_SH_BASH, act_war_sh_bash)

local function act_war_sh_bash_jump(m)
    m.marioBodyState.eyeState = MARIO_EYES_LOOK_RIGHT

    if m.character.type == CT_WALUIGI then
        smlua_anim_util_set_animation(m.marioObj, "JWAL_SH_BASH_JUMP")
    else
        smlua_anim_util_set_animation(m.marioObj, "JWAR_SH_BASH_JUMP")
        m.marioBodyState.punchState = 66
    end

    --m.peakHeight = m.pos.y

    local stepResult = common_air_action_step(m, ACT_WAR_SH_BASH, MARIO_ANIM_RUNNING_UNUSED, AIR_STEP_NONE)
    if stepResult == AIR_STEP_HIT_WALL and m.wall ~= nil then
        if m.wall.object == nil or m.wall.object.oInteractType & (INTERACT_BREAKABLE) == 0 then
            return humble_bump(m, -40, 30)
        end
    elseif stepResult == AIR_STEP_LANDED then
        if (m.forwardVel < 30 or m.controller.buttonDown & B_BUTTON == 0) then
            set_mario_action(m, ACT_FREEFALL_LAND, 0)
        end
    end

    if m.input & INPUT_Z_PRESSED ~= 0 then
        set_mario_action(m, ACT_HUMBLE_GP, 0)
    end

    m.actionTimer = m.actionTimer + 1
    return 0
end
hook_mario_action(ACT_WAR_SH_BASH_JUMP, act_war_sh_bash_jump)

local function act_wal_sh_bash(m)
    m.marioBodyState.eyeState = MARIO_EYES_LOOK_RIGHT
    m.particleFlags = m.particleFlags | PARTICLE_DUST

    m.faceAngle.y = m.intendedYaw - approach_s32(convert_s16(m.intendedYaw - m.faceAngle.y), 0, 0x400, 0x400)
    apply_slope_accel(m)

    if (m.actionTimer & 2 == 0) then
        audio_sample_play(SOUND_JWAR_SH_BASH, m.pos, pause_check())
    end

    m.vel.y = 0

    local stepResult = perform_ground_step(m)
    if stepResult == GROUND_STEP_HIT_WALL and m.wall ~= nil then
        if m.wall.object == nil or m.wall.object.oInteractType & (INTERACT_BREAKABLE) == 0 then
            return humble_bump(m, -40, 30)
        end
    elseif stepResult == GROUND_STEP_LEFT_GROUND then
        m.action = ACT_WAL_SH_BASH_JUMP
    end
        
    set_mario_anim_with_accel(m, MARIO_ANIM_RUNNING_UNUSED, m.forwardVel / 4 * 0x10000)
    smlua_anim_util_set_animation(m.marioObj, "JWAL_SH_BASH")

    -- speed
    local add = m.numCoins/4
    if m.numCoins > 100 then
        add = 25
    end
    local speedCap = 40 + add
    local speed = m.forwardVel

    if m.actionTimer < 3 and m.forwardVel < 30 then
        speed = speedCap
    else
        speed = approach_f32(speed, speedCap, 0.6, 5)
    end
    mario_set_forward_vel(m, speed)

    if m.actionTimer < WAL_SH_BASH_MAX then
        mario_set_forward_vel(m, speed)
    else
        set_mario_action(m, ACT_BRAKING, 0)
    end

    if m.forwardVel < 10 then
        set_mario_action(m, ACT_WALKING, 0)
        if mario_floor_is_steep(m) then
            set_mario_action(m, ACT_STOMACH_SLIDE, 0)
        end
    end

    if ((is_game_paused() or _G.charSelect.is_menu_open()) and m.playerIndex == 0) then
        set_mario_action(m, ACT_BRAKING, 0)
    elseif m.input & INPUT_Z_PRESSED ~= 0 then
        set_mario_action(m, ACT_CROUCH_SLIDE, 0)
    end

    m.actionTimer = m.actionTimer + 1
    return 0
end
hook_mario_action(ACT_WAL_SH_BASH, act_wal_sh_bash)

local function act_wal_sh_bash_jump(m)
    m.marioBodyState.eyeState = MARIO_EYES_LOOK_RIGHT
    m.particleFlags = m.particleFlags | PARTICLE_DUST

    m.faceAngle.y = m.intendedYaw - approach_s32(convert_s16(m.intendedYaw - m.faceAngle.y), 0, 0x400, 0x400)

    if (m.actionTimer & 2 == 0) then
        audio_sample_play(SOUND_JWAR_SH_BASH, m.pos, pause_check())
    end

    m.vel.y = 0

    local stepResult = common_air_action_step(m, ACT_WAR_SH_BASH, MARIO_ANIM_RUNNING_UNUSED, AIR_STEP_NONE)
    if stepResult == AIR_STEP_HIT_WALL and m.wall ~= nil then
        if m.wall.object == nil or m.wall.object.oInteractType & (INTERACT_BREAKABLE) == 0 then
            return humble_bump(m, -40, 30)
        end
    elseif stepResult == AIR_STEP_LANDED then
        set_mario_action(m, ACT_FREEFALL_LAND, 0)
    end

    set_mario_anim_with_accel(m, MARIO_ANIM_RUNNING_UNUSED, m.forwardVel / 4 * 0x10000)
    smlua_anim_util_set_animation(m.marioObj, "JWAL_SH_BASH")

    -- speed
    local add = m.numCoins/4
    if m.numCoins > 100 then
        add = 25
    end
    local speed = m.forwardVel

    if m.actionTimer < WAL_SH_BASH_MAX then
        speed = 40 + add
        mario_set_forward_vel(m, speed)
    else
        m.forwardVel = speed - 15
        set_mario_action(m, ACT_FREEFALL, 0)
    end

    if m.input & INPUT_Z_PRESSED ~= 0 then
        set_mario_action(m, ACT_HUMBLE_GP, 0)
    end

    m.actionTimer = m.actionTimer + 1
    return 0
end
hook_mario_action(ACT_WAL_SH_BASH_JUMP, act_wal_sh_bash_jump)


local function act_humble_gp(m)
    local e = gExtraStates[m.playerIndex]

    if m.actionTimer == 1 then
        e.gfxY = 0
    elseif m.actionTimer == 2 then
        play_character_sound(m, CHAR_SOUND_GROUND_POUND_WAH)
        e.gfxY = 0x12000
    end
    if m.actionTimer < 10 then
        m.vel.y = 0
    end
    local stepResult = common_air_action_step(m, ACT_GROUND_POUND_LAND, MARIO_ANIM_GROUND_POUND, AIR_STEP_NONE)
    if stepResult == AIR_STEP_HIT_WALL then
        m.particleFlags = m.particleFlags | PARTICLE_VERTICAL_STAR
        set_mario_action(m, ACT_BACKWARD_AIR_KB, 0)
    elseif stepResult == AIR_STEP_LANDED then
        if should_get_stuck_in_ground(m) ~= 0 then
            queue_rumble_data_mario(m, 5, 80)
            play_character_sound(m, CHAR_SOUND_OOOF2)
            m.particleFlags = m.particleFlags | PARTICLE_MIST_CIRCLE
            set_mario_action(m, ACT_BUTT_STUCK_IN_GROUND, 0)
        else
            play_mario_heavy_landing_sound(m, SOUND_ACTION_TERRAIN_HEAVY_LANDING)
            m.particleFlags = m.particleFlags | PARTICLE_MIST_CIRCLE | PARTICLE_HORIZONTAL_STAR
            set_mario_action(m, ACT_GROUND_POUND_LAND, 0)
        end
        set_camera_shake_from_hit(SHAKE_GROUND_POUND)
    end

    m.forwardVel = m.forwardVel*0.95

    if m.input & INPUT_B_PRESSED ~= 0 and m.actionTimer > 0 then
        set_mario_action(m, ACT_HUMBLE_GP_CANCEL, 0)
    elseif m.input & INPUT_A_PRESSED ~= 0 and m.actionTimer > 0 then
        set_mario_action(m, ACT_CORKSCREW, 0)
    end

    m.peakHeight = m.pos.y
    e.gfxY = e.gfxY * 0.8
    m.marioObj.header.gfx.angle.y = m.faceAngle.y + e.gfxY
    m.marioObj.header.gfx.pos.y = m.pos.y - 20

    if m.actionTimer < 15 then
        m.actionTimer = m.actionTimer + 1
    end
    return 0
end
hook_mario_action(ACT_HUMBLE_GP, act_humble_gp, INT_GROUND_POUND)

local function act_humble_gp_land(m)
    if m.actionTimer < 2 then
        m.vel.x = 0
        m.vel.z = 0
    end

    if (m.input & INPUT_OFF_FLOOR ~= 0) then
        return set_mario_action(m, ACT_FREEFALL, 0)
    elseif (m.input & INPUT_ABOVE_SLIDE ~= 0) then
        return set_mario_action(m, ACT_DIVE_SLIDE, 0)
    elseif m.actionTimer == 2 then
        return set_mario_action(m, ACT_STOMACH_SLIDE_STOP, 0)
    end

    m.actionTimer = m.actionTimer + 1
    return 0
end
hook_mario_action(ACT_HUMBLE_GP_LAND, act_humble_gp_land, INT_GROUND_POUND)

local function act_humble_gp_cancel(m)
    local anim = MARIO_ANIM_START_GROUND_POUND
    local act = ACT_BUTT_SLIDE_AIR
    local pitch = m.vel.y * -1

    if m.character.type == CT_WALUIGI then
        anim = MARIO_ANIM_SWIM_PART1
        act = ACT_DIVE_SLIDE
    end

    if m.actionTimer == 1 then
        m.vel.y = 30
        m.forwardVel = 40
        play_character_sound(m, CHAR_SOUND_HOOHOO)
        m.faceAngle.y = m.intendedYaw
        m.particleFlags = m.particleFlags | PARTICLE_MIST_CIRCLE
    end
    local stepResult = common_air_action_step(m, act, anim, AIR_STEP_CHECK_LEDGE_GRAB)
    if stepResult == AIR_STEP_HIT_WALL then
        m.particleFlags = m.particleFlags | PARTICLE_VERTICAL_STAR
        set_mario_action(m, ACT_BACKWARD_AIR_KB, 0)
    end

    if m.character.type == CT_WALUIGI then
        m.marioObj.header.gfx.angle.x = degrees_to_sm64(pitch)
    end

    m.actionTimer = m.actionTimer + 1
    return 0
end
hook_mario_action(ACT_HUMBLE_GP_CANCEL, act_humble_gp_cancel)

local function act_corkscrew(m)
    local e = gExtraStates[m.playerIndex]

    m.marioBodyState.handState = MARIO_HAND_OPEN

    if m.actionTimer == 1 then
        e.gfxY = 0
    elseif m.actionTimer == 2 then
        audio_sample_play(SOUND_JWAR_CORKSCREW, m.pos, pause_check())
        m.faceAngle.y = m.intendedYaw
        e.gfxY = 0x20000
    elseif m.actionTimer > 1 then
        e.gfxY = e.gfxY * 0.9
        if m.actionTimer < 15 then
            m.vel.y = 25
            m.particleFlags = m.particleFlags | PARTICLE_SPARKLES
        elseif m.actionTimer < 30 then
            m.vel.y = m.vel.y + 2
        end
    end

    if m.forwardVel > 20 then
        m.forwardVel = 20
    end

    m.forwardVel = m.forwardVel*0.9

    local stepResult = common_air_action_step(m, ACT_FREEFALL_LAND, MARIO_ANIM_GROUND_POUND, AIR_STEP_CHECK_LEDGE_GRAB)

    if stepResult == AIR_STEP_GRABBED_LEDGE then
        m.marioObj.header.gfx.animInfo.animID = -1
    end

    if m.character.type == CT_WALUIGI then
        if m.actionTimer == 2 then
            play_character_sound(m, CHAR_SOUND_YAHOO_WAHA_YIPPEE)
            audio_sample_play(SOUND_JWAL_CORKSCREW, m.pos, pause_check())
        end
        smlua_anim_util_set_animation(m.marioObj, "JWAL_CORKSCREW")
        if m.vel.y > -10 then
            m.marioBodyState.eyeState = MARIO_EYES_CLOSED
        end
    else
        if m.actionTimer == 2 then
            play_character_sound(m, CHAR_SOUND_EEUH)
            audio_sample_play(SOUND_JWAR_CORKSCREW, m.pos, pause_check())
        end
        smlua_anim_util_set_animation(m.marioObj, "JWAR_CORKSCREW")
        if m.vel.y > -10 then
            m.marioBodyState.eyeState = MARIO_EYES_LOOK_UP
        elseif m.vel.y < -15 then
            m.marioBodyState.eyeState = MARIO_EYES_LOOK_DOWN
        end
    end

    m.marioObj.header.gfx.angle.y = m.faceAngle.y + e.gfxY

    m.actionTimer = m.actionTimer + 1
    return 0
end
hook_mario_action(ACT_CORKSCREW, act_corkscrew)

-- UPDATES --

local jumpTable = {
    [ACT_JUMP] = true,
    [ACT_DOUBLE_JUMP] = true,
    [ACT_TRIPLE_JUMP] = true,
    [ACT_BACKFLIP] = true,
    [ACT_SIDE_FLIP] = true
}

local function wario_update(m)
    local e = gExtraStates[m.playerIndex]

    -- torso tilt
    if m.action == ACT_WALKING then
        m.marioBodyState.torsoAngle.x = m.forwardVel * 100

        if m.marioBodyState.torsoAngle.z < -3000 then
            m.marioBodyState.eyeState = MARIO_EYES_LOOK_RIGHT
        elseif m.marioBodyState.torsoAngle.z > 3000 then
            m.marioBodyState.eyeState = MARIO_EYES_LOOK_LEFT
        end
    end

      -- clone particles
    if (m.playerIndex == 0 or is_player_active(m) ~= 0) and m.marioObj.header.gfx.node.flags & GRAPH_RENDER_ACTIVE ~= 0 then
        if ((m.action == ACT_WAR_SH_BASH or m.action == ACT_WAR_SH_BASH_JUMP) and m.forwardVel >= 50) or (m.action == ACT_CORKSCREW and m.vel.y > 20) then
            if (m.actionTimer) % 3 == 0 then
                spawn_non_sync_object(id_bhvParticleClone, E_MODEL_PARTICLE_CLONE_WARIO, m.pos.x, m.pos.y, m.pos.z,
                function(o) o.globalPlayerIndex = network_global_index_from_local(m.playerIndex) end)
            end
        end
    end
    -- scale
    if m.action == ACT_HUMBLE_GP then
        m.marioObj.header.gfx.scale.y = (m.actionTimer + 15)/30
    elseif m.action == ACT_CORKSCREW then
        if m.actionTimer < 8 then
            m.marioObj.header.gfx.scale.y = (8 - m.actionTimer)/15 + 1
            m.marioObj.header.gfx.scale.x = (m.actionTimer + 5)/12
            m.marioObj.header.gfx.scale.z = (m.actionTimer + 5)/12
        end
    end
end

local function wario_set_action(m)
    local e = gExtraStates[m.playerIndex]

    -- shoulder bash
    if (m.action == ACT_MOVE_PUNCHING and m.input & INPUT_NONZERO_ANALOG ~= 0 and m.input & INPUT_A_DOWN == 0 and m.forwardVel >= 0) or (m.action == ACT_DIVE and m.pos.y == m.floorHeight and m.input & INPUT_A_DOWN == 0) then
        set_mario_action(m, ACT_WAR_SH_BASH, 0)
    end
    -- water flop
    --if m.action == ACT_WATER_PLUNGE and m.prevAction == ACT_HUMBLE_GP then
        --audio_sample_play(SOUND_HUMBLE_FLOP, m.pos, 0.5)
    --end

        -- ring particles
    if (m.playerIndex == 0 or is_player_active(m) ~= 0) and m.marioObj.header.gfx.node.flags & GRAPH_RENDER_ACTIVE ~= 0 then
        if m.action == ACT_WAR_SH_BASH and m.prevAction ~= ACT_WAR_SH_BASH_JUMP then
            spawn_non_sync_object(id_bhvParticleRing, E_MODEL_PARTICLE_RING, m.pos.x, m.pos.y, m.pos.z,
            function(o) o.globalPlayerIndex = network_global_index_from_local(m.playerIndex) end)
        end
    end
end

local function wario_before_set_action(m, act)
    if act == ACT_GROUND_POUND then
        return ACT_HUMBLE_GP
    end
end

function wario_interact(m, o, intee)
    local damagableTypes = (INTERACT_BOUNCE_TOP | INTERACT_BOUNCE_TOP2 | INTERACT_HIT_FROM_BELOW | 2097152 | INTERACT_KOOPA | INTERACT_BREAKABLE | INTERACT_GRABBABLE | INTERACT_BULLY)

    if (m.action == ACT_WAR_SH_BASH or m.action == ACT_WAL_SH_BASH) and (intee & damagableTypes) ~= 0 then
        dash_attacks(m, o, intee)
        humble_bump(m, -40, 30)
        return false
    end

    if (m.action == ACT_WAR_SH_BASH_JUMP or m.action == ACT_WAL_SH_BASH_JUMP) and (intee & damagableTypes) ~= 0 then
        dash_attacks(m, o, intee)
        humble_bump(m, -40, 15)
        return false
    end
end

function wario_attack(a, v)
    if a.action == ACT_WAR_SH_BASH or a.action == ACT_WAR_SH_BASH_AIR then
        humble_bump(a, -40, 30)
    end
end

-------------
-- WALUIGI --
-------------

local function waluigi_update(m)
    local e = gExtraStates[m.playerIndex]

    -- torso tilt
    if m.action == ACT_WALKING then
        m.marioBodyState.torsoAngle.x = m.forwardVel * -50

        if m.marioBodyState.torsoAngle.z < -3000 then
            m.marioBodyState.eyeState = MARIO_EYES_LOOK_RIGHT
        elseif m.marioBodyState.torsoAngle.z > 3000 then
            m.marioBodyState.eyeState = MARIO_EYES_LOOK_LEFT
        end
    end

      -- clone particles
    if (m.playerIndex == 0 or is_player_active(m) ~= 0) and m.marioObj.header.gfx.node.flags & GRAPH_RENDER_ACTIVE ~= 0 then
        if ((m.action == ACT_WAL_SH_BASH or m.action == ACT_WAL_SH_BASH_JUMP) and m.forwardVel >= 50) or (m.action == ACT_CORKSCREW and m.vel.y > 20) then
            if (m.actionTimer) % 3 == 0 then
                spawn_non_sync_object(id_bhvParticleClone, E_MODEL_PARTICLE_CLONE_WALUIGI, m.pos.x, m.pos.y, m.pos.z,
                function(o) o.globalPlayerIndex = network_global_index_from_local(m.playerIndex) end)
            end
        end
    end
    -- scale
    if m.action == ACT_HUMBLE_GP then
        if m.actionTimer < 8 then
            m.marioObj.header.gfx.scale.y = (8 - m.actionTimer)/15 + 1
            m.marioObj.header.gfx.scale.x = (m.actionTimer + 5)/12
            m.marioObj.header.gfx.scale.z = (m.actionTimer + 5)/12
        end
    elseif m.action == ACT_CORKSCREW then
        if m.actionTimer < 8 then
            m.marioObj.header.gfx.scale.y = (m.actionTimer + 22)/30
        end
    end
end

local function waluigi_set_action(m)
    local e = gExtraStates[m.playerIndex]

    -- shoulder bash
    if (m.action == ACT_MOVE_PUNCHING and m.input & INPUT_NONZERO_ANALOG ~= 0 and m.input & INPUT_A_DOWN == 0 and m.forwardVel >= 0) or (m.action == ACT_DIVE and m.pos.y == m.floorHeight and m.input & INPUT_A_DOWN == 0) then
        set_mario_action(m, ACT_WAL_SH_BASH, 0)
    end
    if m.action == ACT_DIVE and m.vel.y < 20 and m.input & INPUT_NONZERO_ANALOG == 0 and e.canBash and m.forwardVel >= 0 then
        set_mario_action(m, ACT_WAL_SH_BASH_JUMP, 0)
        e.canBash = false
    end
    if m.pos.y == m.floorHeight and not e.canBash then
        e.canBash = true
    end
end

local function greedy_hud()
    local m = gMarioStates[0]
    local colour = 0
    local add = string.format("+%.0f", (m.numCoins/4))

    if m.numCoins >= 100 then
        add = "MAX"
        colour = math.abs(math.sin(get_global_timer()*0.5))*255
    end

    djui_hud_set_resolution(RESOLUTION_N64)
    djui_hud_set_font(FONT_RECOLOR_HUD)
    local width = djui_hud_get_screen_width()
    local x = 26
    local y = 45

    djui_hud_set_color(255, 255, 255, 255)
    djui_hud_render_texture(TEX_BAG, x, (y - 15), 1.2, 1.2)

    djui_hud_set_color(255, 255, colour, 255)
    djui_hud_print_text(add, x, y, 1)


    -- debug
    --djui_hud_set_resolution(RESOLUTION_DJUI)
    --djui_hud_set_font(FONT_ALIASED)
    --djui_hud_set_color(255, 0, 0, 255)

    --djui_hud_print_text(_G.charSelect.version_get(), 25, 350, 1)
    --djui_hud_print_text(string.format("torsoAngle.x = " ..m.marioBodyState.torsoAngle.x.. " "), 25, 375, 1)
    --djui_hud_print_text(string.format("torsoAngle.z = " ..m.marioBodyState.torsoAngle.z.. " "), 25, 400, 1)
    --djui_hud_print_text(string.format(VERSION_NUMBER), 25, 450, 1)
end

_G.charSelect.character_hook_moveset(CT_J_WARIO, HOOK_MARIO_UPDATE, wario_update)
_G.charSelect.character_hook_moveset(CT_J_WARIO, HOOK_ON_SET_MARIO_ACTION, wario_set_action)
_G.charSelect.character_hook_moveset(CT_J_WARIO, HOOK_BEFORE_SET_MARIO_ACTION, wario_before_set_action)
_G.charSelect.character_hook_moveset(CT_J_WARIO, HOOK_ON_INTERACT, wario_interact)
_G.charSelect.character_hook_moveset(CT_J_WARIO, HOOK_ON_PVP_ATTACK, wario_attack)
_G.charSelect.character_hook_moveset(CT_J_WARIO, HOOK_ON_HUD_RENDER_BEHIND, greedy_hud)

_G.charSelect.character_hook_moveset(CT_J_WALUIGI, HOOK_MARIO_UPDATE, waluigi_update)
_G.charSelect.character_hook_moveset(CT_J_WALUIGI, HOOK_ON_SET_MARIO_ACTION, waluigi_set_action)
_G.charSelect.character_hook_moveset(CT_J_WALUIGI, HOOK_BEFORE_SET_MARIO_ACTION, wario_before_set_action)
_G.charSelect.character_hook_moveset(CT_J_WALUIGI, HOOK_ON_INTERACT, wario_interact)
_G.charSelect.character_hook_moveset(CT_J_WALUIGI, HOOK_ON_PVP_ATTACK, wario_attack)
_G.charSelect.character_hook_moveset(CT_J_WALUIGI, HOOK_ON_HUD_RENDER_BEHIND, greedy_hud)