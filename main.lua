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

local E_MODEL_J_WALUIGI = smlua_model_util_get_id('jers_waluigi_geo')

local E_MODEL_J_SYRUP = smlua_model_util_get_id('jers_captain_syrup_geo')

-- Textures --
local TEX_WARIO = gTextures.wario_head
local TEX_WALUIGI = gTextures.waluigi_head
local TEX_SYRUP = get_texture_info("jwar-syrup-icon")

local VOICETABLE_J_WARIO = {
   	[CHAR_SOUND_OKEY_DOKEY] = 'JWAR_HERE_WE_GO.ogg',
	[CHAR_SOUND_LETS_A_GO] = 'JWAR_HERE_WE_GO.ogg',
	[CHAR_SOUND_PUNCH_YAH] = 'JWAR_PUNCH1.ogg',
	[CHAR_SOUND_PUNCH_WAH] = 'JWAR_PUNCH2.ogg',
    [CHAR_SOUND_PUNCH_HOO] = 'JWAR_HOO.ogg',
   	[CHAR_SOUND_WAH2] = 'JWAR_GOOD_LUCK.ogg',
	[CHAR_SOUND_YAH_WAH_HOO] = {'JWAR_YAH.ogg', 'JWAR_PUNCH1.ogg', 'JWAR_WAH.ogg'},
	[CHAR_SOUND_HOOHOO] = {'JWAR_PUNCH2.ogg', 'JWAR_HOO.ogg'},
	[CHAR_SOUND_YAHOO_WAHA_YIPPEE] = {'JWAR_YAHOO.ogg', 'JWAR_LAUGH.ogg', 'JWAR_ALRIGHT.ogg'},
	[CHAR_SOUND_UH] = 'JWAR_EH.ogg',
	[CHAR_SOUND_UH2] = 'JWAR_HERE_WE_GO.ogg',
	[CHAR_SOUND_UH2_2] = 'JWAR_OOH.ogg',
	[CHAR_SOUND_HAHA] = {'JWAR_YEAH.ogg', 'JWAR_WOW.ogg', 'JWAR_WONDERFUL.ogg'},
	[CHAR_SOUND_YAHOO] = 'JWAR_YAHOO.ogg',
	[CHAR_SOUND_DOH] = 'JWAR_OOH.ogg',
	[CHAR_SOUND_WHOA] = 'JWAR_AH.ogg',
	[CHAR_SOUND_EEUH] = 'JWAR_EEUH.ogg',
	[CHAR_SOUND_WAAAOOOW] = 'JWAR_FALL.ogg',
	[CHAR_SOUND_TWIRL_BOUNCE] = 'JWAR_WOW.ogg',
	[CHAR_SOUND_GROUND_POUND_WAH] = 'JWAR_AHH.ogg',
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
local VOICETABLE_J_WALUIGI = {
   	[CHAR_SOUND_OKEY_DOKEY] = 'JWAL_WALUIGITIME.ogg',
	[CHAR_SOUND_LETS_A_GO] = 'JWAL_WALUIGITIME.ogg',
	[CHAR_SOUND_PUNCH_YAH] = 'JWAL_WAH2.ogg',
	[CHAR_SOUND_PUNCH_WAH] = 'JWAL_WAH.ogg',
    [CHAR_SOUND_PUNCH_HOO] = 'JWAL_HOAH.ogg',
   	[CHAR_SOUND_WAH2] = {'JWAL_TAKETHAT.ogg', 'JWAL_THROW.ogg'},
	[CHAR_SOUND_YAH_WAH_HOO] = {'JWAL_YAH2.ogg', 'JWAL_WAH2.ogg', 'JWAL_WAH.ogg'},
	[CHAR_SOUND_HOOHOO] = 'JWAL_HOAH.ogg',
	[CHAR_SOUND_YAHOO_WAHA_YIPPEE] = {'JWAL_LONGJUMP2.ogg', 'JWAL_LAUGH2.ogg', 'JWAL_LAUGH3.ogg'},
	[CHAR_SOUND_UH] = 'JWAL_PANT.ogg',
	[CHAR_SOUND_UH2] = 'JWAL_AW_YEAH.ogg',
	[CHAR_SOUND_UH2_2] = 'JWAL_PANT.ogg',
	[CHAR_SOUND_HAHA] = {'JWAL_AW_YEAH.ogg', 'JWAL_LAUGH1.ogg', 'JWAL_OHYEAH.ogg'},
	[CHAR_SOUND_YAHOO] = {'JWAL_LONGJUMP1.ogg', 'JWAL_LONGJUMP2.ogg'},
	[CHAR_SOUND_DOH] = 'JWAL_DOH.ogg',
	[CHAR_SOUND_WHOA] = 'JWAL_WOAH.ogg',
	[CHAR_SOUND_EEUH] = 'JWAL_EEUH.ogg',
	[CHAR_SOUND_WAAAOOOW] = {'JWAL_FALLING1.ogg', 'JWAL_FALLING2.ogg'},
	[CHAR_SOUND_TWIRL_BOUNCE] = 'JWAL_LAUGH3.ogg',
	[CHAR_SOUND_GROUND_POUND_WAH] = 'JWAL_YAH.ogg',
	[CHAR_SOUND_HRMM] = 'JWAL_EEUH.ogg',
	[CHAR_SOUND_HERE_WE_GO] = 'JWAL_NUMBERONE.ogg',
	[CHAR_SOUND_SO_LONGA_BOWSER] = 'JWAL_SOLONGAYBOWSER.ogg',
 	[CHAR_SOUND_OOOF] = 'JWAL_OOF.ogg',
 	[CHAR_SOUND_OOOF2] = 'JWAL_OOF.ogg',
	[CHAR_SOUND_ATTACKED] = {'JWAL_HURT.ogg', 'JWAL_HURT2.ogg'},
	[CHAR_SOUND_PANTING] = 'JWAL_PANT.ogg',
   	[CHAR_SOUND_PANTING_COLD] = 'JWAL_PANT.ogg',
	[CHAR_SOUND_ON_FIRE] = {'JWAL_BURN.ogg', 'JWAL_BIGHURT.ogg'},
	[CHAR_SOUND_SNORING1] = 'JWAL_SNORE1.ogg',
	[CHAR_SOUND_SNORING2] = 'JWAL_SNORE2.ogg',
	[CHAR_SOUND_COUGHING1] = 'JWAL_COUGH1.ogg',
	[CHAR_SOUND_COUGHING2] = 'JWAL_COUGH2.ogg',
	[CHAR_SOUND_COUGHING3] = 'JWAL_COUGH3.ogg',
	[CHAR_SOUND_DYING] = 'JWAL_DEATH.ogg',
	[CHAR_SOUND_DROWNING] = 'JWAL_DROWN.ogg',
	[CHAR_SOUND_MAMA_MIA] = 'JWAL_IM_RUINED.ogg',
   	[CHAR_SOUND_YAWNING] = 'JWAL_YAWN.ogg',
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
        name = "Wario+",
        [PANTS]  = "600e77",
        [SHIRT]  = "ffb000",
        [GLOVES] = "c5c4ff",
        [SHOES]  = "175200",
        [HAIR]   = "4a3616",
        [SKIN]   = "ffa674",
        [CAP]    = "ffb000",
        [EMBLEM] = "0026a0",
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
        name = "Landio",
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
        name = "LandLord",
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
        name = "Extra Crispy",
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
    {
        name = "Blast",
        [PANTS]  = "150921",
        [SHIRT]  = "A4E900",
        [GLOVES] = "FE050D",
        [SHOES]  = "150921",
        [HAIR]   = "150921",
        [SKIN]   = "FE050D",
        [CAP]    = "A4E900",
        [EMBLEM] = "150921",
    },
}
local PALETTES_WALUIGI = {
    {
        name = "Default",
        [PANTS]  = "161627",
        [SHIRT]  = "6126b0",
        [GLOVES] = "ffffff",
        [SHOES]  = "fe7600",
        [HAIR]   = "735300",
        [SKIN]   = "fec179",
        [CAP]    = "6126b0",
        [EMBLEM] = "ffde00",
    },
    {
        name = "Waluigi+",
        [PANTS]  = "0d0911",
        [SHIRT]  = "490089",
        [GLOVES] = "ffedaa",
        [SHOES]  = "792900",
        [HAIR]   = "6c4e14",
        [SKIN]   = "ffa674",
        [CAP]    = "490089",
        [EMBLEM] = "ffb700",
    },
    {
        name = "Landio",
        [PANTS]  = "F7F7F7",
        [SHIRT]  = "050000",
        [GLOVES] = "F7F7F7",
        [SHOES]  = "F7F7F7",
        [HAIR]   = "050000",
        [SKIN]   = "CB7E45",
        [CAP]    = "050000",
        [EMBLEM] = "CB7E45",
    },
    {
        name = "LandLord",
        [PANTS]  = "FFFF73",
        [SHIRT]  = "100029",
        [GLOVES] = "FFFF73",
        [SHOES]  = "FFFF73",
        [HAIR]   = "100029",
        [SKIN]   = "FF7B52",
        [CAP]    = "100029",
        [EMBLEM] = "FF7B52",
    },
    {
        name = "Big Dreamer",
        [PANTS]  = "B46FF4",
        [SHIRT]  = "EBD9FF",
        [GLOVES] = "EBD9FF",
        [SHOES]  = "EBD9FF",
        [HAIR]   = "B46FF4",
        [SKIN]   = "EBD9FF",
        [CAP]    = "EBD9FF",
        [EMBLEM] = "B46FF4",
    },
    {
        name = "Prized Possession",
        [PANTS]  = "333333",
        [SHIRT]  = "881fb2",
        [GLOVES] = "cccccc",
        [SHOES]  = "ca7600",
        [HAIR]   = "8b4500",
        [SKIN]   = "fecec6",
        [CAP]    = "881fb2",
        [EMBLEM] = "ffff00",
    },
    {
        name = "Stainless Steel",
        [PANTS]  = "ff8000",
        [SHIRT]  = "222222",
        [GLOVES] = "ff8000",
        [SHOES]  = "552945",
        [HAIR]   = "735300",
        [SKIN]   = "fec179",
        [CAP]    = "222222",
        [EMBLEM] = "222222",
    },
    {
        name = "Reference",
        [PANTS]  = "008600",
        [SHIRT]  = "00ffff",
        [GLOVES] = "ffffff",
        [SHOES]  = "721c0e",
        [HAIR]   = "730600",
        [SKIN]   = "fec179",
        [CAP]    = "00ffff",
        [EMBLEM] = "ffde00",
    },
    {
        name = "Tennis Loser",
        [PANTS]  = "161627",
        [SHIRT]  = "5A3921",
        [GLOVES] = "ffffff",
        [SHOES]  = "5A00CE",
        [HAIR]   = "291000",
        [SKIN]   = "E7B594",
        [CAP]    = "5A3921",
        [EMBLEM] = "ffde00",
    },
    {
        name = "Danton",
        [PANTS]  = "150921",
        [SHIRT]  = "444AD0",
        [GLOVES] = "27E67C",
        [SHOES]  = "150921",
        [HAIR]   = "150921",
        [SKIN]   = "27E67C",
        [CAP]    = "444AD0",
        [EMBLEM] = "150921",
    },
}
local PALETTES_SYRUP = {
    {
        name = "Default",
        [PANTS]  = "4E356C",
        [SHIRT]  = "E54EF7",
        [GLOVES] = "DE1C2A",
        [SHOES]  = "551A6E",
        [HAIR]   = "AD1210",
        [SKIN]   = "FED5D3",
        [CAP]    = "E54EF7",
        [EMBLEM] = "F6D919",
    },
    {
        name = "Landio",
        [PANTS]  = "F7F7F7",
        [SHIRT]  = "F7F7F7",
        [GLOVES] = "CB7E45",
        [SHOES]  = "CB7E45",
        [HAIR]   = "050000",
        [SKIN]   = "CB7E45",
        [CAP]    = "F7F7F7",
        [EMBLEM] = "F7F7F7",
    },
    {
        name = "LandLord",
        [PANTS]  = "F8F870",
        [SHIRT]  = "F8F870",
        [GLOVES] = "F87850",
        [SHOES]  = "F87850",
        [HAIR]   = "100028",
        [SKIN]   = "F87850",
        [CAP]    = "F8F870",
        [EMBLEM] = "F8F870",
    },
    {
        name = "Sea Side",
        [PANTS]  = "8ec8ed",
        [SHIRT]  = "8ec8ed",
        [GLOVES] = "f9f33d",
        [SHOES]  = "14461a",
        [HAIR]   = "9b1e0b",
        [SKIN]   = "fdceb9",
        [CAP]    = "f9f33d",
        [EMBLEM] = "c3225a",
    },
    {
        name = "Maple",
        [PANTS]  = "ffffff",
        [SHIRT]  = "ffffff",
        [GLOVES] = "b63a27",
        [SHOES]  = "444444",
        [HAIR]   = "402f25",
        [SKIN]   = "e2a278",
        [CAP]    = "b63a27",
        [EMBLEM] = "ff0000",
    },
    {
        name = "Solar Sailor",
        [PANTS]  = "ffbc00",
        [SHIRT]  = "333333",
        [GLOVES] = "74301e",
        [SHOES]  = "333333",
        [HAIR]   = "74301e",
        [SKIN]   = "ffba90",
        [CAP]    = "ff2222",
        [EMBLEM] = "ffbc00",
    },
    {
        name = "Clumsy Captain",
        [PANTS]  = "bbff4d",
        [SHIRT]  = "ffffff",
        [GLOVES] = "ffffff",
        [SHOES]  = "462c1e",
        [HAIR]   = "462c1e",
        [SKIN]   = "ffba90",
        [CAP]    = "77bdff",
        [EMBLEM] = "ffffff",
    },
    {
        name = "Dynamite",
        [PANTS]  = "FE050D",
        [SHIRT]  = "FE050D",
        [GLOVES] = "150921",
        [SHOES]  = "150921",
        [HAIR]   = "FE050D",
        [SKIN]   = "A4E900",
        [CAP]    = "150921",
        [EMBLEM] = "A4E900",
    },
}

local ANIMTABLE_J_WARIO = {
    [CHAR_ANIM_RUNNING] = "JWAR_RUN",
    [CHAR_ANIM_SINGLE_JUMP] = "JWAR_SINGLE_JUMP",
    [MARIO_ANIM_LAND_FROM_SINGLE_JUMP] = "JWAR_SINGLE_JUMP_LAND",
    [CHAR_ANIM_START_TWIRL] = "JWAR_START_TWIRL",
    [CHAR_ANIM_TWIRL] = "JWAR_TWIRL",
    [_G.charSelect.CS_ANIM_MENU] = "wario_anim_cs_menu",
}
local ANIMTABLE_J_WALUIGI = {
    [CHAR_ANIM_RUNNING] = "JWAL_RUN",
    [_G.charSelect.CS_ANIM_MENU] = "waluigi_anim_cs_menu",
}
local ANIMTABLE_J_SYRUP = {
    --[CHAR_ANIM_RUNNING] = "JSYP_RUN",
    [_G.charSelect.CS_ANIM_MENU] = "mario_anim_cs_menu",
}

local EYES_J_WARIO = {
    [CHAR_ANIM_IDLE_HEAD_LEFT] = MARIO_EYES_LOOK_RIGHT,
    [CHAR_ANIM_IDLE_HEAD_RIGHT] = MARIO_EYES_LOOK_LEFT,
    [_G.charSelect.CS_ANIM_MENU] = MARIO_EYES_LOOK_LEFT,
}
local EYES_J_WALUIGI = {
    [CHAR_ANIM_IDLE_HEAD_LEFT] = MARIO_EYES_LOOK_RIGHT,
    [CHAR_ANIM_IDLE_HEAD_RIGHT] = MARIO_EYES_LOOK_LEFT,
    [_G.charSelect.CS_ANIM_MENU] = MARIO_EYES_LOOK_RIGHT,
}
local EYES_J_SYRUP = {
    [CHAR_ANIM_IDLE_HEAD_LEFT] = MARIO_EYES_LOOK_RIGHT,
    [CHAR_ANIM_IDLE_HEAD_RIGHT] = MARIO_EYES_LOOK_LEFT,
    [_G.charSelect.CS_ANIM_MENU] = MARIO_EYES_LOOK_RIGHT,
}

local HEALTH_METER_WARIO = {
    label = {
        left = get_texture_info("char-select-wario-meter-left"),
        right = get_texture_info("char-select-wario-meter-right"),
    }
}
local HEALTH_METER_WALUIGI = {
    label = {
        left = get_texture_info("char-select-waluigi-meter-left"),
        right = get_texture_info("char-select-waluigi-meter-right"),
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
        ""}, "JerThePear", {r = 255, g = 240, b = 000}, E_MODEL_J_WARIO, CT_WARIO, TEX_WARIO, 1)
    CT_J_WALUIGI = _G.charSelect.character_add("Waluigi", { "A lanky rival out for mischief, mayhem, and... tennis?",
        ""}, "JerThePear", {r = 200, g = 000, b = 255}, E_MODEL_J_WALUIGI, CT_WALUIGI, TEX_WALUIGI, 1.1)
    CT_J_SYRUP = _G.charSelect.character_add("Captain Syrup", { "A cunning rival treasure hunter in search of goodies. What is her reason for helping the Wario Bros.?",
        ""}, "JerThePear", {r = 255, g = 000, b = 255}, E_MODEL_J_SYRUP, CT_MARIO, TEX_SYRUP, 1.05)
end

local CSloaded = false
local function on_character_select_load()
    _G.charSelect.character_add_costume(CT_J_WARIO, "Wario", { "A jolly feller with an eye for gold, no matter how dangerous.",
        ""}, "JerThePear", {r = 255, g = 255, b = 000}, E_MODEL_J_WARIO_T, CT_WARIO, gTextures.wario_head)
    for i = 1, #PALETTES_WARIO do
        _G.charSelect.character_add_palette_preset(E_MODEL_J_WARIO, PALETTES_WARIO[i], PALETTES_WARIO[i].name)
        _G.charSelect.character_add_palette_preset(E_MODEL_J_WARIO_T, PALETTES_WARIO[i], PALETTES_WARIO[i].name)
    end
    for i = 1, #PALETTES_WALUIGI do
        _G.charSelect.character_add_palette_preset(E_MODEL_J_WALUIGI, PALETTES_WALUIGI[i], PALETTES_WALUIGI[i].name)
	end
    for i = 1, #PALETTES_SYRUP do
        _G.charSelect.character_add_palette_preset(E_MODEL_J_SYRUP, PALETTES_SYRUP[i], PALETTES_SYRUP[i].name)
	end

    _G.charSelect.character_add_animations(E_MODEL_J_WARIO, ANIMTABLE_J_WARIO, EYES_J_WARIO)
    _G.charSelect.character_add_animations(E_MODEL_J_WARIO_T, ANIMTABLE_J_WARIO, EYES_J_WARIO)
    _G.charSelect.character_add_animations(E_MODEL_J_WALUIGI, ANIMTABLE_J_WALUIGI, EYES_J_WALUIGI)
    _G.charSelect.character_add_animations(E_MODEL_J_SYRUP, ANIMTABLE_J_SYRUP, EYES_J_SYRUP)

    _G.charSelect.character_add_voice(E_MODEL_J_WARIO, VOICETABLE_J_WARIO)
    _G.charSelect.character_add_voice(E_MODEL_J_WARIO_T, VOICETABLE_J_WARIO)
    _G.charSelect.character_add_voice(E_MODEL_J_WALUIGI, VOICETABLE_J_WALUIGI)
    --_G.charSelect.character_add_voice(E_MODEL_J_SYRUP, VOICETABLE_J_SYRUP)

    if VERSION_NUMBER > 40 then

        _G.charSelect.character_add_graffiti(CT_J_WARIO, get_texture_info("char-select-graffiti-wario"))
        _G.charSelect.character_add_graffiti(CT_J_WALUIGI, get_texture_info("char-select-graffiti-waluigi"))
    end

    _G.charSelect.character_add_health_meter(CT_J_WARIO, HEALTH_METER_WARIO)
    _G.charSelect.character_add_health_meter(CT_J_WALUIGI, HEALTH_METER_WALUIGI)

    _G.charSelect.character_set_category(CT_J_WARIO, "Wario Bros.")
    _G.charSelect.character_set_category(CT_J_WALUIGI, "Wario Bros.")
    _G.charSelect.character_set_category(CT_J_SYRUP, "Wario Bros.")

    _G.charSelect.credit_add(TEXT_MOD_NAME, "JerThePear", "Creator")
    _G.charSelect.credit_add(TEXT_MOD_NAME, "theboomeragainstthezoomers", "Voicetables, Palettes, Testing")
    _G.charSelect.credit_add(TEXT_MOD_NAME, "Squishy6094", "Character Select, Coding, Testing")
    _G.charSelect.credit_add(TEXT_MOD_NAME, "Charity", "Bug Fixing, Testing")
    _G.charSelect.credit_add(TEXT_MOD_NAME, "Morishiko", "Testing")

    CSloaded = true
end

local function on_character_sound(m, sound)
    if not CSloaded then return end
    if _G.charSelect.character_get_voice(m) == VOICETABLE_J_WARIO then return _G.charSelect.voice.sound(m, sound) end
    if _G.charSelect.character_get_voice(m) == VOICETABLE_J_WALUIGI then return _G.charSelect.voice.sound(m, sound) end
    --if _G.charSelect.character_get_voice(m) == VOICETABLE_J_SYRUP then return _G.charSelect.voice.sound(m, sound) end
end

local function on_character_snore(m)
    if not CSloaded then return end
    if _G.charSelect.character_get_voice(m) == VOICETABLE_J_WARIO then return _G.charSelect.voice.snore(m) end
    if _G.charSelect.character_get_voice(m) == VOICETABLE_J_WALUIGI then return _G.charSelect.voice.snore(m) end
    --if _G.charSelect.character_get_voice(m) == VOICETABLE_J_SYRUP then return _G.charSelect.voice.snore(m) end
end

hook_event(HOOK_ON_MODS_LOADED, on_character_select_load)
hook_event(HOOK_CHARACTER_SOUND, on_character_sound)
hook_event(HOOK_MARIO_UPDATE, on_character_snore)