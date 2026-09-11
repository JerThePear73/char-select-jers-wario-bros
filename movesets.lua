if not _G.charSelectExists then return end

ACT_WAR_SH_BASH = allocate_mario_action(ACT_GROUP_MOVING | ACT_FLAG_MOVING | ACT_FLAG_ATTACKING)
ACT_WAR_SH_BASH_JUMP = allocate_mario_action(ACT_GROUP_AIRBORNE | ACT_FLAG_AIR | ACT_FLAG_ATTACKING | ACT_FLAG_CONTROL_JUMP_HEIGHT | ACT_FLAG_ALLOW_VERTICAL_WIND_ACTION)
ACT_WAR_ROLL = allocate_mario_action(ACT_GROUP_MOVING | ACT_FLAG_MOVING | ACT_FLAG_ATTACKING | ACT_FLAG_SHORT_HITBOX)
ACT_WAR_CARRY = allocate_mario_action(ACT_GROUP_MOVING | ACT_FLAG_MOVING)
ACT_WAL_SH_BASH = allocate_mario_action(ACT_GROUP_MOVING | ACT_FLAG_MOVING | ACT_FLAG_ATTACKING)
ACT_WAL_SH_BASH_JUMP = allocate_mario_action(ACT_GROUP_AIRBORNE | ACT_FLAG_AIR | ACT_FLAG_ATTACKING | ACT_FLAG_CONTROL_JUMP_HEIGHT | ACT_FLAG_ALLOW_VERTICAL_WIND_ACTION)
ACT_HUMBLE_GP = allocate_mario_action(ACT_GROUP_AIRBORNE | ACT_FLAG_AIR | ACT_FLAG_ATTACKING | ACT_FLAG_ALLOW_VERTICAL_WIND_ACTION)
ACT_SUPER_GP = allocate_mario_action(ACT_GROUP_AIRBORNE | ACT_FLAG_AIR | ACT_FLAG_ATTACKING)
ACT_HUMBLE_GP_CANCEL = allocate_mario_action(ACT_GROUP_AIRBORNE | ACT_FLAG_AIR | ACT_FLAG_ALLOW_VERTICAL_WIND_ACTION)
ACT_CORKSCREW = allocate_mario_action(ACT_GROUP_AIRBORNE | ACT_FLAG_AIR | ACT_FLAG_ATTACKING | ACT_FLAG_ALLOW_VERTICAL_WIND_ACTION)
ACT_SYP_SLASH = allocate_mario_action(ACT_GROUP_MOVING | ACT_FLAG_MOVING | ACT_FLAG_ATTACKING)
ACT_SYP_CHOP = allocate_mario_action(ACT_GROUP_AIRBORNE | ACT_FLAG_AIR | ACT_FLAG_ATTACKING | ACT_FLAG_ALLOW_VERTICAL_WIND_ACTION)
ACT_SYP_CANNON = allocate_mario_action(ACT_GROUP_AIRBORNE | ACT_FLAG_AIR | ACT_FLAG_ATTACKING | ACT_FLAG_ALLOW_VERTICAL_WIND_ACTION)
ACT_SYP_VERTICAL_BOOST = allocate_mario_action(ACT_GROUP_AIRBORNE | ACT_FLAG_AIR | ACT_FLAG_ALLOW_VERTICAL_WIND_ACTION)
ACT_BOMB_STASH = allocate_mario_action(ACT_GROUP_STATIONARY | ACT_FLAG_STATIONARY)

gWarioStates = {}
for i = 0, MAX_PLAYERS - 1 do
    gWarioStates[i] = {
        gfxY = 0,
        canBash = true,
        bagScale = 0,
        swordScale = 0,
        chop = 0,
        prevVel = 0,
        slashCooldown = 0,
        availCoins = 25,
        coinFreq = 0,
        prevPosY = 0,
        bank = 0,
        wallet = 0,
        coinQueue = 0,
        prevLives = 4,
        hardPos = gVec3fZero{},
        bombsStashed = 0,
        bombHudTimer = 0,
        bombHudOffset = 0,
        bombHudBob = 0,
        bankOffset = 30,
    }
end

local SOUND_JWAR_SH_BASH = audio_sample_load("JW_SOUND_BASH.ogg")
local SOUND_JWAL_SH_BASH = audio_sample_load("JW_SOUND_BASH1.ogg")
local SOUND_JWAR_LEAP = audio_sample_load("JW_SOUND_JUMP.ogg")
local SOUND_JWAR_CORKSCREW = audio_sample_load("JW_SOUND_CORKSCREW.ogg")
local SOUND_JWAL_CORKSCREW = audio_sample_load("JW_SOUND_CORKSCREW1.ogg")
local SOUND_JSYP_CORKSCREW = audio_sample_load("JW_SOUND_CORKSCREW2.ogg")
local SOUND_JSYP_SLASH = audio_sample_load("JW_SOUND_SLASH.ogg")
local SOUND_JSYP_CHOP = audio_sample_load("JW_SOUND_CHOP.ogg")
local SOUND_TADA = audio_sample_load("JW_SOUND_TADA.ogg")

local TEX_BAG = get_texture_info('jwar_bag_of_oins')
local TEX_BANK = get_texture_info('jwar_hud_$')
local TEX_BOMB = get_texture_info('jwar_hud_bomb')
local TEX_SWORD_BACK = get_texture_info("jwar_hud_sword_back")
local TEX_SWORD_FRONT = get_texture_info("jwar_hud_sword_front")

bashSpeedBase = 50
local WAR_SH_BASH_MIN = 18
local WAL_SH_BASH_MAX = 20
local chopMax = 1
local availCoinsMax = 25
--local prevNumCoins = -1
local maxBombs = 10
local powerScaling = charSelect.add_option("Power Scaling", 1, 1, nil, {"Coins increase speed."}, true)
local betterCoins = false
local bombHudTimerMax = 150

ARG_WARIO     = 0
ARG_WALUIGI   = 1
ARG_SYRUP     = 2
ARG_WARUDEIJI = 3

local loseBombActions = {
    [ACT_FORWARD_GROUND_KB]         = true,
    [ACT_BACKWARD_GROUND_KB]        = true,
    [ACT_SOFT_FORWARD_GROUND_KB]    = true,
    [ACT_SOFT_BACKWARD_GROUND_KB]   = true,
    [ACT_HARD_FORWARD_GROUND_KB]    = true,
    [ACT_HARD_BACKWARD_GROUND_KB]   = true,
}

-- FUNCTIONS --

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

local function better_coins_compat()
    local m = gMarioStates[0]
    local e = gWarioStates[m.playerIndex]
    for _,mods in pairs(gActiveMods) do
        if mods.name == "Better Coins" then
            betterCoins = true
        end
    end
    e.bank = mod_storage_load_number("bank", 0)
end
hook_event(HOOK_ON_MODS_LOADED, better_coins_compat)

local function dash_attacks(m, o, intee)
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
        o.oInteractStatus = INT_STATUS_INTERACTED | INT_STATUS_WAS_ATTACKED
    end

    if obj_has_behavior_id(o, id_bhvExclamationBox) ~= 0 then
        o.oInteractStatus = INT_STATUS_INTERACTED | INT_STATUS_WAS_ATTACKED
    end
end

local function humble_bump(m, x, y, act, arg)
    m.forwardVel = x
    m.vel.y = y
    set_mario_action(m, act, arg)
    m.particleFlags = m.particleFlags | PARTICLE_VERTICAL_STAR
    play_sound(SOUND_ACTION_BOUNCE_OFF_OBJECT, m.marioObj.header.gfx.cameraToObject)
    return 0
end

local function do_gold_cap(m)
    if m.playerIndex ~= 0 then return end

    m.particleFlags = m.particleFlags | PARTICLE_SPARKLES
    local e = gWarioStates[m.playerIndex]
    local freqMax = math.floor(65 - m.forwardVel)

    if freqMax < 2 then
        freqMax = 2
    end
    e.coinFreq = e.coinFreq + 1

    if m.forwardVel > 30 and e.availCoins > 0 then
        if e.coinFreq > freqMax then
            e.availCoins = e.availCoins - 1
            e.coinFreq = 0
            play_sound(SOUND_GENERAL_COIN_SPURT, m.marioObj.header.gfx.cameraToObject)
            spawn_sync_object(
            id_bhvMovingYellowCoin,
            E_MODEL_YELLOW_COIN,
            m.pos.x, (m.pos.y + 130), m.pos.z,
            function(o)
                o.oVelY = 15
                o.oFaceAngleYaw = m.faceAngle.y
                o.oForwardVel = m.forwardVel*0.9
            end)
            if e.availCoins == 0 then
                audio_sample_play(SOUND_TADA, m.pos, pause_check())
                m.particleFlags = m.particleFlags | PARTICLE_MIST_CIRCLE | PARTICLE_HORIZONTAL_STAR
            end
        end
    end
end

