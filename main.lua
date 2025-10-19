-- name: [CS] \\#F2D36F\\Wario \\#B47CF4\\Bros.
-- description: Wario,,, I gotta win,,,\n\n\\#ff7777\\This Pack requires Character Select\nto use as a Library!

local TEXT_MOD_NAME = "Wario Bros."

-- Stops mod from loading if Character Select isn't on
if not _G.charSelectExists then
    djui_popup_create("\\#ffffdc\\\n"..TEXT_MOD_NAME.."\nRequires the Character Select Mod\nto use as a Library!\n\nPlease turn on the Character Select Mod\nand Restart the Room!", 6)
    return 0
end

-- Models --
local E_MODEL_J_WARIO = smlua_model_util_get_id('jers_wario_geo')
local E_MODEL_J_WARIO_T = smlua_model_util_get_id('jers_wario_t_geo')

-- Textures --
local TEX_WARIO = gTextures.wario_head
local TEX_WALUIGI = gTextures.waluigi_head

local VOICETABLE_J_WARIO = {
   	[CHAR_SOUND_OKEY_DOKEY] = 'JWAR_HERE_WE_GO.ogg',
	[CHAR_SOUND_LETS_A_GO] = 'JWAR_HERE_WE_GO.ogg',
	[CHAR_SOUND_PUNCH_YAH] = 'JWAR_PUNCH1.ogg',
	[CHAR_SOUND_PUNCH_WAH] = 'JWAR_PUNCH2.ogg',
    [CHAR_SOUND_PUNCH_HOO] = 'JWAR_HOO.ogg',
   	[CHAR_SOUND_WAH2] = 'JWAR_GOOD_LUCK.ogg',
	[CHAR_SOUND_YAH_WAH_HOO] = {'JWAR_YAH.ogg', 'JWAR_PUNCH1.ogg', 'JWAR_WAH.ogg'},
	[CHAR_SOUND_HOOHOO] = {'JWAR_PUNCH2.ogg', 'JWAR_HOO.ogg'},
	[CHAR_SOUND_YAHOO_WAHA_YIPPEE] = {'JWAR_YAHOO.ogg', 'JWAR_RAHA.ogg', 'JWAR_ALRIGHT.ogg'},
	[CHAR_SOUND_UH] = 'JWAR_EH.ogg',
	[CHAR_SOUND_UH2] = 'JWAR_HERE_WE_GO.ogg',
	[CHAR_SOUND_UH2_2] = 'JWAR_OOH.ogg',
	[CHAR_SOUND_HAHA] = {'JWAR_YEAH.ogg', 'JWAR_WOW.ogg'},
	[CHAR_SOUND_YAHOO] = {'JWAR_YAHOO.ogg', 'JWAR_RAHA.ogg'},
	[CHAR_SOUND_DOH] = 'JWAR_OOH.ogg',
	[CHAR_SOUND_WHOA] = 'JWAR_AH.ogg',
	[CHAR_SOUND_EEUH] = 'JWAR_EEUH.ogg',
	[CHAR_SOUND_WAAAOOOW] = 'JWAR_FALL.ogg',
	[CHAR_SOUND_TWIRL_BOUNCE] = 'JWAR_WOW.ogg',
	[CHAR_SOUND_GROUND_POUND_WAH] = 'JWAR_LIFT.ogg',
	[CHAR_SOUND_HRMM] = 'JWAR_EEUH.ogg',
	[CHAR_SOUND_HERE_WE_GO] = {'JWAR_IMMA_NUMBER_ONE.ogg', 'JWAR_EXCELLENT.ogg'},
	[CHAR_SOUND_SO_LONGA_BOWSER] = {'JWAR_HAVE_A_ROTTEN_DAY.ogg', 'JWAR_GET_OUT.ogg'},
 	[CHAR_SOUND_OOOF] = 'JWAR_GRUMBLE.ogg',
 	[CHAR_SOUND_OOOF2] = 'JWAR_UH_OH.ogg',
	[CHAR_SOUND_ATTACKED] = 'JWAR_GRUMBLE.ogg',
	[CHAR_SOUND_PANTING] = 'JWAR_PANT.ogg',
   	[CHAR_SOUND_PANTING_COLD] = 'JWAR_PANT.ogg',
	[CHAR_SOUND_ON_FIRE] = 'JWAR_BURN.ogg',
	[CHAR_SOUND_SNORING1] = 'JWAR_SNORE1.ogg',
	[CHAR_SOUND_SNORING2] = 'JWAR_SNORE2.ogg',
	[CHAR_SOUND_COUGHING1] = 'JWAR_COUGH.ogg',
	[CHAR_SOUND_COUGHING2] = 'JWAR_COUGH.ogg',
	[CHAR_SOUND_COUGHING3] = 'JWAR_COUGH.ogg',
	[CHAR_SOUND_DYING] = 'JWAR_DEATH.ogg',
	[CHAR_SOUND_DROWNING] = 'JWAR_DROWN.ogg',
	[CHAR_SOUND_MAMA_MIA] = 'JWAR_MAMA_MIA.ogg',
   	[CHAR_SOUND_YAWNING] = 'JWAR_YAWN.ogg',
}

