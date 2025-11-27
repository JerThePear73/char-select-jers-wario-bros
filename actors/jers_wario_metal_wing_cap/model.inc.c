Lights1 jers_wario_metal_wing_cap_Gold_Metal_lights = gdSPDefLights1(
	0xFF, 0xFF, 0xFF,
	0x0, 0x0, 0x0, 0x28, 0x28, 0x28);

Gfx jers_wario_metal_wing_cap_wing_gold_rgba16_aligner[] = {gsSPEndDisplayList()};
u8 jers_wario_metal_wing_cap_wing_gold_rgba16[] = {
	#include "actors/jers_wario_metal_wing_cap/wing_gold.rgba16.inc.c"
};

Gfx jers_wario_metal_wing_cap_metal_gold_shine_rgba16_aligner[] = {gsSPEndDisplayList()};
u8 jers_wario_metal_wing_cap_metal_gold_shine_rgba16[] = {
	#include "actors/jers_wario_metal_wing_cap/metal_gold_shine.rgba16.inc.c"
};

Gfx jers_wario_metal_wing_cap_metal_gold_rgba16_aligner[] = {gsSPEndDisplayList()};
u8 jers_wario_metal_wing_cap_metal_gold_rgba16[] = {
	#include "actors/jers_wario_metal_wing_cap/metal_gold.rgba16.inc.c"
};

Vtx jers_wario_metal_wing_cap_Winged_Metal_Cap_DL_mesh_layer_4_vtx_0[8] = {
	{{ {171, 150, 66}, 0, {-16, -16}, {102, 180, 0, 255} }},
	{{ {97, 74, 2}, 0, {-16, 1008}, {88, 165, 6, 255} }},
	{{ {133, 98, -142}, 0, {2032, 1008}, {102, 181, 0, 255} }},
	{{ {224, 251, -64}, 0, {2032, -16}, {110, 192, 252, 255} }},
	{{ {-171, 150, 66}, 0, {-16, -16}, {154, 180, 0, 255} }},
	{{ {-133, 98, -142}, 0, {2032, 1008}, {154, 181, 0, 255} }},
	{{ {-97, 74, 2}, 0, {-16, 1008}, {168, 165, 6, 255} }},
	{{ {-224, 251, -64}, 0, {2032, -16}, {146, 192, 252, 255} }},
};

Gfx jers_wario_metal_wing_cap_Winged_Metal_Cap_DL_mesh_layer_4_tri_0[] = {
	gsSPVertex(jers_wario_metal_wing_cap_Winged_Metal_Cap_DL_mesh_layer_4_vtx_0 + 0, 8, 0),
	gsSP2Triangles(0, 1, 2, 0, 0, 2, 3, 0),
	gsSP2Triangles(4, 5, 6, 0, 4, 7, 5, 0),
	gsSPEndDisplayList(),
};

