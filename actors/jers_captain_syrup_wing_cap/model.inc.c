Lights1 jers_captain_syrup_wing_cap_Hat__CAP__lights = gdSPDefLights1(
	0x68, 0x0, 0x7F,
	0xD2, 0x0, 0xFF, 0x28, 0x28, 0x28);

Lights1 jers_captain_syrup_wing_cap_Hat_No_Culling__CAP__lights = gdSPDefLights1(
	0x68, 0x0, 0x7F,
	0xD2, 0x0, 0xFF, 0x28, 0x28, 0x28);

Gfx jers_captain_syrup_wing_cap_wing_ia8_aligner[] = {gsSPEndDisplayList()};
u8 jers_captain_syrup_wing_cap_wing_ia8[] = {
	#include "actors/jers_captain_syrup_wing_cap/wing.ia8.inc.c"
};

Vtx jers_captain_syrup_wing_cap_Wing_Cap_DL_mesh_layer_1_vtx_0[57] = {
	{{ {-28, 42, -142}, 0, {803, 496}, {136, 9, 215, 255} }},
	{{ {-1, 14, -140}, 0, {803, 496}, {166, 167, 245, 255} }},
	{{ {-15, 26, -121}, 0, {598, 496}, {145, 6, 62, 255} }},
	{{ {27, 42, -142}, 0, {803, 496}, {120, 9, 215, 255} }},
	{{ {14, 26, -121}, 0, {598, 496}, {111, 6, 62, 255} }},
	{{ {-1, 14, -140}, 0, {803, 496}, {90, 167, 245, 255} }},
	{{ {-1, 14, -140}, 0, {624, 880}, {0, 146, 64, 255} }},
	{{ {83, 11, -92}, 0, {605, 752}, {197, 151, 42, 255} }},
	{{ {-1, 93, -4}, 0, {624, 880}, {0, 133, 226, 255} }},
	{{ {-84, 11, -92}, 0, {605, 752}, {59, 151, 42, 255} }},
	{{ {-1, 93, -4}, 0, {605, 752}, {0, 133, 226, 255} }},
	{{ {-120, 6, 9}, 0, {610, 626}, {73, 154, 239, 255} }},
	{{ {-1, 93, -4}, 0, {610, 626}, {0, 133, 226, 255} }},
	{{ {-82, 5, 87}, 0, {618, 491}, {50, 153, 200, 255} }},
	{{ {-1, 93, -4}, 0, {618, 491}, {0, 133, 226, 255} }},
	{{ {-1, 4, 121}, 0, {621, 430}, {0, 153, 182, 255} }},
	{{ {-1, 93, -4}, 0, {621, 430}, {0, 133, 226, 255} }},
	{{ {81, 5, 87}, 0, {618, 491}, {206, 153, 200, 255} }},
	{{ {-15, 26, -121}, 0, {598, -16}, {145, 6, 62, 255} }},
	{{ {-1, 57, -130}, 0, {598, -16}, {0, 121, 38, 255} }},
	{{ {-28, 42, -142}, 0, {803, -16}, {136, 9, 215, 255} }},
	{{ {14, 26, -121}, 0, {598, -16}, {111, 6, 62, 255} }},
	{{ {27, 42, -142}, 0, {803, -16}, {120, 9, 215, 255} }},
	{{ {119, 6, 9}, 0, {610, 626}, {183, 154, 239, 255} }},
	{{ {-1, 44, -161}, 0, {1008, 496}, {0, 29, 132, 255} }},
	{{ {-1, 14, -140}, 0, {1008, 496}, {0, 185, 151, 255} }},
	{{ {-69, 84, 38}, 0, {624, 496}, {191, 103, 36, 255} }},
	{{ {-120, 6, 9}, 0, {610, 626}, {146, 62, 11, 255} }},
	{{ {-82, 5, 87}, 0, {618, 491}, {188, 61, 88, 255} }},
	{{ {-1, 81, 76}, 0, {624, 368}, {0, 97, 82, 255} }},
	{{ {-1, 4, 121}, 0, {621, 430}, {0, 63, 110, 255} }},
	{{ {81, 5, 87}, 0, {618, 491}, {68, 61, 88, 255} }},
	{{ {81, 5, 87}, 0, {618, 491}, {68, 61, 88, 255} }},
	{{ {68, 84, 38}, 0, {624, 496}, {65, 103, 36, 255} }},
	{{ {-1, 81, 76}, 0, {624, 368}, {0, 97, 82, 255} }},
	{{ {119, 6, 9}, 0, {610, 626}, {110, 62, 11, 255} }},
	{{ {-1, 112, 3}, 0, {624, 368}, {0, 127, 4, 255} }},
	{{ {-69, 84, 38}, 0, {624, 496}, {191, 103, 36, 255} }},
	{{ {-69, 84, 38}, 0, {624, 624}, {191, 103, 36, 255} }},
	{{ {-1, 112, 3}, 0, {624, 624}, {0, 127, 4, 255} }},
	{{ {-62, 86, -44}, 0, {620, 752}, {205, 109, 216, 255} }},
	{{ {-120, 6, 9}, 0, {610, 626}, {146, 62, 11, 255} }},
	{{ {-84, 11, -92}, 0, {605, 752}, {184, 71, 179, 255} }},
	{{ {-1, 87, -82}, 0, {621, 859}, {0, 110, 192, 255} }},
	{{ {-1, 112, 3}, 0, {624, 752}, {0, 127, 4, 255} }},
	{{ {61, 86, -44}, 0, {620, 752}, {51, 109, 216, 255} }},
	{{ {83, 11, -92}, 0, {605, 752}, {72, 71, 179, 255} }},
	{{ {68, 84, 38}, 0, {624, 624}, {65, 103, 36, 255} }},
	{{ {-1, 14, -140}, 0, {624, 880}, {0, 79, 157, 255} }},
	{{ {-1, 43, -117}, 0, {496, -16}, {0, 89, 91, 255} }},
	{{ {-1, 57, -130}, 0, {394, -16}, {0, 121, 38, 255} }},
	{{ {-15, 26, -121}, 0, {598, -16}, {145, 6, 62, 255} }},
	{{ {14, 26, -121}, 0, {598, -16}, {111, 6, 62, 255} }},
	{{ {-28, 42, -142}, 0, {803, -16}, {136, 9, 215, 255} }},
	{{ {-1, 57, -130}, 0, {803, -16}, {0, 121, 38, 255} }},
	{{ {-1, 44, -161}, 0, {1008, -16}, {0, 29, 132, 255} }},
	{{ {27, 42, -142}, 0, {803, -16}, {120, 9, 215, 255} }},
};

