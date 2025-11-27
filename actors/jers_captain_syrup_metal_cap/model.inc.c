Lights1 jers_captain_syrup_metal_cap_Gold_Metal_lights = gdSPDefLights1(
	0xFF, 0xFF, 0xFF,
	0x0, 0x0, 0x0, 0x28, 0x28, 0x28);

Lights1 jers_captain_syrup_metal_cap_Gold_Metal_No_Culling_lights = gdSPDefLights1(
	0xFF, 0xFF, 0xFF,
	0x0, 0x0, 0x0, 0x28, 0x28, 0x28);

Gfx jers_captain_syrup_metal_cap_metal_gold_shine_rgba16_aligner[] = {gsSPEndDisplayList()};
u8 jers_captain_syrup_metal_cap_metal_gold_shine_rgba16[] = {
	#include "actors/jers_captain_syrup_metal_cap/metal_gold_shine.rgba16.inc.c"
};

Gfx jers_captain_syrup_metal_cap_metal_gold_rgba16_aligner[] = {gsSPEndDisplayList()};
u8 jers_captain_syrup_metal_cap_metal_gold_rgba16[] = {
	#include "actors/jers_captain_syrup_metal_cap/metal_gold.rgba16.inc.c"
};

Vtx jers_captain_syrup_metal_cap_Metal_Cap_DL_mesh_layer_1_vtx_0[57] = {
	{{ {-28, 42, -142}, 0, {1378, 764}, {136, 9, 215, 255} }},
	{{ {-1, 14, -140}, 0, {1378, 764}, {166, 167, 245, 255} }},
	{{ {-15, 26, -121}, 0, {969, 764}, {145, 6, 62, 255} }},
	{{ {27, 42, -142}, 0, {1378, 764}, {120, 9, 215, 255} }},
	{{ {14, 26, -121}, 0, {969, 764}, {111, 6, 62, 255} }},
	{{ {-1, 14, -140}, 0, {1378, 764}, {90, 167, 245, 255} }},
	{{ {-1, 14, -140}, 0, {1020, 1532}, {0, 146, 64, 255} }},
	{{ {83, 11, -92}, 0, {981, 1276}, {197, 151, 42, 255} }},
	{{ {-1, 93, -4}, 0, {1020, 1532}, {0, 133, 226, 255} }},
	{{ {-84, 11, -92}, 0, {981, 1276}, {59, 151, 42, 255} }},
	{{ {-1, 93, -4}, 0, {981, 1276}, {0, 133, 226, 255} }},
	{{ {-120, 6, 9}, 0, {992, 1024}, {73, 154, 239, 255} }},
	{{ {-1, 93, -4}, 0, {992, 1024}, {0, 133, 226, 255} }},
	{{ {-82, 5, 87}, 0, {1007, 754}, {50, 153, 200, 255} }},
	{{ {-1, 93, -4}, 0, {1007, 754}, {0, 133, 226, 255} }},
	{{ {-1, 4, 121}, 0, {1013, 631}, {0, 153, 182, 255} }},
	{{ {-1, 93, -4}, 0, {1013, 631}, {0, 133, 226, 255} }},
	{{ {81, 5, 87}, 0, {1007, 754}, {206, 153, 200, 255} }},
	{{ {-15, 26, -121}, 0, {969, -260}, {145, 6, 62, 255} }},
	{{ {-1, 57, -130}, 0, {969, -260}, {0, 121, 38, 255} }},
	{{ {-28, 42, -142}, 0, {1378, -260}, {136, 9, 215, 255} }},
	{{ {14, 26, -121}, 0, {969, -260}, {111, 6, 62, 255} }},
	{{ {27, 42, -142}, 0, {1378, -260}, {120, 9, 215, 255} }},
	{{ {119, 6, 9}, 0, {992, 1024}, {183, 154, 239, 255} }},
	{{ {-1, 44, -161}, 0, {1788, 764}, {0, 29, 132, 255} }},
	{{ {-1, 14, -140}, 0, {1788, 764}, {0, 185, 151, 255} }},
	{{ {-69, 84, 38}, 0, {1020, 764}, {191, 103, 36, 255} }},
	{{ {-120, 6, 9}, 0, {992, 1024}, {146, 62, 11, 255} }},
	{{ {-82, 5, 87}, 0, {1007, 754}, {188, 61, 88, 255} }},
	{{ {-1, 81, 76}, 0, {1020, 508}, {0, 97, 82, 255} }},
	{{ {-1, 4, 121}, 0, {1013, 631}, {0, 63, 110, 255} }},
	{{ {81, 5, 87}, 0, {1007, 754}, {68, 61, 88, 255} }},
	{{ {81, 5, 87}, 0, {1007, 754}, {68, 61, 88, 255} }},
	{{ {68, 84, 38}, 0, {1020, 764}, {65, 103, 36, 255} }},
	{{ {-1, 81, 76}, 0, {1020, 508}, {0, 97, 82, 255} }},
	{{ {119, 6, 9}, 0, {992, 1024}, {110, 62, 11, 255} }},
	{{ {-1, 112, 3}, 0, {1020, 508}, {0, 127, 4, 255} }},
	{{ {-69, 84, 38}, 0, {1020, 764}, {191, 103, 36, 255} }},
	{{ {-69, 84, 38}, 0, {1020, 1020}, {191, 103, 36, 255} }},
	{{ {-1, 112, 3}, 0, {1020, 1020}, {0, 127, 4, 255} }},
	{{ {-62, 86, -44}, 0, {1012, 1276}, {205, 109, 216, 255} }},
	{{ {-120, 6, 9}, 0, {992, 1024}, {146, 62, 11, 255} }},
	{{ {-84, 11, -92}, 0, {981, 1276}, {184, 71, 179, 255} }},
	{{ {-1, 87, -82}, 0, {1013, 1489}, {0, 110, 192, 255} }},
	{{ {-1, 112, 3}, 0, {1020, 1276}, {0, 127, 4, 255} }},
	{{ {61, 86, -44}, 0, {1012, 1276}, {51, 109, 216, 255} }},
	{{ {83, 11, -92}, 0, {981, 1276}, {72, 71, 179, 255} }},
	{{ {68, 84, 38}, 0, {1020, 1020}, {65, 103, 36, 255} }},
	{{ {-1, 14, -140}, 0, {1020, 1532}, {0, 79, 157, 255} }},
	{{ {-1, 43, -117}, 0, {764, -260}, {0, 89, 91, 255} }},
	{{ {-1, 57, -130}, 0, {559, -260}, {0, 121, 38, 255} }},
	{{ {-15, 26, -121}, 0, {969, -260}, {145, 6, 62, 255} }},
	{{ {14, 26, -121}, 0, {969, -260}, {111, 6, 62, 255} }},
	{{ {-28, 42, -142}, 0, {1378, -260}, {136, 9, 215, 255} }},
	{{ {-1, 57, -130}, 0, {1378, -260}, {0, 121, 38, 255} }},
	{{ {-1, 44, -161}, 0, {1788, -260}, {0, 29, 132, 255} }},
	{{ {27, 42, -142}, 0, {1378, -260}, {120, 9, 215, 255} }},
};