Vtx jers_wario_metal_wing_cap_Winged_Metal_Cap_DL_mesh_layer_1_vtx_0[71] = {
	{{ {-82, 38, 103}, 0, {-228, -228}, {185, 84, 63, 255} }},
	{{ {-111, 14, 39}, 0, {-228, -228}, {153, 72, 21, 255} }},
	{{ {-101, 3, 127}, 0, {-228, -228}, {202, 90, 72, 255} }},
	{{ {0, 46, 122}, 0, {-228, -228}, {0, 92, 87, 255} }},
	{{ {0, 6, 170}, 0, {-228, -228}, {0, 97, 82, 255} }},
	{{ {101, 3, 127}, 0, {-228, -228}, {53, 90, 72, 255} }},
	{{ {82, 38, 103}, 0, {-228, -228}, {70, 84, 64, 255} }},
	{{ {111, 16, 40}, 0, {-228, -228}, {102, 72, 23, 255} }},
	{{ {-54, 2, -118}, 0, {-102, 1250}, {195, 156, 206, 255} }},
	{{ {-137, 12, -34}, 0, {-1209, 1594}, {157, 177, 4, 255} }},
	{{ {-96, 25, -146}, 0, {-228, -228}, {187, 233, 152, 255} }},
	{{ {-158, 50, -45}, 0, {-228, -228}, {146, 54, 223, 255} }},
	{{ {-82, 76, -116}, 0, {-228, -228}, {221, 105, 194, 255} }},
	{{ {-107, 76, -66}, 0, {-260, 1788}, {233, 120, 220, 255} }},
	{{ {-100, 115, 45}, 0, {-228, -228}, {193, 110, 245, 255} }},
	{{ {-157, 47, 61}, 0, {-228, -228}, {141, 2, 53, 255} }},
	{{ {-137, 12, -34}, 0, {-228, -228}, {157, 177, 4, 255} }},
	{{ {-111, 14, 39}, 0, {-228, -228}, {200, 150, 42, 255} }},
	{{ {-82, 38, 103}, 0, {-228, -228}, {209, 210, 109, 255} }},
	{{ {-69, 121, 125}, 0, {-228, -228}, {198, 67, 91, 255} }},
	{{ {0, 46, 122}, 0, {-228, -228}, {0, 226, 123, 255} }},
	{{ {0, 136, 47}, 0, {-228, -228}, {0, 124, 228, 255} }},
	{{ {0, 119, 140}, 0, {-228, -228}, {0, 81, 97, 255} }},
	{{ {69, 120, 125}, 0, {-228, -228}, {58, 67, 91, 255} }},
	{{ {100, 115, 45}, 0, {-228, -228}, {63, 110, 245, 255} }},
	{{ {157, 47, 61}, 0, {-228, -228}, {115, 2, 54, 255} }},
	{{ {82, 38, 103}, 0, {-228, -228}, {47, 210, 109, 255} }},
	{{ {111, 16, 40}, 0, {-228, -228}, {54, 150, 44, 255} }},
	{{ {137, 12, -34}, 0, {-228, -228}, {98, 184, 221, 255} }},
	{{ {158, 50, -45}, 0, {-228, -228}, {110, 55, 223, 255} }},
	{{ {107, 75, -66}, 0, {-260, 1788}, {23, 120, 220, 255} }},
	{{ {82, 76, -116}, 0, {-228, -228}, {35, 105, 194, 255} }},
	{{ {158, 50, -45}, 0, {-228, -228}, {110, 55, 223, 255} }},
	{{ {96, 25, -146}, 0, {-228, -228}, {69, 233, 152, 255} }},
	{{ {82, 76, -116}, 0, {-228, -228}, {35, 105, 194, 255} }},
	{{ {137, 12, -34}, 0, {-1209, 1594}, {98, 184, 221, 255} }},
	{{ {55, 2, -118}, 0, {-102, 1250}, {61, 156, 207, 255} }},
	{{ {0, 27, -161}, 0, {-228, -228}, {0, 31, 133, 255} }},
	{{ {0, 78, -127}, 0, {-228, -228}, {0, 112, 196, 255} }},
	{{ {-82, 76, -116}, 0, {-228, -228}, {221, 105, 194, 255} }},
	{{ {-96, 25, -146}, 0, {-228, -228}, {187, 233, 152, 255} }},
	{{ {0, 86, -46}, 0, {-254, 1431}, {0, 122, 222, 255} }},
	{{ {107, 75, -66}, 0, {-260, 1788}, {23, 120, 220, 255} }},
	{{ {0, 136, 47}, 0, {-228, -228}, {0, 124, 228, 255} }},
	{{ {-107, 76, -66}, 0, {-260, 1788}, {233, 120, 220, 255} }},
	{{ {-100, 115, 45}, 0, {-228, -228}, {193, 110, 245, 255} }},
	{{ {100, 115, 45}, 0, {-228, -228}, {63, 110, 245, 255} }},
	{{ {-137, 12, -34}, 0, {-228, -228}, {14, 130, 5, 255} }},
	{{ {-54, 2, -118}, 0, {-102, 1250}, {32, 135, 23, 255} }},
	{{ {0, 1, -131}, 0, {559, 926}, {246, 131, 20, 255} }},
	{{ {-74, 28, 75}, 0, {-260, 1788}, {19, 132, 237, 255} }},
	{{ {74, 28, 75}, 0, {-260, 1788}, {233, 133, 237, 255} }},
	{{ {137, 12, -34}, 0, {-1209, 1594}, {243, 132, 26, 255} }},
	{{ {55, 2, -118}, 0, {-102, 1250}, {224, 135, 23, 255} }},
	{{ {111, 16, 40}, 0, {-228, -228}, {242, 130, 3, 255} }},
	{{ {101, 3, 127}, 0, {-228, -228}, {223, 139, 218, 255} }},
	{{ {0, 6, 170}, 0, {-228, -228}, {0, 136, 215, 255} }},
	{{ {0, 26, 101}, 0, {-260, 1788}, {16, 130, 6, 255} }},
	{{ {-101, 3, 127}, 0, {-228, -228}, {34, 139, 219, 255} }},
	{{ {-111, 14, 39}, 0, {-228, -228}, {14, 130, 6, 255} }},
	{{ {0, 1, -131}, 0, {559, 926}, {13, 158, 176, 255} }},
	{{ {96, 25, -146}, 0, {-668, 176}, {69, 233, 152, 255} }},
	{{ {0, 27, -161}, 0, {38, 48}, {0, 31, 133, 255} }},
	{{ {-96, 25, -146}, 0, {-668, 176}, {187, 233, 152, 255} }},
	{{ {-54, 2, -118}, 0, {-102, 1250}, {195, 156, 206, 255} }},
	{{ {-96, 25, -146}, 0, {-668, 176}, {187, 233, 152, 255} }},
	{{ {0, 1, -131}, 0, {559, 926}, {13, 158, 176, 255} }},
	{{ {0, 46, 122}, 0, {752, 1129}, {0, 226, 123, 255} }},
	{{ {69, 120, 125}, 0, {2102, -290}, {58, 67, 91, 255} }},
	{{ {0, 119, 140}, 0, {764, -290}, {0, 81, 97, 255} }},
	{{ {-69, 121, 125}, 0, {2102, -290}, {198, 67, 91, 255} }},
};