Gfx jers_captain_syrup_wing_cap_Wing_Cap_DL_mesh_layer_1_tri_0[] = {
	gsSPVertex(jers_captain_syrup_wing_cap_Wing_Cap_DL_mesh_layer_1_vtx_0 + 0, 32, 0),
	gsSP2Triangles(0, 1, 2, 0, 3, 4, 5, 0),
	gsSP2Triangles(6, 7, 8, 0, 9, 6, 10, 0),
	gsSP2Triangles(11, 9, 12, 0, 13, 11, 14, 0),
	gsSP2Triangles(15, 13, 16, 0, 17, 15, 14, 0),
	gsSP2Triangles(18, 19, 20, 0, 21, 22, 19, 0),
	gsSP2Triangles(7, 23, 10, 0, 23, 17, 12, 0),
	gsSP2Triangles(24, 25, 0, 0, 24, 3, 25, 0),
	gsSP2Triangles(26, 27, 28, 0, 28, 29, 26, 0),
	gsSP2Triangles(28, 30, 29, 0, 31, 29, 30, 0),
	gsSPVertex(jers_captain_syrup_wing_cap_Wing_Cap_DL_mesh_layer_1_vtx_0 + 32, 25, 0),
	gsSP2Triangles(0, 1, 2, 0, 1, 0, 3, 0),
	gsSP2Triangles(2, 1, 4, 0, 2, 4, 5, 0),
	gsSP2Triangles(6, 7, 8, 0, 9, 6, 8, 0),
	gsSP2Triangles(9, 8, 10, 0, 10, 8, 11, 0),
	gsSP2Triangles(8, 12, 11, 0, 13, 11, 12, 0),
	gsSP2Triangles(11, 13, 14, 0, 3, 14, 13, 0),
	gsSP2Triangles(3, 13, 15, 0, 15, 13, 7, 0),
	gsSP2Triangles(11, 14, 16, 0, 10, 11, 16, 0),
	gsSP2Triangles(17, 18, 19, 0, 17, 20, 18, 0),
	gsSP2Triangles(21, 22, 23, 0, 24, 23, 22, 0),
	gsSPEndDisplayList(),
};