local function coin_add()
    local m = gMarioStates[0]
    local e = gWarioStates[0]
    if charSelect.get_options_status(powerScaling) == 1 then
        return 50/4
    else
        return e.wallet/4
    end
end

local function do_better_throw(m, o)
    if not o then return end
    if m.input & INPUT_NONZERO_ANALOG ~= 0 then
        o.oForwardVel = 60
        o.oVelY = 20
    else
        o.oForwardVel = 15
        o.oVelY = 60
    end
end

-- CUSTOM ACTIONS --

local function act_war_sh_bash(m)
    m.marioBodyState.eyeState = MARIO_EYES_LOOK_RIGHT
    m.marioBodyState.punchState = 67
    m.particleFlags = m.particleFlags | PARTICLE_DUST

    m.faceAngle.y = m.intendedYaw - approach_s32(math.s16(m.intendedYaw - m.faceAngle.y), 0, 0x400, 0x400)
    apply_slope_accel(m)

    if should_begin_sliding(m) ~= 0 then
		set_mario_action(m, ACT_BEGIN_SLIDING, 0)
	end

    if (m.actionTimer & 2 == 0) then
        audio_sample_play(SOUND_JWAR_SH_BASH, m.pos, pause_check())
    end

    if m.actionTimer < 2 then
        m.vel.y = 0
    end

    local stepResult = perform_ground_step(m)
    if stepResult == GROUND_STEP_HIT_WALL and m.wall ~= nil then
        if m.wall.object == nil or m.wall.object.oInteractType & (INTERACT_BREAKABLE) == 0 then
            return humble_bump(m, -40, 30, ACT_WAR_SH_BASH_JUMP, ARG_WARIO)
        end
    elseif stepResult == GROUND_STEP_LEFT_GROUND then
        set_mario_action(m, ACT_WAR_SH_BASH_JUMP, 0)
    end
        
    set_mario_anim_with_accel(m, MARIO_ANIM_RUNNING_UNUSED, m.forwardVel / 6 * 0x10000)
    smlua_anim_util_set_animation(m.marioObj, "JWAR_SH_BASH")

    -- speed
    local speedCap = bashSpeedBase + coin_add()
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

    if m.input & INPUT_A_PRESSED ~= 0 then
        if m.prevAction ~= ACT_WAR_SH_BASH_JUMP or (m.prevAction == ACT_WAR_SH_BASH_JUMP and m.actionTimer > 5) then
            audio_sample_play(SOUND_JWAR_LEAP, m.pos, pause_check())
            m.vel.y = 50
            set_mario_action(m, ACT_WAR_SH_BASH_JUMP, 0)
        end
    elseif m.input & INPUT_Z_PRESSED ~= 0 then
        set_mario_action(m, ACT_CROUCH_SLIDE, 0)
    elseif (m.controller.buttonDown & B_BUTTON == 0) or ((is_game_paused() or _G.charSelect.is_menu_open()) and m.playerIndex == 0) then
        if m.prevAction == ACT_WAR_SH_BASH_JUMP then
            set_mario_action(m, ACT_BRAKING, 0)
        elseif m.actionTimer > WAR_SH_BASH_MIN then
            set_mario_action(m, ACT_BRAKING, 0)
        end
    end

    m.actionTimer = m.actionTimer + 1
    return 0
end
hook_mario_action(ACT_WAR_SH_BASH, act_war_sh_bash)

local function act_war_sh_bash_jump(m)
    m.marioBodyState.eyeState = MARIO_EYES_LOOK_RIGHT

    if m.actionArg == ARG_WALUIGI then
        smlua_anim_util_set_animation(m.marioObj, "JWAL_SH_BASH_JUMP")
    else
        smlua_anim_util_set_animation(m.marioObj, "JWAR_SH_BASH_JUMP")
        m.marioBodyState.punchState = 67
    end

    --m.peakHeight = m.pos.y

    local stepResult = common_air_action_step(m, ACT_WAR_SH_BASH, MARIO_ANIM_RUNNING_UNUSED, AIR_STEP_NONE)
    if stepResult == AIR_STEP_HIT_WALL and m.wall ~= nil then
        if m.wall.object == nil or m.wall.object.oInteractType & (INTERACT_BREAKABLE) == 0 then
            return humble_bump(m, -40, 30, ACT_WAR_SH_BASH_JUMP, ARG_WARIO)
        end
    elseif stepResult == AIR_STEP_LANDED then
        if (m.forwardVel < 30 or m.controller.buttonDown & B_BUTTON == 0) then
            set_mario_action(m, ACT_FREEFALL_LAND, 0)
        end
    end

    if m.input & INPUT_Z_PRESSED ~= 0 then
        set_mario_action(m, ACT_HUMBLE_GP, ARG_WARIO)
    end

    m.actionTimer = m.actionTimer + 1
    return 0
end
hook_mario_action(ACT_WAR_SH_BASH_JUMP, act_war_sh_bash_jump)

local function act_war_roll(m)
    local e = gWarioStates[m.playerIndex]
    local speed = m.forwardVel
    local speedCap = 100

    e.prevPosY = m.pos.y

    m.particleFlags = m.particleFlags | PARTICLE_DUST
    m.faceAngle.y = m.intendedYaw - approach_s32(math.s16(m.intendedYaw - m.faceAngle.y), 0, 0x200, 0x200)
    apply_slope_accel(m)

    if (m.marioObj.header.gfx.animInfo.animFrame % 30) == 0 then
        play_sound(SOUND_ACTION_TWIRL, m.marioObj.header.gfx.cameraToObject)
    end

    local stepResult = perform_ground_step(m)
    if stepResult == GROUND_STEP_HIT_WALL and m.wall ~= nil then
        if m.wall.object == nil or m.wall.object.oInteractType & (INTERACT_BREAKABLE) == 0 then
            m.particleFlags = m.particleFlags | PARTICLE_VERTICAL_STAR
            m.forwardVel = -15
            return set_mario_action(m, ACT_BACKWARD_GROUND_KB, 0)
        end
    elseif stepResult == GROUND_STEP_LEFT_GROUND then
        set_mario_action(m, ACT_FREEFALL, 0)
    end
        
    set_mario_anim_with_accel(m, MARIO_ANIM_FORWARD_SPINNING, (m.forwardVel / 50) * 0x10000)

    if speed <= speedCap then
        speed = speed - 0.3 + (e.prevPosY - m.pos.y)/15
    else
        speed = speedCap
    end
    if speed < 31 then
        if m.input & INPUT_NONZERO_ANALOG ~= 0 then
            set_mario_action(m, ACT_WALKING, 0)
        elseif speed < 10 then
            set_mario_action(m, ACT_BRAKING, 0)
        end
    end

    mario_set_forward_vel(m, speed)

    if m.input & INPUT_A_PRESSED ~= 0 then
        set_mario_action(m, ACT_JUMP, 0)
    elseif m.input & INPUT_B_PRESSED ~= 0 then
        set_mario_action(m, ACT_FORWARD_ROLLOUT, 0)
        m.forwardVel = m.forwardVel * 0.7
        m.marioObj.header.gfx.animInfo.animID = -1
    end

    m.actionTimer = m.actionTimer + 1
    return 0
end
hook_mario_action(ACT_WAR_ROLL, act_war_roll)

local function act_war_carry(m)

    if should_begin_sliding(m) ~= 0 then
        return set_mario_action(m, ACT_HOLD_BEGIN_SLIDING, 0);
    end

    if (m.input & INPUT_A_PRESSED) ~= 0 then
        return set_mario_action(m, ACT_HOLD_JUMP, 0);
    end

    if (m.input & INPUT_NONZERO_ANALOG) == 0 then
        m.forwardVel = m.forwardVel * 0.95;
        if m.forwardVel < 1 then
            return set_mario_action(m, ACT_HOLD_IDLE, 0)
        end
    end

    if (m.input & INPUT_Z_PRESSED) ~= 0 then
        mario_drop_held_object(m)
        return set_mario_action(m, ACT_CROUCH_SLIDE, 0);
    end

    if m.input & INPUT_B_PRESSED ~= 0 then
        m.faceAngle.y = m.intendedYaw
        return set_mario_action(m, ACT_THROWING, 0)
    end

    update_walking_speed(m);

    local stepResult = perform_ground_step(m)
    if stepResult == GROUND_STEP_LEFT_GROUND then
        set_mario_action(m, ACT_HOLD_FREEFALL, 0)
    elseif stepResult == GROUND_STEP_NONE then
        local val04 = m.intendedMag > m.forwardVel and m.intendedMag or m.forwardVel
        if val04 < 4 then
            val04 = 4
        end
        set_mario_anim_with_accel(m, CHAR_ANIM_RUN_WITH_LIGHT_OBJ, (val04 / 4.0 * 0x10000))
        play_step_sound(m, 9, 45)
        if (m.intendedMag - m.forwardVel > 16.0) then
            m.particleFlags = PARTICLE_DUST;
        end
    end

    m.actionTimer = m.actionTimer + 1
    return 0