Gfx jers_wario_metal_wing_cap_Winged_Metal_Cap_DL_mesh_layer_1_tri_0[] = {
	gsSPVertex(jers_wario_metal_wing_cap_Winged_Metal_Cap_DL_mesh_layer_1_vtx_0 + 0, 32, 0),
	gsSP2Triangles(0, 1, 2, 0, 2, 3, 0, 0),
	gsSP2Triangles(2, 4, 3, 0, 5, 3, 4, 0),
	gsSP2Triangles(5, 6, 3, 0, 6, 5, 7, 0),
	gsSP2Triangles(8, 9, 10, 0, 9, 11, 10, 0),
	gsSP2Triangles(11, 12, 10, 0, 11, 13, 12, 0),
	gsSP2Triangles(11, 14, 13, 0, 11, 15, 14, 0),
	gsSP2Triangles(11, 16, 15, 0, 16, 17, 15, 0),
	gsSP2Triangles(18, 15, 17, 0, 18, 19, 15, 0),
	gsSP2Triangles(20, 19, 18, 0, 14, 15, 19, 0),
	gsSP2Triangles(19, 21, 14, 0, 21, 19, 22, 0),
	gsSP2Triangles(21, 22, 23, 0, 23, 24, 21, 0),
	gsSP2Triangles(24, 23, 25, 0, 26, 25, 23, 0),
	gsSP2Triangles(20, 26, 23, 0, 26, 27, 25, 0),
	gsSP2Triangles(28, 25, 27, 0, 29, 25, 28, 0),
	gsSP2Triangles(29, 24, 25, 0, 29, 30, 24, 0),
	gsSP1Triangle(29, 31, 30, 0),
	gsSPVertex(jers_wario_metal_wing_cap_Winged_Metal_Cap_DL_mesh_layer_1_vtx_0 + 32, 32, 0),
	gsSP2Triangles(0, 1, 2, 0, 3, 1, 0, 0),
	gsSP2Triangles(4, 1, 3, 0, 2, 1, 5, 0),
	gsSP2Triangles(2, 5, 6, 0, 7, 6, 5, 0),
	gsSP2Triangles(7, 5, 8, 0, 9, 6, 7, 0),
	gsSP2Triangles(9, 2, 6, 0, 9, 10, 2, 0),
	gsSP2Triangles(9, 11, 10, 0, 9, 12, 11, 0),
	gsSP2Triangles(9, 7, 12, 0, 11, 12, 13, 0),
	gsSP2Triangles(11, 14, 10, 0, 15, 16, 17, 0),
	gsSP2Triangles(18, 15, 17, 0, 17, 19, 18, 0),
	gsSP2Triangles(17, 20, 19, 0, 17, 21, 20, 0),
	gsSP2Triangles(20, 22, 19, 0, 23, 19, 22, 0),
	gsSP2Triangles(19, 23, 24, 0, 19, 24, 25, 0),
	gsSP2Triangles(18, 25, 24, 0, 18, 24, 26, 0),
	gsSP2Triangles(26, 27, 18, 0, 18, 27, 15, 0),
	gsSP2Triangles(19, 25, 18, 0, 4, 28, 29, 0),
	gsSP2Triangles(28, 30, 29, 0, 28, 31, 30, 0),
	gsSPVertex(jers_wario_metal_wing_cap_Winged_Metal_Cap_DL_mesh_layer_1_vtx_0 + 64, 7, 0),
	gsSP2Triangles(0, 1, 2, 0, 3, 4, 5, 0),
	gsSP1Triangle(3, 5, 6, 0),
	gsSPEndDisplayList(),
};