Vtx jers_captain_syrup_wing_cap_Wing_Cap_DL_mesh_layer_1_vtx_1[8] = {
	{{ {-28, 42, -142}, 0, {803, 496}, {78, 32, 161, 255} }},
	{{ {-1, 14, -140}, 0, {1008, 496}, {51, 44, 148, 255} }},
	{{ {-34, 10, -158}, 0, {1008, 496}, {78, 32, 161, 255} }},
	{{ {-63, 61, -176}, 0, {803, 496}, {93, 24, 173, 255} }},
	{{ {27, 42, -142}, 0, {803, 496}, {178, 32, 161, 255} }},
	{{ {33, 10, -158}, 0, {1008, 496}, {178, 32, 161, 255} }},
	{{ {-1, 14, -140}, 0, {1008, 496}, {205, 44, 148, 255} }},
	{{ {62, 61, -176}, 0, {803, 496}, {163, 24, 173, 255} }},
};

Gfx jers_captain_syrup_wing_cap_Wing_Cap_DL_mesh_layer_1_tri_1[] = {
	gsSPVertex(jers_captain_syrup_wing_cap_Wing_Cap_DL_mesh_layer_1_vtx_1 + 0, 8, 0),
	gsSP2Triangles(0, 1, 2, 0, 0, 2, 3, 0),
	gsSP2Triangles(4, 5, 6, 0, 4, 7, 5, 0),
	gsSPEndDisplayList(),
};

Vtx jers_captain_syrup_wing_cap_Wing_Cap_DL_mesh_layer_4_vtx_0[8] = {
	{{ {-143, 136, 72}, 0, {-16, -16}, {158, 181, 30, 255} }},
	{{ {-105, 14, -105}, 0, {2032, 1008}, {158, 181, 30, 255} }},
	{{ {-70, 42, 39}, 0, {-16, 1008}, {168, 173, 38, 255} }},
	{{ {-197, 185, -85}, 0, {2032, -16}, {146, 195, 18, 255} }},
	{{ {142, 136, 72}, 0, {-16, -16}, {98, 181, 30, 255} }},
	{{ {69, 42, 39}, 0, {-16, 1008}, {88, 173, 38, 255} }},
	{{ {104, 14, -105}, 0, {2032, 1008}, {98, 181, 30, 255} }},
	{{ {196, 185, -85}, 0, {2032, -16}, {110, 195, 18, 255} }},
};

Gfx jers_captain_syrup_wing_cap_Wing_Cap_DL_mesh_layer_4_tri_0[] = {
	gsSPVertex(jers_captain_syrup_wing_cap_Wing_Cap_DL_mesh_layer_4_vtx_0 + 0, 8, 0),
	gsSP2Triangles(0, 1, 2, 0, 0, 3, 1, 0),
	gsSP2Triangles(4, 5, 6, 0, 4, 6, 7, 0),
	gsSPEndDisplayList(),
};