local PALETTES_WARIO = {
    {
        name = "Default",
        [PANTS]  = "7f207a",
        [SHIRT]  = "ffbd00",
        [GLOVES] = "ffffff",
        [SHOES]  = "0e721c",
        [HAIR]   = "735300",
        [SKIN]   = "fec179",
        [CAP]    = "ffbd00",
        [EMBLEM] = "0000ff",
    },
    {
        name = "Biker",
        [PANTS]  = "ff8590",
        [SHIRT]  = "004779",
        [GLOVES] = "ffff00",
        [SHOES]  = "004779",
        [HAIR]   = "735300",
        [SKIN]   = "fec179",
        [CAP]    = "ffff00",
        [EMBLEM] = "4180D8",
    },
    {
        name = "Landio SGB",
        [PANTS]  = "050000",
        [SHIRT]  = "F7F7F7",
        [GLOVES] = "F7F7F7",
        [SHOES]  = "050000",
        [HAIR]   = "050000",
        [SKIN]   = "CB7E45",
        [CAP]    = "F7F7F7",
        [EMBLEM] = "CB7E45",
    },
    {
        name = "Landio",
        [PANTS]  = "100029",
        [SHIRT]  = "FFFF73",
        [GLOVES] = "FFFF73",
        [SHOES]  = "100029",
        [HAIR]   = "100029",
        [SKIN]   = "FF7B52",
        [CAP]    = "FFFF73",
        [EMBLEM] = "FF7B52",
    },
    {
        name = "Landio Burnt",
        [PANTS]  = "100029",
        [SHIRT]  = "FFFF00",
        [GLOVES] = "FF0000",
        [SHOES]  = "100029",
        [HAIR]   = "100029",
        [SKIN]   = "FF0000",
        [CAP]    = "FFFF00",
        [EMBLEM] = "FF0000",
    },
    {
        name = "Cotton Candy",
        [PANTS]  = "69a1ff",
        [SHIRT]  = "ff7d89",
        [GLOVES] = "ffffff",
        [SHOES]  = "b948ff",
        [HAIR]   = "735300",
        [SKIN]   = "fec179",
        [CAP]    = "69a1ff",
        [EMBLEM] = "b948ff",
    },
    {
        name = "Greener",
        [PANTS]  = "7b4200",
        [SHIRT]  = "288727",
        [GLOVES] = "ffffff",
        [SHOES]  = "291700",
        [HAIR]   = "735300",
        [SKIN]   = "fec179",
        [CAP]    = "288727",
        [EMBLEM] = "ffc200",
    },
    {
        name = "Watermelon",
        [PANTS]  = "005c24",
        [SHIRT]  = "ff2580",
        [GLOVES] = "ffffff",
        [SHOES]  = "6cff42",
        [HAIR]   = "005c24",
        [SKIN]   = "6cff42",
        [CAP]    = "ff2580",
        [EMBLEM] = "6cff42",
    },
}