end
hook_mario_action(ACT_WAR_CARRY, act_war_carry)

local function act_wal_sh_bash(m)
    m.marioBodyState.eyeState = MARIO_EYES_LOOK_RIGHT
    m.particleFlags = m.particleFlags | PARTICLE_DUST

    m.faceAngle.y = m.intendedYaw - approach_s32(math.s16(m.intendedYaw - m.faceAngle.y), 0, 0x400, 0x400)
    apply_slope_accel(m)

    if (m.actionTimer & 2 == 0) then
        audio_sample_play(SOUND_JWAL_SH_BASH, m.pos, pause_check())
    end

    m.vel.y = 0

    local stepResult = perform_ground_step(m)
    if stepResult == GROUND_STEP_HIT_WALL and m.wall ~= nil then
        if m.wall.object == nil or m.wall.object.oInteractType & (INTERACT_BREAKABLE) == 0 then
            return humble_bump(m, -40, 30, ACT_WAR_SH_BASH_JUMP, ARG_WALUIGI)
        end
    elseif stepResult == GROUND_STEP_LEFT_GROUND then
        m.action = ACT_WAL_SH_BASH_JUMP
    end
        
    set_mario_anim_with_accel(m, MARIO_ANIM_RUNNING_UNUSED, m.forwardVel / 4 * 0x10000)
    smlua_anim_util_set_animation(m.marioObj, "JWAL_SH_BASH")

    -- speed
    local speedCap = bashSpeedBase - 10 + coin_add()
    local speed = m.forwardVel

    if m.actionTimer < 3 then
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
    local e = gWarioStates[m.playerIndex]

    m.marioBodyState.eyeState = MARIO_EYES_LOOK_RIGHT
    m.particleFlags = m.particleFlags | PARTICLE_DUST
    e.canBash = false

    m.faceAngle.y = m.intendedYaw - approach_s32(math.s16(m.intendedYaw - m.faceAngle.y), 0, 0x400, 0x400)

    if (m.actionTimer & 2 == 0) then
        audio_sample_play(SOUND_JWAL_SH_BASH, m.pos, pause_check())
    end

    m.vel.y = 0

    local stepResult = common_air_action_step(m, ACT_WAR_SH_BASH, MARIO_ANIM_RUNNING_UNUSED, AIR_STEP_NONE)
    if stepResult == AIR_STEP_HIT_WALL and m.wall ~= nil then
        if m.wall.object == nil or m.wall.object.oInteractType & (INTERACT_BREAKABLE) == 0 then
            return humble_bump(m, -40, 30, ACT_WAR_SH_BASH_JUMP, ARG_WALUIGI)
        end
    elseif stepResult == AIR_STEP_LANDED then
        set_mario_action(m, ACT_FREEFALL_LAND, 0)
    end

    set_mario_anim_with_accel(m, MARIO_ANIM_RUNNING_UNUSED, m.forwardVel / 4 * 0x10000)
    smlua_anim_util_set_animation(m.marioObj, "JWAL_SH_BASH")

    -- speed
    local speed = m.forwardVel

    if m.actionTimer < WAL_SH_BASH_MAX then
        speed = bashSpeedBase - 10 + coin_add()
        mario_set_forward_vel(m, speed)
    else
        m.forwardVel = speed - 15
        set_mario_action(m, ACT_FREEFALL, 0)
    end

    if m.input & INPUT_Z_PRESSED ~= 0 then
        set_mario_action(m, ACT_HUMBLE_GP, 1)
    end

    m.actionTimer = m.actionTimer + 1
    return 0
end
hook_mario_action(ACT_WAL_SH_BASH_JUMP, act_wal_sh_bash_jump)

local function act_humble_gp(m)
    local e = gWarioStates[m.playerIndex]

    if m.actionState == 0 then
        e.gfxY = 0x12000
        play_character_sound(m, CHAR_SOUND_GROUND_POUND_WAH)
        m.actionState = 1
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
        if m.actionArg ~= ARG_SYRUP then
            set_mario_action(m, ACT_HUMBLE_GP_CANCEL, m.actionArg)
        elseif e.chop > 0 then
            m.faceAngle.y = m.intendedYaw
            set_mario_action(m, ACT_SYP_CHOP, 1)
        end
    elseif m.input & INPUT_A_PRESSED ~= 0 and m.actionTimer > 0 then
        return set_mario_action(m, ACT_CORKSCREW, m.actionArg)
    elseif m.actionTimer > 2 and m.input & INPUT_Z_PRESSED ~= 0 and (m.pos.y - m.floorHeight) > 500 then
        return set_mario_action(m, ACT_SUPER_GP, m.actionArg)
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

local function act_humble_gp_cancel(m)
    local anim = MARIO_ANIM_TRIPLE_JUMP_GROUND_POUND
    local act = ACT_BUTT_SLIDE_AIR
    local pitch = m.vel.y * -1

    if m.actionArg == ARG_WALUIGI then
        if m.actionTimer == 1 then
            play_sound(SOUND_ACTION_SWIM_FAST, m.marioObj.header.gfx.cameraToObject)
        end
        anim = MARIO_ANIM_SWIM_PART1
        act = ACT_DIVE_SLIDE
        if m.actionTimer < 8 then
            m.particleFlags = m.particleFlags | PARTICLE_SNOW
        end
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

    m.marioObj.header.gfx.angle.x = m.actionArg == ARG_WALUIGI and degrees_to_sm64(pitch) or m.faceAngle.x
    m.marioObj.header.gfx.pos.y = m.pos.y - (m.actionArg == ARG_WALUIGI and 30 or 0)

    m.actionTimer = m.actionTimer + 1
    return 0
end
hook_mario_action(ACT_HUMBLE_GP_CANCEL, act_humble_gp_cancel)

local function act_super_gp(m)
    local e = gWarioStates[m.playerIndex]
    smlua_anim_util_set_animation(m.marioObj, "JWAR_SUPER_GP")
    m.marioBodyState.handState = MARIO_HAND_OPEN

    if m.actionState == 0 then
        m.vel.y = 30
        m.actionTimer = 0
        vec3f_copy(e.hardPos, m.pos)
        set_mario_particle_flags(m, PARTICLE_HORIZONTAL_STAR, 0)
        m.actionState = 1
    end

    if m.actionTimer == 0 then
        play_character_sound(m, CHAR_SOUND_YAHOO_WAHA_YIPPEE)
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
        local oPost = obj_get_nearest_object_with_behavior_id(m.marioObj, id_bhvWoodenPost)
        local allowable = 50
        if oPost ~= nil then
            if math.abs(oPost.oPosX - m.pos.x) < allowable and math.abs(oPost.oPosZ - m.pos.z) < allowable and math.abs(oPost.oPosY - m.pos.y) < 210 then
                --m.pos.x = o.oPosX
                --m.pos.z = o.oPosZ
                m.pos.y = oPost.oPosY - oPost.oWoodenPostOffsetY
                oPost.oWoodenPostOffsetY = -190
                spawn_triangle_break_particles(10, 139, 0.3, 3)
                play_sound(SOUND_GENERAL_POUND_WOOD_POST, m.marioObj.header.gfx.cameraToObject)
            end
        end
    end

    if m.vel.y < - 30 then
        if m.actionTimer % 4 == 0 and m.actionTimer > 1 then
            play_sound_with_freq_scale(SOUND_GENERAL_SWISH_WATER, m.marioObj.header.gfx.cameraToObject, 1.2)
        end
        if m.actionArg == ARG_SYRUP then
            spawn_mist_particles_variable(1, 50, math.abs((m.vel.y + 30)/6))
        end
    end

    m.vel.x = 0
    m.vel.z = 0
    m.vel.y = m.vel.y - 4
    m.pos.x = e.hardPos.x
    m.pos.z = e.hardPos.z
    m.forwardVel = 0
    m.peakHeight = m.pos.y
    e.gfxY = m.vel.y < 0 and e.gfxY + 0x100 * m.vel.y or 0
    m.marioObj.header.gfx.angle.y = m.faceAngle.y + e.gfxY
    m.marioObj.header.gfx.pos.y = m.pos.y - 20

    m.actionTimer = m.actionTimer + 1
    return 0
end
hook_mario_action(ACT_SUPER_GP, act_super_gp, INT_GROUND_POUND)

