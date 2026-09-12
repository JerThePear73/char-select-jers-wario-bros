if not _G.charSelectExists then return end

local hudDodge = require("libs/hudDodge")

local TEX_BAG = get_texture_info('jwar_bag_of_oins')
local TEX_BANK = get_texture_info('jwar_hud_$')
local TEX_BOMB = get_texture_info('jwar_hud_bomb')
local TEX_SWORD_BACK = get_texture_info("jwar_hud_sword_back")
local TEX_SWORD_FRONT = get_texture_info("jwar_hud_sword_front")

---------
-- HUD --
---------
local function do_coin_hud(m)
    local e = gWarioStates[m.playerIndex]
    djui_hud_set_resolution(RESOLUTION_N64)
    local height = djui_hud_get_screen_height()
    local powerScalingCheck = charSelect.get_options_status(powerScaling) ~= 0

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

    local blink = is_game_paused() == false and math.abs(math.sin(get_global_timer()*0.5)) * 255 or 0
    local colour = (e.wallet == 100 and powerScalingCheck) and blink or 0
    local textCoins = powerScalingCheck and e.wallet or 50
    local coins = string.format("%.0f", textCoins)
    local lives = string.format("%.0f", m.numLives)

    e.bagScale = math.lerp(e.bagScale, 0, 0.2)

    djui_hud_set_font(FONT_RECOLOR_HUD)

    --local x, y = hudDodge.find_open_hud_space(0, 0, 40, 32, 1, 0, e.wallet == 100 and 4 or 3)
    --x = x + 4

    local x = 63 + (#tostring(m.numLives) * 12) -- remove when squishy commits hud dodge changes
    local y = 15

    djui_hud_set_color(255, 255, 255, 255)
    djui_hud_render_texture(TEX_BAG, (x - (16*e.bagScale)), (y - 13 + (24*e.bagScale)), (1 + e.bagScale), (1 - e.bagScale))

    djui_hud_set_color(255, 255, colour, 255)
    if not powerScalingCheck then
        djui_hud_set_color(200, 200, 200, 255)
    end
    djui_hud_print_text(coins, x - (#coins * 6) + 14, y, 1, 1)
    if e.wallet == 100 or not powerScalingCheck then
        local textMax = powerScalingCheck and "MAX" or "FIXED"
        local textMaxWidth = djui_hud_measure_text(textMax)
        djui_hud_print_text(textMax, x + 16 - (textMaxWidth/4), y - 10, 0.5, 0.5)
    end
end

local function render_bank_pos()
    local m = gMarioStates[0]
    local e = gWarioStates[m.playerIndex]

    djui_hud_set_resolution(RESOLUTION_N64)

    local height = djui_hud_get_screen_height()
    --local bankX, bankY = hudDodge.find_open_hud_space(0, height, 64, 16, 0, 1, 2)
    local bankX = 16
    local bankY = height - 32
    local showBank = (e.wallet == 100 or is_game_paused() or obj_get_first_with_behavior_id(id_bhvActSelector)) and not charSelect.is_menu_open()
    e.prevBankY = math.lerp(e.prevBankY, showBank and bankY or height + 16, 0.15)

    djui_hud_set_font(FONT_HUD)
    djui_hud_set_color(255, 255, 255, charSelect.is_menu_open() and 0 or 255)
    djui_hud_render_texture(TEX_BANK, bankX, e.prevBankY - 2, 1, 1)
    djui_hud_print_text(string.format("%.0f", e.bank), bankX + 16, e.prevBankY, 1, 1)
end

local isPausedBank = false
local function render_bank_pos_below()
    if not isPausedBank then
        render_bank_pos()
    end
end

local function render_bank_pos_above()
    if isPausedBank then
        render_bank_pos()
    end
    isPausedBank = is_game_paused() or obj_get_first_with_behavior_id(id_bhvActSelector)
end

local function wario_hud()
    local m = gMarioStates[0]
    local e = gWarioStates[m.playerIndex]

    if gNetworkPlayers[0].currActNum == 99 or gMarioStates[0].action == ACT_INTRO_CUTSCENE or obj_get_first_with_behavior_id(id_bhvActSelector) then return end --or hud_is_hidden()

    do_coin_hud(m)
    render_bank_pos_below()

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
    render_bank_pos_below()

    -- hud
    if m.action == ACT_BOMB_STASH then
        e.bombHudTimer = bombHudTimerMax
    else
        e.bombHudTimer = e.bombHudTimer - 1
    end
    local targetPos = (e.bombHudTimer > 0 or e.bombsStashed == maxBombs) and 0 or -82
    e.bombHudOffset = math.lerp(e.bombHudOffset, targetPos, 0.2)
    e.bombHudBob = e.bombHudBob > 0 and e.bombHudBob - 1 or 0

    local height = djui_hud_get_screen_height()
    local blink = is_game_paused() == false and math.abs(math.sin(get_global_timer()*0.5)) * 255 or 0
    local bombBob = e.bombHudBob > 0 and math.sin(get_global_timer()*1)*(e.bombHudBob/3) or 0
    local bombX, bombY = hudDodge.find_open_hud_space(0, height*0.5 - 8, 64, 16, 0, 1, 2)
    bombX = bombX + e.bombHudOffset
    bombY = bombY + bombBob
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
    render_bank_pos_below()

    local x, y = hudDodge.find_open_hud_space(0, 0, 32, 64, 0, 1, 3)
    
    local rate = 1 - (e.slashCooldown/slashCooldownMax)
    e.swordScale = math.lerp(e.swordScale, rate, 0.5)
    djui_hud_set_color(255, 255, 255, 255)
    djui_hud_render_texture(TEX_SWORD_BACK, x, y - 6, 1, 1)
    djui_hud_render_texture(TEX_SWORD_FRONT, x + 4, y - 6, e.swordScale, 1)
end

local function collect_coins_unload(o)
    local m = gMarioStates[0]
    local e = gWarioStates[m.playerIndex]
    if obj_is_coin(o) then
        e.coinQueue = e.coinQueue + o.oDamageOrCoinValue
    end
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


_G.charSelect.character_hook_moveset(CT_J_WARIO, HOOK_ON_HUD_RENDER_BEHIND, wario_hud)
_G.charSelect.character_hook_moveset(CT_J_WARIO, HOOK_ON_HUD_RENDER, render_bank_pos_above)

_G.charSelect.character_hook_moveset(CT_J_WALUIGI, HOOK_ON_HUD_RENDER_BEHIND, waluigi_hud)
_G.charSelect.character_hook_moveset(CT_J_WALUIGI, HOOK_ON_HUD_RENDER, render_bank_pos_above)

_G.charSelect.character_hook_moveset(CT_J_SYRUP, HOOK_ON_HUD_RENDER_BEHIND, syrup_hud)
_G.charSelect.character_hook_moveset(CT_J_SYRUP, HOOK_ON_HUD_RENDER, render_bank_pos_above)