Gfx jers_captain_syrup_metal_cap_Metal_Cap_DL_mesh_layer_1_tri_0[] = {
	gsSPVertex(jers_captain_syrup_metal_cap_Metal_Cap_DL_mesh_layer_1_vtx_0 + 0, 32, 0),
	gsSP2Triangles(0, 1, 2, 0, 3, 4, 5, 0),
	gsSP2Triangles(6, 7, 8, 0, 9, 6, 10, 0),
	gsSP2Triangles(11, 9, 12, 0, 13, 11, 14, 0),
	gsSP2Triangles(15, 13, 16, 0, 17, 15, 14, 0),
	gsSP2Triangles(18, 19, 20, 0, 21, 22, 19, 0),
	gsSP2Triangles(7, 23, 10, 0, 23, 17, 12, 0),
	gsSP2Triangles(24, 25, 0, 0, 24, 3, 25, 0),
	gsSP2Triangles(26, 27, 28, 0, 28, 29, 26, 0),
	gsSP2Triangles(28, 30, 29, 0, 31, 29, 30, 0),
	gsSPVertex(jers_captain_syrup_metal_cap_Metal_Cap_DL_mesh_layer_1_vtx_0 + 32, 25, 0),
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

Vtx jers_captain_syrup_metal_cap_Metal_Cap_DL_mesh_layer_1_vtx_1[8] = {
	{{ {-28, 42, -142}, 0, {1378, 764}, {78, 32, 161, 255} }},
	{{ {-1, 14, -140}, 0, {1788, 764}, {51, 44, 148, 255} }},
	{{ {-34, 10, -158}, 0, {1788, 764}, {78, 32, 161, 255} }},
	{{ {-63, 61, -176}, 0, {1378, 764}, {93, 24, 173, 255} }},
	{{ {27, 42, -142}, 0, {1378, 764}, {178, 32, 161, 255} }},
	{{ {33, 10, -158}, 0, {1788, 764}, {178, 32, 161, 255} }},
	{{ {-1, 14, -140}, 0, {1788, 764}, {205, 44, 148, 255} }},
	{{ {62, 61, -176}, 0, {1378, 764}, {163, 24, 173, 255} }},
};

Gfx jers_captain_syrup_metal_cap_Metal_Cap_DL_mesh_layer_1_tri_1[] = {
	gsSPVertex(jers_captain_syrup_metal_cap_Metal_Cap_DL_mesh_layer_1_vtx_1 + 0, 8, 0),
	gsSP2Triangles(0, 1, 2, 0, 0, 2, 3, 0),
	gsSP2Triangles(4, 5, 6, 0, 4, 7, 5, 0),
	gsSPEndDisplayList(),
};


Gfx mat_jers_captain_syrup_metal_cap_Gold_Metal[] = {
	gsSPGeometryMode(0, G_TEXTURE_GEN),
	gsSPSetLights1(jers_captain_syrup_metal_cap_Gold_Metal_lights),
	gsDPPipeSync(),
	gsDPSetCombineLERP(TEXEL0, 0, SHADE, TEXEL1, 0, 0, 0, ENVIRONMENT, TEXEL0, 0, SHADE, TEXEL1, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(4032, 4032, 0, 0, 1),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, jers_captain_syrup_metal_cap_metal_gold_shine_rgba16),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 4095, 128),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, 0),
	gsDPSetTileSize(0, 0, 0, 252, 252),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, jers_captain_syrup_metal_cap_metal_gold_rgba16),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 1024, 6, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(6, 0, 0, 4095, 128),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 1024, 1, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, 0),
	gsDPSetTileSize(1, 0, 0, 252, 252),
	gsSPEndDisplayList(),
};