local function act_corkscrew(m)
    local e = gWarioStates[m.playerIndex]

    m.marioBodyState.handState = MARIO_HAND_OPEN

    if m.actionTimer == 1 then
        e.gfxY = 0
    elseif m.actionTimer == 2 then
        m.faceAngle.y = m.intendedYaw
        e.gfxY = 0x20000
        if m.actionArg == ARG_SYRUP then
            e.gfxY = 0
        end
    elseif m.actionTimer > 1 then
        e.gfxY = e.gfxY * 0.9
        if m.actionTimer < 15 then
            m.vel.y = 25
            if m.actionArg ~= ARG_SYRUP then
                m.particleFlags = m.particleFlags | PARTICLE_SPARKLES
            end
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

    if m.actionArg == ARG_WALUIGI then
        if m.actionTimer == 2 then
            play_character_sound(m, CHAR_SOUND_YAHOO_WAHA_YIPPEE)
            audio_sample_play(SOUND_JWAL_CORKSCREW, m.pos, pause_check())
        end
        smlua_anim_util_set_animation(m.marioObj, "JWAL_CORKSCREW")
        if m.vel.y > -10 then
            m.marioBodyState.eyeState = MARIO_EYES_CLOSED
        end
    elseif m.actionArg == ARG_SYRUP then
        m.marioBodyState.handState = MARIO_HAND_PEACE_SIGN
        if m.actionTimer == 2 then
            --play_character_sound(m, CHAR_SOUND_TWIRL_BOUNCE)
            audio_sample_play(SOUND_JSYP_CORKSCREW, m.pos, pause_check())
        end
        smlua_anim_util_set_animation(m.marioObj, "JSYP_CORKSCREW")
        if (m.actionTimer) % 2 == 0 and m.actionTimer < 18 and m.actionTimer > 0 then
            m.particleFlags = m.particleFlags | PARTICLE_MIST_CIRCLE
        end
        if m.vel.y > -15 then
            m.marioBodyState.eyeState = MARIO_EYES_LOOK_RIGHT
        else
            m.marioBodyState.eyeState = MARIO_EYES_LOOK_DOWN
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

local function act_syp_slash(m)
    m.marioBodyState.eyeState = MARIO_EYES_LOOK_LEFT
    m.particleFlags = m.particleFlags | PARTICLE_DUST
    m.marioBodyState.handState = MARIO_HAND_PEACE_SIGN

    apply_slope_accel(m)

    if should_begin_sliding(m) ~= 0 then
		set_mario_action(m, ACT_BEGIN_SLIDING, 0)
	end

    -- speed
    local speed = m.forwardVel

    if m.actionState == 0 and m.prevAction ~= ACT_SYP_SLASH then
        m.actionState = 1
        m.particleFlags = m.particleFlags | PARTICLE_TRIANGLE
        audio_sample_play(SOUND_JSYP_SLASH, m.pos, pause_check())
        if speed < 70 then
            speed = 70
        else
            speed = m.forwardVel + 20
        end
    else
        speed = speed - 2
        play_sound(SOUND_MOVING_TERRAIN_SLIDE + m.terrainSoundAddend, m.marioObj.header.gfx.cameraToObject)
    end
    mario_set_forward_vel(m, speed)

    local stepResult = perform_ground_step(m)
    if stepResult == GROUND_STEP_HIT_WALL and m.wall ~= nil then
        if m.wall.object == nil or m.wall.object.oInteractType & (INTERACT_BREAKABLE) == 0 then
            mario_bonk_reflection(m, 99999)
            m.particleFlags = m.particleFlags | PARTICLE_VERTICAL_STAR
            return set_mario_action(m, ACT_SOFT_BACKWARD_GROUND_KB, 0)
        end
    elseif stepResult == GROUND_STEP_LEFT_GROUND then
        set_mario_action(m, ACT_FREEFALL, 0)
    end

    set_mario_animation(m, MARIO_ANIM_RUNNING_UNUSED)
    smlua_anim_util_set_animation(m.marioObj, "JSYP_SLASH")

    if m.forwardVel < 33 then
        if m.input & INPUT_NONZERO_ANALOG ~= 0 then
            set_mario_action(m, ACT_WALKING, 0)
        elseif m.forwardVel < 5 then
            set_mario_action(m, ACT_IDLE, 0)
        end
    end

    if m.input & INPUT_Z_PRESSED ~= 0 then
        set_mario_action(m, ACT_CROUCH_SLIDE, 0)
    elseif m.input & INPUT_A_PRESSED ~= 0 then
        if m.forwardVel > 40 then
            m.vel.y = m.forwardVel
            set_mario_action(m, ACT_SYP_CANNON, 1)
        else
            set_mario_action(m, ACT_JUMP, 0)
        end
    elseif m.input & INPUT_B_PRESSED ~= 0 and m.actionTimer > 5 then
        set_mario_action(m, ACT_BACKWARD_ROLLOUT, 0)
        m.forwardVel = -15
    end

    m.actionTimer = m.actionTimer + 1
    return 0
end
hook_mario_action(ACT_SYP_SLASH, act_syp_slash)

local function act_syp_chop(m)
    local e = gWarioStates[m.playerIndex]

    m.marioBodyState.handState = MARIO_HAND_PEACE_SIGN

    if m.actionState == 0 then
        e.prevVel = m.forwardVel
        e.chop = e.chop - 1
        if m.actionArg == 1 then
            m.actionTimer = 9
        end
        m.actionState = 1
    end

    if m.actionTimer < 10 then
        m.vel.y = m.vel.y * 0.7
        m.forwardVel = e.prevVel
    elseif m.actionTimer == 10 then
        set_anim_to_frame(m, 10)
        if m.actionArg == 1 then m.forwardVel = 20 end
        m.vel.y = 30
        m.particleFlags = m.particleFlags | PARTICLE_TRIANGLE
        audio_sample_play(SOUND_JSYP_CHOP, m.pos, pause_check())
    elseif m.actionTimer > 10 then
        if e.chop > 0 and m.input & INPUT_B_PRESSED ~= 0 then
            set_mario_action(m, ACT_SYP_CHOP, 0)
            m.marioObj.header.gfx.animInfo.animID = -1
            e.chop = e.chop - 1
        elseif m.input & INPUT_Z_PRESSED ~= 0 then
            set_mario_action(m, ACT_HUMBLE_GP, ARG_SYRUP)
        end
    end

    smlua_anim_util_set_animation(m.marioObj, "JSYP_CHOP")

    local stepResult = common_air_action_step(m, ACT_FREEFALL_LAND, MARIO_ANIM_LAND_FROM_DOUBLE_JUMP, AIR_STEP_CHECK_LEDGE_GRAB)
    if stepResult == AIR_STEP_HIT_WALL and m.wall ~= nil then
        if m.wall.object == nil or m.wall.object.oInteractType & (INTERACT_BREAKABLE) == 0 then
            set_mario_action(m, ACT_AIR_HIT_WALL, 0)
            m.forwardVel = -8
        end
    elseif m.actionTimer > 35 then
        set_mario_action(m, ACT_FREEFALL, 0)
    end

    m.actionTimer = m.actionTimer + 1
    return 0
end
hook_mario_action(ACT_SYP_CHOP, act_syp_chop)

local function act_syp_cannon(m)
    local e = gWarioStates[m.playerIndex]

    m.particleFlags = m.particleFlags | PARTICLE_DUST
    local landingAction = ACT_BRAKING
    if m.actionArg == 0 then
        m.peakHeight = m.pos.y
        landingAction = ACT_TRIPLE_JUMP_LAND
    elseif m.input & INPUT_NONZERO_ANALOG ~= 0 then
        landingAction = ACT_FREEFALL_LAND
    end

    local rate = math.abs(m.forwardVel) / 30 * 0x10000
    local frame = m.marioObj.header.gfx.animInfo.animFrame

    if rate < 0x10000 then
        rate = 0x10000
    end

    if (frame % 30) == 0 then
        play_sound(SOUND_ACTION_TWIRL, m.marioObj.header.gfx.cameraToObject)
    end

    local stepResult = common_air_action_step(m, landingAction, MARIO_ANIM_FORWARD_SPINNING, AIR_STEP_CHECK_LEDGE_GRAB)
    if stepResult == AIR_STEP_HIT_WALL and m.wall ~= nil then
        if m.wall.object == nil or m.wall.object.oInteractType & (INTERACT_BREAKABLE) == 0 then
            if m.input & INPUT_A_DOWN ~= 0 then
                m.faceAngle.y = m.faceAngle.y - 0x8000
                set_mario_action(m, ACT_SYP_VERTICAL_BOOST, 0)
            else
                set_mario_action(m, ACT_AIR_HIT_WALL, 0)
            end
        end
    end
    set_mario_anim_with_accel(m, MARIO_ANIM_FORWARD_SPINNING, rate)

    m.actionTimer = m.actionTimer + 1
    return 0
end
hook_mario_action(ACT_SYP_CANNON, act_syp_cannon)