local ANIMTABLE_J_WARIO = {
    [CHAR_ANIM_RUNNING] = "humbler_run",
    [CHAR_ANIM_START_TWIRL] = "humbler_start_twirl",
    [CHAR_ANIM_TWIRL] = "humbler_twirl",
    [_G.charSelect.CS_ANIM_MENU] = "wario_anim_cs_menu",
}

local EYES_J_WARIO = {
    [CHAR_ANIM_IDLE_HEAD_LEFT] = MARIO_EYES_LOOK_RIGHT,
    [CHAR_ANIM_IDLE_HEAD_RIGHT] = MARIO_EYES_LOOK_LEFT,
    [_G.charSelect.CS_ANIM_MENU] = MARIO_EYES_LOOK_LEFT,
}

local HEALTH_METER_WARIO = {
    label = {
        left = get_texture_info("char-select-wario-meter-left"),
        right = get_texture_info("char-select-wario-meter-right"),
    }
}

--local CAP_SYRUP = {
--    normal = smlua_model_util_get_id("cap_normal_geo"),
--    wing = smlua_model_util_get_id("cap_wing_geo"),
--    metal = smlua_model_util_get_id("cap_metal_geo"),
--    metalWing = smlua_model_util_get_id("cap_metal_wing_geo")
--}

if _G.charSelectExists then
    CT_J_WARIO = _G.charSelect.character_add("Wario", { "A jolly feller with an eye for gold, no matter how dangerous.",
        ""}, "JerThePear", {r = 255, g = 255, b = 000}, E_MODEL_J_WARIO, CT_WARIO, gTextures.wario_head)
end

local CSloaded = false
local function on_character_select_load()
    _G.charSelect.character_add_costume(CT_J_WARIO, "Wario", { "A jolly feller with an eye for gold, no matter how dangerous.",
        ""}, "JerThePear", {r = 255, g = 255, b = 000}, E_MODEL_J_WARIO_T, CT_WARIO, gTextures.wario_head)
    for i = 1, #PALETTES_WARIO do
        _G.charSelect.character_add_palette_preset(E_MODEL_J_WARIO, PALETTES_WARIO[i], PALETTES_WARIO[i].name)
        _G.charSelect.character_add_palette_preset(E_MODEL_J_WARIO_T, PALETTES_WARIO[i], PALETTES_WARIO[i].name)
    end
    _G.charSelect.character_add_animations(E_MODEL_J_WARIO, ANIMTABLE_J_WARIO, EYES_J_WARIO)
    _G.charSelect.character_add_animations(E_MODEL_J_WARIO_T, ANIMTABLE_J_WARIO, EYES_J_WARIO)
    _G.charSelect.character_add_voice(E_MODEL_J_WARIO, VOICETABLE_J_WARIO)
    _G.charSelect.character_add_voice(E_MODEL_J_WARIO_T, VOICETABLE_J_WARIO)
    _G.charSelect.character_add_health_meter(CT_J_WARIO, HEALTH_METER_WARIO)

    CSloaded = true
end

local function on_character_sound(m, sound)
    if not CSloaded then return end
    if _G.charSelect.character_get_voice(m) == VOICETABLE_J_WARIO then return _G.charSelect.voice.sound(m, sound) end
end

local function on_character_snore(m)
    if not CSloaded then return end
    if _G.charSelect.character_get_voice(m) == VOICETABLE_J_WARIO then return _G.charSelect.voice.snore(m) end
end

hook_event(HOOK_ON_MODS_LOADED, on_character_select_load)
hook_event(HOOK_CHARACTER_SOUND, on_character_sound)
hook_event(HOOK_MARIO_UPDATE, on_character_snore)