Gfx mat_jers_captain_syrup_wing_cap_Hat__CAP_[] = {
	gsSPCopyLightsPlayerPart(CAP),
	gsDPPipeSync(),
	gsDPSetCombineLERP(0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT, 0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsSPEndDisplayList(),
};

Gfx mat_jers_captain_syrup_wing_cap_Hat_No_Culling__CAP_[] = {
	gsSPGeometryMode(G_CULL_BACK, 0),
	gsSPCopyLightsPlayerPart(CAP),
	gsDPPipeSync(),
	gsDPSetCombineLERP(0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT, 0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsSPEndDisplayList(),
};

Gfx mat_revert_jers_captain_syrup_wing_cap_Hat_No_Culling__CAP_[] = {
	gsSPGeometryMode(0, G_CULL_BACK),
	gsDPPipeSync(),
	gsSPEndDisplayList(),
};

Gfx mat_jers_captain_syrup_wing_cap_Wing_New[] = {
	gsSPGeometryMode(G_CULL_BACK, 0),
	gsDPPipeSync(),
	gsDPSetCombineLERP(0, 0, 0, TEXEL0, TEXEL0, 0, ENVIRONMENT, 0, 0, 0, 0, TEXEL0, TEXEL0, 0, ENVIRONMENT, 0),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPSetTextureImage(G_IM_FMT_IA, G_IM_SIZ_8b_LOAD_BLOCK, 1, jers_captain_syrup_wing_cap_wing_ia8),
	gsDPSetTile(G_IM_FMT_IA, G_IM_SIZ_8b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 1023, 256),
	gsDPSetTile(G_IM_FMT_IA, G_IM_SIZ_8b, 8, 0, 0, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, 0),
	gsDPSetTileSize(0, 0, 0, 252, 124),
	gsSPEndDisplayList(),
};

Gfx mat_revert_jers_captain_syrup_wing_cap_Wing_New[] = {
	gsSPGeometryMode(0, G_CULL_BACK),
	gsDPPipeSync(),
	gsSPEndDisplayList(),
};

Gfx jers_captain_syrup_wing_cap_Wing_Cap_DL_mesh_layer_1[] = {
	gsSPDisplayList(mat_jers_captain_syrup_wing_cap_Hat__CAP_),
	gsSPDisplayList(jers_captain_syrup_wing_cap_Wing_Cap_DL_mesh_layer_1_tri_0),
	gsSPDisplayList(mat_jers_captain_syrup_wing_cap_Hat_No_Culling__CAP_),
	gsSPDisplayList(jers_captain_syrup_wing_cap_Wing_Cap_DL_mesh_layer_1_tri_1),
	gsSPDisplayList(mat_revert_jers_captain_syrup_wing_cap_Hat_No_Culling__CAP_),
	gsSPEndDisplayList(),
};

Gfx jers_captain_syrup_wing_cap_Wing_Cap_DL_mesh_layer_4[] = {
	gsSPDisplayList(mat_jers_captain_syrup_wing_cap_Wing_New),
	gsSPDisplayList(jers_captain_syrup_wing_cap_Wing_Cap_DL_mesh_layer_4_tri_0),
	gsSPDisplayList(mat_revert_jers_captain_syrup_wing_cap_Wing_New),
	gsSPEndDisplayList(),
};

Gfx jers_captain_syrup_wing_cap_material_revert_render_settings[] = {
	gsDPPipeSync(),
	gsSPSetGeometryMode(G_LIGHTING),
	gsSPClearGeometryMode(G_TEXTURE_GEN),
	gsDPSetCombineLERP(0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT, 0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(65535, 65535, 0, 0, 0),
	gsDPSetEnvColor(255, 255, 255, 255),
	gsDPSetAlphaCompare(G_AC_NONE),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, 0),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP  | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 1023, 256),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, 0, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0),
	gsDPSetTileSize(0, 0, 0, 124, 124),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, 0),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 256, 6, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(6, 0, 0, 1023, 256),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 256, 1, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0),
	gsDPSetTileSize(1, 0, 0, 124, 124),
	gsSPEndDisplayList(),
};