local function act_syp_vertical_boost(m)
    local e = gWarioStates[m.playerIndex]
    m.marioBodyState.handState = MARIO_HAND_OPEN

    if m.actionState == 0 then
        m.vel.y = m.forwardVel
        m.forwardVel = 0
        m.vel.x = 0
        m.vel.z = 0
        e.gfxY = 0x10000
        m.actionState = m.actionState + 1
        set_mario_particle_flags(m, PARTICLE_MIST_CIRCLE, 0)
        play_character_sound(m, CHAR_SOUND_HOOHOO)
        play_sound_with_freq_scale(SOUND_OBJ_CANNON4, m.marioObj.header.gfx.cameraToObject, 1)
    end
    e.gfxY = math.lerp(e.gfxY, 0, 0.2)

    local stepResult = common_air_action_step(m, ACT_FREEFALL_LAND, MARIO_ANIM_DOUBLE_JUMP_FALL, AIR_STEP_CHECK_LEDGE_GRAB)
    if stepResult == AIR_STEP_HIT_WALL then
        return set_mario_action(m, ACT_AIR_HIT_WALL, 0)
    elseif stepResult == AIR_STEP_GRABBED_LEDGE then
        m.marioObj.header.gfx.animInfo.animID = -1
    end

    if m.vel.y <= 0 then
        if m.input & INPUT_B_PRESSED ~= 0 then
            return set_mario_action(m, ACT_DIVE, 0)
        --elseif m.input & INPUT_Z_PRESSED ~= 0 then
        --    return set_mario_action(m, ACT_HUMBLE_GP, ARG_SYRUP) -- might be too busted idk. Need feedback
        end
    end

    if m.vel.y > 10 then
        set_mario_particle_flags(m, PARTICLE_DUST, 0)
    end

    m.peakHeight = m.pos.y
    m.marioObj.header.gfx.angle.y = m.faceAngle.y + e.gfxY

    m.actionTimer = m.actionTimer + 1
    return 0
end
hook_mario_action(ACT_SYP_VERTICAL_BOOST, act_syp_vertical_boost)

local function act_bomb_stash(m)
    local e = gWarioStates[m.playerIndex]
    local accel = m.actionArg == 0 and -0x10000 or 0x10000
    local exitAction = m.actionArg == 0 and ACT_IDLE or ACT_HOLD_IDLE
    local exitFrame = (m.actionArg == 0 or m.input & INPUT_NONZERO_ANALOG ~= 0) and 20 or 30
    local animObj = 16
    local hand = gVec3fZero{}

    get_mario_anim_part_pos(m, MARIO_ANIM_PART_RIGHT_HAND, hand)
    set_mario_anim_with_accel(m, CHAR_ANIM_THROW_CATCH_KEY, accel*2)

    if m.actionState == 0 then
        if m.actionArg == 0 then
            set_anim_to_frame(m, 40)
        end
        m.actionState = 1
    end

    stationary_ground_step(m)

    if m.marioObj.header.gfx.animInfo.animFrame == animObj then
        if m.actionArg == 0 then
            m.heldObj.activeFlags = ACTIVE_FLAG_DEACTIVATED
            m.heldObj = nil
            m.usedObj = nil
            e.bombsStashed = e.bombsStashed + 1
        elseif m.actionArg == 1 then
            spawn_non_sync_object(id_bhvBobomb, E_MODEL_BLACK_BOBOMB, m.pos.x, m.pos.y, m.pos.z, function(o)
                m.usedObj = o
                m.heldObj = o
                o.oHeldState = HELD_HELD
                o.oBobombFuseTimer = -300
                mario_grab_used_object(m)
            end)
            e.bombsStashed = e.bombsStashed - 1
        end
    end

    if m.actionTimer >= exitFrame then
        return set_mario_action(m, exitAction, 0)
    end

    m.actionTimer = m.actionTimer + 1
    return 0
end
hook_mario_action(ACT_BOMB_STASH, act_bomb_stash)

-- UPDATES --

local jumpTable = {
    [ACT_JUMP] = true,
    [ACT_DOUBLE_JUMP] = true,
    [ACT_TRIPLE_JUMP] = false,
    [ACT_BACKFLIP] = true,
    [ACT_SIDE_FLIP] = true
}

local function wario_update(m)
    local e = gWarioStates[m.playerIndex]

    -- torso tilt
    if m.action == ACT_WALKING then
        if m.marioObj.header.gfx.animInfo.animID == MARIO_ANIM_RUNNING then
            if m.flags & MARIO_METAL_CAP == 0 then
                m.marioBodyState.torsoAngle.x = 2100
            end
        end
        if m.marioObj.header.gfx.animInfo.animID == MARIO_ANIM_WALKING then
                m.marioBodyState.torsoAngle.x = 0
        end

        if m.marioBodyState.torsoAngle.z < -3000 then
            m.marioBodyState.eyeState = MARIO_EYES_LOOK_RIGHT
        elseif m.marioBodyState.torsoAngle.z > 3000 then
            m.marioBodyState.eyeState = MARIO_EYES_LOOK_LEFT
        end

        if m.marioObj.header.gfx.animInfo.animID == MARIO_ANIM_RUNNING and m.flags & MARIO_METAL_CAP == 0 and smlua_anim_util_get_current_animation_name(m.marioObj) == "JWAR_RUN" then
            local frame = m.marioObj.header.gfx.animInfo.animFrame
            local scale = 1

            if (frame > 6 and frame < 10) or (frame > 50 and frame < 54) then
                scale = 0.8
            elseif (frame > 4 and frame < 12) or (frame > 48 and frame < 56) then
                scale = 0.85
            elseif (frame > 2 and frame < 14) or (frame > 46 and frame < 58) then
                scale = 0.9
            elseif (frame > 0 and frame < 16) or (frame > 44 and frame < 56) then
                scale = 0.95
            end

            m.marioObj.header.gfx.scale.y = scale
        end
    end

    -- after frames
    --if (m.playerIndex == 0 or is_player_active(m) ~= 0) and m.marioObj.header.gfx.node.flags & GRAPH_RENDER_ACTIVE ~= 0 then
    if ((m.action == ACT_WAR_SH_BASH or m.action == ACT_WAR_SH_BASH_JUMP) and m.forwardVel >= (bashSpeedBase + 10))
    or (m.action == ACT_CORKSCREW and m.vel.y > 20)
    or (m.action == ACT_SUPER_GP and m.vel.y < -10) then
        --if (m.actionTimer) % 3 == 0 then
        --    spawn_non_sync_object(id_bhvParticleClone, E_MODEL_PARTICLE_CLONE_WARIO, m.pos.x, m.pos.y, m.pos.z,
        --    function(o) o.globalPlayerIndex = network_global_index_from_local(m.playerIndex) end)
        --end
        if m.flags & MARIO_VANISH_CAP == 0 then
            spawn_after_images(m, 2, 6, 150, ARG_WARIO)
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
    elseif m.action == ACT_WAR_SH_BASH_JUMP and m.forwardVel < 0 and m.vel.y > 0 then
        local scale = math.abs(m.vel.y/80)
        m.marioObj.header.gfx.scale.x = 1 - scale
        m.marioObj.header.gfx.scale.y = 1 + scale
        m.marioObj.header.gfx.scale.z = 1 - scale
    end

    -- slower swimming
    if (m.action & ACT_FLAG_SWIMMING) ~= 0 then
        m.forwardVel = m.forwardVel * 0.98
        if m.pos.y > m.floorHeight and m.pos.y < (m.waterLevel - 82) then
            m.pos.y = m.pos.y - 2.5
        end
    end

    -- gold cap
    if m.flags & MARIO_METAL_CAP ~= 0 and e.availCoins > 0 then
        do_gold_cap(m)
    end

    -- roll
    if m.action == ACT_BUTT_SLIDE and ((m.input & INPUT_Z_PRESSED ~= 0) or (m.prevAction == ACT_BUTT_SLIDE_AIR and m.input & INPUT_Z_DOWN ~= 0)) and m.forwardVel > 30 then
        set_mario_action(m, ACT_WAR_ROLL, 0)
    end

    -- better throwing
    if (m.action == ACT_THROWING and m.actionTimer == 8) or (m.action == ACT_AIR_THROW and m.actionTimer == 5) then
        do_better_throw(m, m.usedObj)
    end

    --if m.controller.buttonPressed & Y_BUTTON ~= 0 then -- for debugging
    --    m.numCoins = 100
    --end
end

local function wario_set_action(m)
    local e = gWarioStates[m.playerIndex]

    -- shoulder bash
    if (m.action == ACT_MOVE_PUNCHING and m.intendedMag > 30 and m.input & INPUT_A_DOWN == 0 and m.forwardVel >= 0) or (m.action == ACT_DIVE and m.pos.y == m.floorHeight and m.input & INPUT_A_DOWN == 0) then
        set_mario_action(m, ACT_WAR_SH_BASH, 0)
    end

    -- sick tricks with wario
    if m.action == ACT_WATER_PLUNGE and m.prevAction == ACT_TOP_OF_POLE_JUMP then
        m.vel.y = 0
        m.pos.y = m.waterLevel
        set_mario_action(m, ACT_WATER_DEATH, 0)
    end

    -- jump height
    if jumpTable[m.action] and m.action ~= ACT_BACKFLIP then
        m.vel.y = m.vel.y - 3
    end

    if m.action == ACT_HOLD_HEAVY_IDLE then
        return set_mario_action(m, ACT_HOLD_IDLE, 0)
    end