Gfx mat_revert_jers_captain_syrup_metal_cap_Gold_Metal[] = {
	gsSPGeometryMode(G_TEXTURE_GEN, 0),
	gsDPPipeSync(),
	gsSPEndDisplayList(),
};

Gfx mat_jers_captain_syrup_metal_cap_Gold_Metal_No_Culling[] = {
	gsSPGeometryMode(G_CULL_BACK, G_TEXTURE_GEN),
	gsSPSetLights1(jers_captain_syrup_metal_cap_Gold_Metal_No_Culling_lights),
	gsDPPipeSync(),
	gsDPSetCombineLERP(TEXEL0, 0, SHADE, TEXEL1, 0, 0, 0, ENVIRONMENT, TEXEL0, 0, SHADE, TEXEL1, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(4032, 4032, 0, 0, 1),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, jers_captain_syrup_metal_cap_metal_gold_shine_rgba16),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 4095, 128),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, 0),
	gsDPSetTileSize(0, 0, 0, 252, 252),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, jers_captain_syrup_metal_cap_metal_gold_rgba16),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 1024, 6, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(6, 0, 0, 4095, 128),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 1024, 1, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, 0),
	gsDPSetTileSize(1, 0, 0, 252, 252),
	gsSPEndDisplayList(),
};

Gfx mat_revert_jers_captain_syrup_metal_cap_Gold_Metal_No_Culling[] = {
	gsSPGeometryMode(G_TEXTURE_GEN, G_CULL_BACK),
	gsDPPipeSync(),
	gsSPEndDisplayList(),
};

Gfx jers_captain_syrup_metal_cap_Metal_Cap_DL_mesh_layer_1[] = {
	gsSPDisplayList(mat_jers_captain_syrup_metal_cap_Gold_Metal),
	gsSPDisplayList(jers_captain_syrup_metal_cap_Metal_Cap_DL_mesh_layer_1_tri_0),
	gsSPDisplayList(mat_revert_jers_captain_syrup_metal_cap_Gold_Metal),
	gsSPDisplayList(mat_jers_captain_syrup_metal_cap_Gold_Metal_No_Culling),
	gsSPDisplayList(jers_captain_syrup_metal_cap_Metal_Cap_DL_mesh_layer_1_tri_1),
	gsSPDisplayList(mat_revert_jers_captain_syrup_metal_cap_Gold_Metal_No_Culling),
	gsSPEndDisplayList(),
};

Gfx jers_captain_syrup_metal_cap_material_revert_render_settings[] = {
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