Gfx mat_jers_wario_metal_wing_cap_Wings_Gold[] = {
	gsSPGeometryMode(G_CULL_BACK, 0),
	gsDPPipeSync(),
	gsDPSetCombineLERP(0, 0, 0, TEXEL0, TEXEL0, 0, ENVIRONMENT, 0, 0, 0, 0, TEXEL0, TEXEL0, 0, ENVIRONMENT, 0),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, jers_wario_metal_wing_cap_wing_gold_rgba16),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 2047, 128),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, 0, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, 0),
	gsDPSetTileSize(0, 0, 0, 252, 124),
	gsSPEndDisplayList(),
};

Gfx mat_revert_jers_wario_metal_wing_cap_Wings_Gold[] = {
	gsSPGeometryMode(0, G_CULL_BACK),
	gsDPPipeSync(),
	gsSPEndDisplayList(),
};

Gfx mat_jers_wario_metal_wing_cap_Gold_Metal[] = {
	gsSPGeometryMode(0, G_TEXTURE_GEN),
	gsSPSetLights1(jers_wario_metal_wing_cap_Gold_Metal_lights),
	gsDPPipeSync(),
	gsDPSetCombineLERP(TEXEL0, 0, SHADE, TEXEL1, 0, 0, 0, ENVIRONMENT, TEXEL0, 0, SHADE, TEXEL1, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(4032, 4032, 0, 0, 1),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, jers_wario_metal_wing_cap_metal_gold_shine_rgba16),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 4095, 128),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, 0),
	gsDPSetTileSize(0, 0, 0, 252, 252),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, jers_wario_metal_wing_cap_metal_gold_rgba16),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 1024, 6, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(6, 0, 0, 4095, 128),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 1024, 1, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, 0),
	gsDPSetTileSize(1, 0, 0, 252, 252),
	gsSPEndDisplayList(),
};

Gfx mat_revert_jers_wario_metal_wing_cap_Gold_Metal[] = {
	gsSPGeometryMode(G_TEXTURE_GEN, 0),
	gsDPPipeSync(),
	gsSPEndDisplayList(),
};

Gfx jers_wario_metal_wing_cap_Winged_Metal_Cap_DL_mesh_layer_4[] = {
	gsSPDisplayList(mat_jers_wario_metal_wing_cap_Wings_Gold),
	gsSPDisplayList(jers_wario_metal_wing_cap_Winged_Metal_Cap_DL_mesh_layer_4_tri_0),
	gsSPDisplayList(mat_revert_jers_wario_metal_wing_cap_Wings_Gold),
	gsSPEndDisplayList(),
};

Gfx jers_wario_metal_wing_cap_Winged_Metal_Cap_DL_mesh_layer_1[] = {
	gsSPDisplayList(mat_jers_wario_metal_wing_cap_Gold_Metal),
	gsSPDisplayList(jers_wario_metal_wing_cap_Winged_Metal_Cap_DL_mesh_layer_1_tri_0),
	gsSPDisplayList(mat_revert_jers_wario_metal_wing_cap_Gold_Metal),
	gsSPEndDisplayList(),
};

Gfx jers_wario_metal_wing_cap_material_revert_render_settings[] = {
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