end

local function wario_before_set_action(m, act)
    if act == ACT_GROUND_POUND then
        return set_mario_action(m, ACT_HUMBLE_GP, ARG_WARIO)
    elseif act == ACT_HOLD_WALKING then
        return ACT_WAR_CARRY
    elseif act == ACT_AIR_THROW then
        m.faceAngle.y = m.intendedYaw
    end
end

local function wario_interact(m, o, type)
    local e = gWarioStates[m.playerIndex]
    local damagableTypes = (INTERACT_BOUNCE_TOP | INTERACT_BOUNCE_TOP2 | INTERACT_HIT_FROM_BELOW | 2097152 | INTERACT_KOOPA | INTERACT_BREAKABLE | INTERACT_GRABBABLE | INTERACT_BULLY)

    if (m.action == ACT_WAR_SH_BASH) and (type & damagableTypes) ~= 0 then
        dash_attacks(m, o, type)
        if m.flags & MARIO_METAL_CAP == 0 and obj_has_behavior_id(o, id_bhvBreakableBox) == 0 then
            humble_bump(m, -40, 30, ACT_WAR_SH_BASH_JUMP, ARG_WARIO)
        end
        return false
    end

    if (m.action == ACT_WAR_SH_BASH_JUMP) and (type & damagableTypes) ~= 0 and m.forwardVel > 10 then
        dash_attacks(m, o, type)
        humble_bump(m, -40, 15, ACT_WAR_SH_BASH_JUMP, ARG_WARIO)
        return false
    end

    if m.action == ACT_WAR_ROLL and obj_has_behavior_id(o, id_bhvBreakableBox) ~= 0 then
        if m.forwardVel > 40 then
            o.oInteractStatus = INT_STATUS_INTERACTED | INT_STATUS_WAS_ATTACKED
        else
            m.particleFlags = m.particleFlags | PARTICLE_VERTICAL_STAR
            m.forwardVel = -15
            return set_mario_action(m, ACT_BACKWARD_GROUND_KB, 0)
        end
    end

    if m.action == ACT_PICKING_UP and obj_has_behavior_id(o, id_bhvBobomb) ~= 0 then
        o.oBobombFuseTimer = -150
    end
end

local function wario_attack(a, v)
    if (a.action == ACT_WAR_SH_BASH or a.action == ACT_WAR_SH_BASH_JUMP) and a.forwardVel > 5 then
        humble_bump(a, -40, 30, ACT_WAR_SH_BASH_JUMP, ARG_WARIO)
    end
end

local function wario_level_init()
    local m = gMarioStates[0]
    local e = gWarioStates[m.playerIndex]

    e.availCoins = availCoinsMax
    --mod_storage_save_number("bank", e.bank)
    djui_chat_message_create(tostring(mod_storage_save_integer("bank", e.bank)))
end

-------------
-- WALUIGI --
-------------

local function waluigi_update(m)
    local e = gWarioStates[m.playerIndex]

    -- torso tilt
    if m.action == ACT_WALKING then
        m.marioBodyState.torsoAngle.x = m.forwardVel * -50

        if m.marioBodyState.torsoAngle.z < -3000 then
            m.marioBodyState.eyeState = MARIO_EYES_LOOK_RIGHT
        elseif m.marioBodyState.torsoAngle.z > 3000 then
            m.marioBodyState.eyeState = MARIO_EYES_LOOK_LEFT
        end
    end

      -- after frames
    if ((m.action == ACT_WAL_SH_BASH or m.action == ACT_WAL_SH_BASH_JUMP) and m.forwardVel >= (bashSpeedBase + 10))
    or (m.action == ACT_CORKSCREW and m.vel.y > 20)
    or (m.action == ACT_SUPER_GP and m.vel.y < -10) then
        if m.flags & MARIO_VANISH_CAP == 0 then
            spawn_after_images(m, 2, 6, 150, ARG_WALUIGI)
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
    elseif m.action == ACT_WAR_SH_BASH_JUMP and m.forwardVel < 0 and m.vel.y > 0 then
        local scale = math.abs(m.vel.y/80)
        m.marioObj.header.gfx.scale.x = 1 - scale
        m.marioObj.header.gfx.scale.y = 1 + scale
        m.marioObj.header.gfx.scale.z = 1 - scale
    end

    -- gold cap
    if m.flags & MARIO_METAL_CAP ~= 0 and e.availCoins > 0 then
        do_gold_cap(m)
    end

    -- better throwing
    if (m.action == ACT_THROWING and m.actionTimer == 8) or (m.action == ACT_AIR_THROW and m.actionTimer == 5) then
        do_better_throw(m, m.usedObj)
    end

    -- bomb stashing
    if m.controller.buttonPressed & L_TRIG ~= 0 then
        if m.action == ACT_HOLD_IDLE then
            if obj_has_behavior_id(m.heldObj, id_bhvBobomb) ~= 0 and e.bombsStashed < maxBombs then
                return set_mario_action(m, ACT_BOMB_STASH, 0)
            end
        elseif m.action == ACT_IDLE then
            if e.bombsStashed > 0 then
                return set_mario_action(m, ACT_BOMB_STASH, 1)
            end
        end
    end

    -- hud
    if m.action == ACT_BOMB_STASH then
        e.bombHudTimer = bombHudTimerMax
    else
        e.bombHudTimer = e.bombHudTimer - 1
    end
    local targetPos = (e.bombHudTimer > 0 or e.bombsStashed == maxBombs) and 22 or -60
    e.bombHudOffset = math.lerp(e.bombHudOffset, targetPos, 0.2)
    e.bombHudBob = e.bombHudBob > 0 and e.bombHudBob - 1 or 0
end

local function waluigi_set_action(m)
    local e = gWarioStates[m.playerIndex]

    -- shoulder bash
    if (m.action == ACT_MOVE_PUNCHING and m.intendedMag > 30 and m.input & INPUT_A_DOWN == 0 and m.forwardVel >= 0) or (m.action == ACT_DIVE and m.pos.y == m.floorHeight and m.input & INPUT_A_DOWN == 0) then
        set_mario_action(m, ACT_WAL_SH_BASH, 0)
    end
    if m.action == ACT_DIVE and m.vel.y < 20 and m.input & INPUT_NONZERO_ANALOG == 0 and e.canBash and m.forwardVel >= 0 then
        set_mario_action(m, ACT_WAL_SH_BASH_JUMP, 0)
        e.canBash = false
    end
    if m.pos.y == m.floorHeight and not e.canBash then
        e.canBash = true
    end

    -- jump height
    if jumpTable[m.action] or m.action == ACT_HOLD_JUMP then
        m.vel.y = m.vel.y + 3
    end

    -- lose bombs
    if e.bombsStashed == maxBombs then
        if loseBombActions[m.action] then
            for i=0, maxBombs - 1 do
                local newAngle = i * (0x10000/maxBombs)
                local newDist = 200
                spawn_non_sync_object(id_bhvBobomb, E_MODEL_BLACK_BOBOMB, m.pos.x + (newDist * sins(newAngle)), m.pos.y + (newDist * 2), m.pos.z + (newDist * coss(newAngle)), function(o)
                    o.oAction = BOBOMB_ACT_LAUNCHED
                    o.oForwardVel = math.random(5, 15)
                    o.oVelY = math.random(30, 45)
                    o.oMoveAngleYaw = newAngle
                end)
            end
            set_mario_particle_flags(m, PARTICLE_HORIZONTAL_STAR, 0)
            e.bombHudTimer = 80
            e.bombsStashed = 0
            e.bombHudBob = 50
        end
    end
end

local function waluigi_before_set_action(m, act)
    local e = gWarioStates[m.playerIndex]
    if act == ACT_GROUND_POUND then
        return set_mario_action(m, ACT_HUMBLE_GP, ARG_WALUIGI)
    elseif act == ACT_HOLD_WALKING then
        return ACT_WAR_CARRY
    elseif act == ACT_AIR_THROW then
        m.faceAngle.y = m.intendedYaw
    end
end

local function waluigi_interact(m, o, type)
    local e = gWarioStates[m.playerIndex]
    local damagableTypes = (INTERACT_BOUNCE_TOP | INTERACT_BOUNCE_TOP2 | INTERACT_HIT_FROM_BELOW | 2097152 | INTERACT_KOOPA | INTERACT_BREAKABLE | INTERACT_GRABBABLE | INTERACT_BULLY)

    if (m.action == ACT_WAL_SH_BASH) and (type & damagableTypes) ~= 0 then
        dash_attacks(m, o, type)
        if m.flags & MARIO_METAL_CAP == 0 and obj_has_behavior_id(o, id_bhvBreakableBox) == 0 then
            humble_bump(m, -40, 30, ACT_WAR_SH_BASH_JUMP, ARG_WALUIGI)
        end
        return false
    end

    if (m.action == ACT_WAL_SH_BASH_JUMP) and (type & damagableTypes) ~= 0 and m.forwardVel > 10 then
        dash_attacks(m, o, type)
        humble_bump(m, -40, 15, ACT_WAR_SH_BASH_JUMP, ARG_WALUIGI)
        return false
    end

    if m.action == ACT_PICKING_UP and obj_has_behavior_id(o, id_bhvBobomb) ~= 0 then
        o.oBobombFuseTimer = -300
    end
end

local function waluigi_before_phys_step(m)
    local hScale = 1.0
    local vScale = 1.0

    -- faster swimming
    if (m.action & ACT_FLAG_SWIMMING) ~= 0 then
        hScale = hScale * 1.4
        if m.action ~= ACT_WATER_PLUNGE and m.action ~= ACT_FORWARD_WATER_KB and m.action ~= ACT_BACKWARD_WATER_KB then
            vScale = vScale * 1.4
        end
    end

    m.vel.x = m.vel.x * hScale
    m.vel.y = m.vel.y * vScale
    m.vel.z = m.vel.z * hScale
end

-----------
-- SYRUP --
-----------

local function syrup_update(m)
    local e = gWarioStates[m.playerIndex]

    -- torso tilt
    if m.action == ACT_WALKING then
        m.marioBodyState.torsoAngle.x = 0

        if m.marioBodyState.torsoAngle.z < -3000 then
            m.marioBodyState.eyeState = MARIO_EYES_LOOK_RIGHT
        elseif m.marioBodyState.torsoAngle.z > 3000 then
            m.marioBodyState.eyeState = MARIO_EYES_LOOK_LEFT
        end
    end

    -- scale
    if m.action == ACT_CORKSCREW then
        if m.actionTimer < 8 then
            m.marioObj.header.gfx.scale.y = (m.actionTimer + 22)/30
            m.marioObj.header.gfx.scale.x = (8 - m.actionTimer)/15 + 1
            m.marioObj.header.gfx.scale.z = (8 - m.actionTimer)/15 + 1
        end
    end

    -- cannon movement
    if m.action == ACT_SHOT_FROM_CANNON and m.vel.y < 1 and m.flags & MARIO_WING_CAP == 0 then
        set_mario_action(m, ACT_SYP_CANNON, 0)
    end

    -- slash cooldown
    if m.action ~= ACT_SYP_SLASH then
        if e.slashCooldown > 0 then
            e.slashCooldown = e.slashCooldown - 1
        elseif e.slashCooldown < 0 then
            e.slashCooldown = 0
        end
    end

    -- special swimming
    if m.action == ACT_FLUTTER_KICK and m.marioObj.header.gfx.animInfo.animID == MARIO_ANIM_FLUTTERKICK then
        m.particleFlags = m.particleFlags | PARTICLE_PLUNGE_BUBBLE
    end

    -- gold cap
    if m.flags & MARIO_METAL_CAP ~= 0 and e.availCoins > 0 then
        do_gold_cap(m)
    end

    -- better throwing
    if (m.action == ACT_THROWING and m.actionTimer == 8) or (m.action == ACT_AIR_THROW and m.actionTimer == 5) then
        do_better_throw(m, m.usedObj)
    end
end

local function syrup_set_action(m)
    local e = gWarioStates[m.playerIndex]

    -- slash
    if ((m.action == ACT_MOVE_PUNCHING and m.intendedMag > 30 and m.input & INPUT_A_DOWN == 0 and m.forwardVel >= 0) or (m.action == ACT_DIVE and m.pos.y == m.floorHeight and m.input & INPUT_A_DOWN == 0)) and e.slashCooldown == 0 then
        set_mario_action(m, ACT_SYP_SLASH, 0)
        e.slashCooldown = 300 - (coin_add()*4*2)
    end
    if e.wallet >= 100 and charSelect.get_options_status(powerScaling) == 0 then
        chopMax = 2
    else
        chopMax = 1
    end
    if m.pos.y == m.floorHeight and e.chop ~= chopMax then
        e.chop = chopMax
    end
end

local function syrup_before_set_action(m, act)
    local e = gWarioStates[m.playerIndex]

    if act == ACT_DIVE and (m.input & INPUT_NONZERO_ANALOG == 0 or m.forwardVel <= 0) and e.chop > 0 then
        return ACT_SYP_CHOP
    end

    if act == ACT_GROUND_POUND then
        return set_mario_action(m, ACT_HUMBLE_GP, ARG_SYRUP)
    elseif act == ACT_HOLD_WALKING then
        return ACT_WAR_CARRY
    elseif act == ACT_AIR_THROW then
        m.faceAngle.y = m.intendedYaw
    end
end

local function syrup_before_phys_step(m)
    -- faster swimming
    if m.action == ACT_FLUTTER_KICK and m.marioObj.header.gfx.animInfo.animID == MARIO_ANIM_FLUTTERKICK then
        mult = 3
        m.vel.x = m.vel.x * mult
        m.vel.y = m.vel.y * mult
        m.vel.z = m.vel.z * mult
    end
end

local function syrup_interact(m, o, type)
    local e = gWarioStates[m.playerIndex]
    local damagableTypes = (INTERACT_BOUNCE_TOP | INTERACT_BOUNCE_TOP2 | INTERACT_HIT_FROM_BELOW | 2097152 | INTERACT_KOOPA | INTERACT_BREAKABLE | INTERACT_GRABBABLE | INTERACT_BULLY)
    local collideTypes = (INTERACT_KOOPA | INTERACT_GRABBABLE | INTERACT_BULLY)

    if (m.action == ACT_SYP_SLASH) and (type & damagableTypes) ~= 0 then
        dash_attacks(m, o, type)
        if m.flags & MARIO_METAL_CAP == 0 and obj_has_behavior_id(o, id_bhvBreakableBox) == 0 then
            humble_bump(m, -40, 0, ACT_BACKWARD_ROLLOUT, 0)
        end
        return false
    end

    if m.action == ACT_PICKING_UP and obj_has_behavior_id(o, id_bhvBobomb) ~= 0 then
        o.oBobombFuseTimer = -150
        return false
    end
end

---------
-- HUD --
---------
local function do_coin_hud(m)
    local e = gWarioStates[m.playerIndex]
    djui_hud_set_resolution(RESOLUTION_N64)
    local height = djui_hud_get_screen_height()
    local powerScalingCheck = charSelect.get_options_status(powerScaling) == 0

    local blink = is_game_paused() == false and math.abs(math.sin(get_global_timer()*0.5)) * 255 or 0
    local colour = (e.wallet == 100 and powerScalingCheck) and blink or 0
    local textCoins = powerScalingCheck and e.wallet or 50
    local coins = string.format("%.0f", textCoins)
    local lives = string.format("%.0f", m.numLives)

    e.bagScale = math.lerp(e.bagScale, 0, 0.2)

    djui_hud_set_font(FONT_RECOLOR_HUD)
    local x = 74 - 12 + (#lives * 12)
    local y = 15

    djui_hud_set_color(255, 255, 255, 255)
    djui_hud_render_texture(TEX_BAG, (x + 3 - (16*e.bagScale)), (y - 13 + (24*e.bagScale)), (1 + e.bagScale), (1 - e.bagScale))

    djui_hud_set_color(255, 255, colour, 255)
    if not powerScalingCheck then
        djui_hud_set_color(200, 200, 200, 255)
    end
    djui_hud_print_text(coins, x - (#coins * 6) + 17, y, 1, 1)
    if e.wallet == 100 then
        local textMax = powerScalingCheck and "MAX" or "FIXED"
        local coolStuff = djui_hud_measure_text(textMax)
        djui_hud_print_text(textMax, x + 18 - (coolStuff/4), y - 10, 0.5, 0.5)
    end
end

local function wario_hud()
    local m = gMarioStates[0]
    local e = gWarioStates[m.playerIndex]

    if gNetworkPlayers[0].currActNum == 99 or gMarioStates[0].action == ACT_INTRO_CUTSCENE or obj_get_first_with_behavior_id(id_bhvActSelector) then return end --or hud_is_hidden()

    do_coin_hud(m)

    -- debug
    --djui_hud_set_resolution(RESOLUTION_DJUI)
    --djui_hud_set_font(FONT_ALIASED)
    --djui_hud_set_color(255, 0, 0, 255)

    --djui_hud_print_text(_G.charSelect.version_get(), 25, 350, 1)
    --djui_hud_print_text(string.format("torsoAngle.x = " ..m.marioBodyState.torsoAngle.x.. " "), 25, 375, 1)
    --djui_hud_print_text(string.format("torsoAngle.z = " ..m.marioBodyState.torsoAngle.z.. " "), 25, 400, 1)
    --djui_hud_print_text(string.format(VERSION_NUMBER), 25, 450, 1)
    --djui_hud_print_text(string.format(e.chop), 25, 475, 1)
    --djui_hud_print_text(string.format(e.availCoins), 25, 525, 1)
    --djui_hud_print_text(string.format(m.forwardVel), 25, 550, 1)
    --djui_hud_print_text(string.format(math.floor(65 - m.forwardVel)), 25, 575, 1)
    --djui_hud_print_text(string.format(e.coinFreq), 25, 600, 1)
    --djui_hud_print_text(string.format(m.intendedMag), 25, 625, 1)
end

local function waluigi_hud()
    local m = gMarioStates[0]
    local e = gWarioStates[m.playerIndex]

    if gNetworkPlayers[0].currActNum == 99 or gMarioStates[0].action == ACT_INTRO_CUTSCENE or obj_get_first_with_behavior_id(id_bhvActSelector) then return end --or hud_is_hidden()

    do_coin_hud(m)

    local height = djui_hud_get_screen_height()
    local blink = is_game_paused() == false and math.abs(math.sin(get_global_timer()*0.5)) * 255 or 0
    local bombBob = e.bombHudBob > 0 and math.sin(get_global_timer()*1)*(e.bombHudBob/3) or 0
    local bombX = e.bombHudOffset
    local bombY = (height/2) - 8 + bombBob
    local bombCol = e.bombsStashed == maxBombs and blink or 255
    djui_hud_set_font(FONT_HUD)
    djui_hud_set_color(255, bombCol, bombCol, 255)
    djui_hud_render_texture(TEX_BOMB, bombX, bombY - 1, 1, 1)
    djui_hud_print_text(string.format("@%.0f", e.bombsStashed), bombX + 16, bombY, 1, 1)
end

local function syrup_hud()
    local m = gMarioStates[0]
    local e = gWarioStates[m.playerIndex]

    if gNetworkPlayers[0].currActNum == 99 or gMarioStates[0].action == ACT_INTRO_CUTSCENE or obj_get_first_with_behavior_id(id_bhvActSelector) then return end --or hud_is_hidden() 

    do_coin_hud(m)

    local x = 16
    local y = betterCoins and 48 or 28
    local apparentCooldown = 0
    local minCooldown = 55
    if e.slashCooldown > minCooldown then
        apparentCooldown = minCooldown
    else
        apparentCooldown = e.slashCooldown
    end
    local rate = (minCooldown - apparentCooldown)/minCooldown
    if e.slashCooldown == minCooldown then
        e.swordScale = math.lerp(e.swordScale, 0, 0.4)
        if e.swordScale < 0.01 then
            e.swordScale = 0
        end
    else
        e.swordScale = rate
    end
    djui_hud_set_color(255, 255, 255, 255)
    djui_hud_render_texture(TEX_SWORD_BACK, x, y, 1, 1)
    djui_hud_render_texture(TEX_SWORD_FRONT, x + 4, y, e.swordScale, 1)
end

local function on_death(m)
    local m = gMarioStates[0]
    local e = gWarioStates[m.playerIndex]
    e.wallet = 0
end
hook_event(HOOK_ON_DEATH, on_death)

local function collect_coins(o)
    local m = gMarioStates[0]
    local e = gWarioStates[m.playerIndex]
    if obj_is_coin(o) == true then
        e.coinQueue = e.coinQueue + o.oDamageOrCoinValue
    end
end

local function update_bank_pos()
    local m = gMarioStates[0]
    local e = gWarioStates[m.playerIndex]
    local target = 0

    if e.wallet == 100 or is_game_paused() or obj_get_first_with_behavior_id(id_bhvActSelector) then
        target = -30
    else
        target = 30
    end
    e.bankOffset = math.lerp(e.bankOffset, target, 0.1)

    -- collect coins
    if e.coinQueue > 0 then
        if e.wallet < 100 then
            e.wallet = e.wallet + 1
        else
            e.bank = e.bank + 1
        end
        e.coinQueue = e.coinQueue - 1
        e.bagScale = 0.4
    end
end
local function render_bank_pos()
    local m = gMarioStates[0]
    local e = gWarioStates[m.playerIndex]

    --if charSelect.is_menu_open() then return end

    djui_hud_set_resolution(RESOLUTION_N64)

    local height = djui_hud_get_screen_height()
    local bankX = 22
    local bankY = height + e.bankOffset

    djui_hud_set_font(FONT_HUD)
    djui_hud_set_color(255, 255, 255, 255)
    djui_hud_render_texture(TEX_BANK, bankX, bankY - 2, 1, 1)
    djui_hud_print_text(string.format("%.0f", e.bank), bankX + 16, bankY, 1, 1)
end

charSelect.hook_on_character_change(function()
    local m = gMarioStates[0]
    local e = gWarioStates[m.playerIndex]
    local currChar = charSelect.character_get_current_number()
    if currChar == CT_J_WALUIGI then
        e.bombHudTimer = 60
    else
        e.bombHudTimer = 0
    end
    e.bombHudBob = 0
end)

_G.charSelect.character_hook_moveset(CT_J_WARIO, HOOK_MARIO_UPDATE, wario_update)
_G.charSelect.character_hook_moveset(CT_J_WARIO, HOOK_ON_SET_MARIO_ACTION, wario_set_action)
_G.charSelect.character_hook_moveset(CT_J_WARIO, HOOK_BEFORE_SET_MARIO_ACTION, wario_before_set_action)
_G.charSelect.character_hook_moveset(CT_J_WARIO, HOOK_ON_INTERACT, wario_interact)
_G.charSelect.character_hook_moveset(CT_J_WARIO, HOOK_ON_PVP_ATTACK, wario_attack)
_G.charSelect.character_hook_moveset(CT_J_WARIO, HOOK_ON_HUD_RENDER_BEHIND, wario_hud)
_G.charSelect.character_hook_moveset(CT_J_WARIO, HOOK_ON_LEVEL_INIT, wario_level_init)
_G.charSelect.character_hook_moveset(CT_J_WARIO, HOOK_ON_OBJECT_UNLOAD, collect_coins)
_G.charSelect.character_hook_moveset(CT_J_WARIO, HOOK_UPDATE, update_bank_pos)
_G.charSelect.character_hook_moveset(CT_J_WARIO, HOOK_ON_HUD_RENDER, render_bank_pos)

_G.charSelect.character_hook_moveset(CT_J_WALUIGI, HOOK_MARIO_UPDATE, waluigi_update)
_G.charSelect.character_hook_moveset(CT_J_WALUIGI, HOOK_ON_SET_MARIO_ACTION, waluigi_set_action)
_G.charSelect.character_hook_moveset(CT_J_WALUIGI, HOOK_BEFORE_SET_MARIO_ACTION, waluigi_before_set_action)
_G.charSelect.character_hook_moveset(CT_J_WALUIGI, HOOK_BEFORE_PHYS_STEP, waluigi_before_phys_step)
_G.charSelect.character_hook_moveset(CT_J_WALUIGI, HOOK_ON_INTERACT, waluigi_interact)
_G.charSelect.character_hook_moveset(CT_J_WALUIGI, HOOK_ON_PVP_ATTACK, wario_attack)
_G.charSelect.character_hook_moveset(CT_J_WALUIGI, HOOK_ON_HUD_RENDER_BEHIND, waluigi_hud)
_G.charSelect.character_hook_moveset(CT_J_WALUIGI, HOOK_ON_LEVEL_INIT, wario_level_init)
_G.charSelect.character_hook_moveset(CT_J_WALUIGI, HOOK_ON_OBJECT_UNLOAD, collect_coins)
_G.charSelect.character_hook_moveset(CT_J_WALUIGI, HOOK_UPDATE, update_bank_pos)
_G.charSelect.character_hook_moveset(CT_J_WALUIGI, HOOK_ON_HUD_RENDER, render_bank_pos)

_G.charSelect.character_hook_moveset(CT_J_SYRUP, HOOK_MARIO_UPDATE, syrup_update)
_G.charSelect.character_hook_moveset(CT_J_SYRUP, HOOK_ON_SET_MARIO_ACTION, syrup_set_action)
_G.charSelect.character_hook_moveset(CT_J_SYRUP, HOOK_BEFORE_SET_MARIO_ACTION, syrup_before_set_action)
_G.charSelect.character_hook_moveset(CT_J_SYRUP, HOOK_BEFORE_PHYS_STEP, syrup_before_phys_step)
_G.charSelect.character_hook_moveset(CT_J_SYRUP, HOOK_ON_INTERACT, syrup_interact)
_G.charSelect.character_hook_moveset(CT_J_SYRUP, HOOK_ON_HUD_RENDER_BEHIND, syrup_hud)
_G.charSelect.character_hook_moveset(CT_J_SYRUP, HOOK_ON_LEVEL_INIT, wario_level_init)
_G.charSelect.character_hook_moveset(CT_J_SYRUP, HOOK_ON_OBJECT_UNLOAD, collect_coins)
_G.charSelect.character_hook_moveset(CT_J_SYRUP, HOOK_UPDATE, update_bank_pos)
_G.charSelect.character_hook_moveset(CT_J_SYRUP, HOOK_ON_HUD_RENDER, render_bank_pos)