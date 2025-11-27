Lights1 jers_wario_cap_Cap_Dark__CAP__lights = gdSPDefLights1(
	0x7F, 0x5F, 0x0,
	0xFF, 0xC1, 0x0, 0x28, 0x28, 0x28);

Lights1 jers_wario_cap_Cap__CAP__lights = gdSPDefLights1(
	0x7F, 0x5F, 0x0,
	0xFF, 0xC1, 0x0, 0x28, 0x28, 0x28);

Lights1 jers_wario_cap_Emblem__EMBLEM__layer2_lights = gdSPDefLights1(
	0x0, 0x0, 0xFF,
	0x0, 0x0, 0x0, 0x28, 0x28, 0x28);

Gfx jers_wario_cap_wario_cutout_i8_aligner[] = {gsSPEndDisplayList()};
u8 jers_wario_cap_wario_cutout_i8[] = {
	#include "actors/jers_wario_cap/wario_cutout.i8.inc.c"
};

Gfx jers_wario_cap_logo_W_i8_aligner[] = {gsSPEndDisplayList()};
u8 jers_wario_cap_logo_W_i8[] = {
	#include "actors/jers_wario_cap/logo_W.i8.inc.c"
};

Vtx jers_wario_cap_Cap_DL_mesh_layer_1_vtx_0[13] = {
	{{ {-137, 12, -34}, 0, {0, 0}, {14, 130, 5, 255} }},
	{{ {-54, 2, -118}, 0, {63, 739}, {32, 135, 23, 255} }},
	{{ {0, 1, -131}, 0, {393, 577}, {246, 131, 20, 255} }},
	{{ {-74, 28, 75}, 0, {-16, 1008}, {19, 132, 237, 255} }},
	{{ {74, 28, 75}, 0, {-16, 1008}, {233, 133, 237, 255} }},
	{{ {137, 12, -34}, 0, {-491, 911}, {243, 132, 26, 255} }},
	{{ {55, 2, -118}, 0, {63, 739}, {224, 135, 23, 255} }},
	{{ {111, 16, 40}, 0, {0, 0}, {242, 130, 3, 255} }},
	{{ {101, 3, 127}, 0, {0, 0}, {223, 139, 218, 255} }},
	{{ {0, 6, 170}, 0, {0, 0}, {0, 136, 215, 255} }},
	{{ {0, 26, 101}, 0, {-16, 1008}, {16, 130, 6, 255} }},
	{{ {-101, 3, 127}, 0, {0, 0}, {34, 139, 219, 255} }},
	{{ {-111, 14, 39}, 0, {0, 0}, {14, 130, 6, 255} }},
};

Gfx jers_wario_cap_Cap_DL_mesh_layer_1_tri_0[] = {
	gsSPVertex(jers_wario_cap_Cap_DL_mesh_layer_1_vtx_0 + 0, 13, 0),
	gsSP2Triangles(0, 1, 2, 0, 3, 0, 2, 0),
	gsSP2Triangles(2, 4, 3, 0, 2, 5, 4, 0),
	gsSP2Triangles(2, 6, 5, 0, 5, 7, 4, 0),
	gsSP2Triangles(8, 4, 7, 0, 4, 8, 9, 0),
	gsSP2Triangles(4, 9, 10, 0, 3, 10, 9, 0),
	gsSP2Triangles(3, 9, 11, 0, 11, 12, 3, 0),
	gsSP2Triangles(3, 12, 0, 0, 4, 10, 3, 0),
	gsSPEndDisplayList(),
};

Vtx jers_wario_cap_Cap_DL_mesh_layer_1_vtx_1[56] = {
	{{ {-82, 38, 103}, 0, {0, 0}, {185, 84, 63, 255} }},
	{{ {-111, 14, 39}, 0, {0, 0}, {153, 72, 21, 255} }},
	{{ {-101, 3, 127}, 0, {0, 0}, {202, 90, 72, 255} }},
	{{ {0, 46, 122}, 0, {0, 0}, {0, 92, 87, 255} }},
	{{ {0, 6, 170}, 0, {0, 0}, {0, 97, 82, 255} }},
	{{ {101, 3, 127}, 0, {0, 0}, {53, 90, 72, 255} }},
	{{ {82, 38, 103}, 0, {0, 0}, {70, 84, 64, 255} }},
	{{ {111, 16, 40}, 0, {0, 0}, {102, 72, 23, 255} }},
	{{ {-54, 2, -118}, 0, {63, 739}, {195, 156, 206, 255} }},
	{{ {-137, 12, -34}, 0, {-491, 911}, {157, 177, 4, 255} }},
	{{ {-96, 25, -146}, 0, {0, 0}, {187, 233, 152, 255} }},
	{{ {-158, 50, -45}, 0, {0, 0}, {146, 54, 223, 255} }},
	{{ {-82, 76, -116}, 0, {0, 0}, {221, 105, 194, 255} }},
	{{ {-107, 76, -66}, 0, {-16, 1008}, {233, 120, 220, 255} }},
	{{ {-100, 115, 45}, 0, {0, 0}, {193, 110, 245, 255} }},
	{{ {-157, 47, 61}, 0, {0, 0}, {141, 2, 53, 255} }},
	{{ {-137, 12, -34}, 0, {0, 0}, {157, 177, 4, 255} }},
	{{ {-111, 14, 39}, 0, {0, 0}, {200, 150, 42, 255} }},
	{{ {-82, 38, 103}, 0, {0, 0}, {209, 210, 109, 255} }},
	{{ {-69, 121, 125}, 0, {0, 0}, {198, 67, 91, 255} }},
	{{ {0, 46, 122}, 0, {0, 0}, {0, 226, 123, 255} }},
	{{ {0, 136, 47}, 0, {0, 0}, {0, 124, 228, 255} }},
	{{ {0, 119, 140}, 0, {0, 0}, {0, 81, 97, 255} }},
	{{ {69, 120, 125}, 0, {0, 0}, {58, 67, 91, 255} }},
	{{ {100, 115, 45}, 0, {0, 0}, {63, 110, 245, 255} }},
	{{ {157, 47, 61}, 0, {0, 0}, {115, 2, 54, 255} }},
	{{ {82, 38, 103}, 0, {0, 0}, {47, 210, 109, 255} }},
	{{ {111, 16, 40}, 0, {0, 0}, {54, 150, 44, 255} }},
	{{ {137, 12, -34}, 0, {0, 0}, {98, 184, 221, 255} }},
	{{ {158, 50, -45}, 0, {0, 0}, {110, 55, 223, 255} }},
	{{ {107, 75, -66}, 0, {-16, 1008}, {23, 120, 220, 255} }},
	{{ {82, 76, -116}, 0, {0, 0}, {35, 105, 194, 255} }},
	{{ {158, 50, -45}, 0, {0, 0}, {110, 55, 223, 255} }},
	{{ {96, 25, -146}, 0, {0, 0}, {69, 233, 152, 255} }},
	{{ {82, 76, -116}, 0, {0, 0}, {35, 105, 194, 255} }},
	{{ {137, 12, -34}, 0, {-491, 911}, {98, 184, 221, 255} }},
	{{ {55, 2, -118}, 0, {63, 739}, {61, 156, 207, 255} }},
	{{ {0, 27, -161}, 0, {0, 0}, {0, 31, 133, 255} }},
	{{ {0, 78, -127}, 0, {0, 0}, {0, 112, 196, 255} }},
	{{ {-82, 76, -116}, 0, {0, 0}, {221, 105, 194, 255} }},
	{{ {-96, 25, -146}, 0, {0, 0}, {187, 233, 152, 255} }},
	{{ {0, 86, -46}, 0, {-13, 830}, {0, 122, 222, 255} }},
	{{ {107, 75, -66}, 0, {-16, 1008}, {23, 120, 220, 255} }},
	{{ {0, 136, 47}, 0, {0, 0}, {0, 124, 228, 255} }},
	{{ {-107, 76, -66}, 0, {-16, 1008}, {233, 120, 220, 255} }},
	{{ {-100, 115, 45}, 0, {0, 0}, {193, 110, 245, 255} }},
	{{ {100, 115, 45}, 0, {0, 0}, {63, 110, 245, 255} }},
	{{ {0, 1, -131}, 0, {393, 577}, {13, 158, 176, 255} }},
	{{ {96, 25, -146}, 0, {-220, 202}, {69, 233, 152, 255} }},
	{{ {0, 27, -161}, 0, {133, 138}, {0, 31, 133, 255} }},
	{{ {-96, 25, -146}, 0, {-220, 202}, {187, 233, 152, 255} }},
	{{ {-54, 2, -118}, 0, {63, 739}, {195, 156, 206, 255} }},
	{{ {0, 46, 122}, 0, {490, 678}, {0, 226, 123, 255} }},
	{{ {69, 120, 125}, 0, {1165, -31}, {58, 67, 91, 255} }},
	{{ {0, 119, 140}, 0, {496, -31}, {0, 81, 97, 255} }},
	{{ {-69, 121, 125}, 0, {1165, -31}, {198, 67, 91, 255} }},
};

Gfx jers_wario_cap_Cap_DL_mesh_layer_1_tri_1[] = {
	gsSPVertex(jers_wario_cap_Cap_DL_mesh_layer_1_vtx_1 + 0, 32, 0),
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
	gsSPVertex(jers_wario_cap_Cap_DL_mesh_layer_1_vtx_1 + 32, 24, 0),
	gsSP2Triangles(0, 1, 2, 0, 3, 1, 0, 0),
	gsSP2Triangles(4, 1, 3, 0, 2, 1, 5, 0),
	gsSP2Triangles(2, 5, 6, 0, 7, 6, 5, 0),
	gsSP2Triangles(7, 5, 8, 0, 9, 6, 7, 0),
	gsSP2Triangles(9, 2, 6, 0, 9, 10, 2, 0),
	gsSP2Triangles(9, 11, 10, 0, 9, 12, 11, 0),
	gsSP2Triangles(9, 7, 12, 0, 11, 12, 13, 0),
	gsSP2Triangles(11, 14, 10, 0, 4, 15, 16, 0),
	gsSP2Triangles(15, 17, 16, 0, 15, 18, 17, 0),
	gsSP2Triangles(19, 18, 15, 0, 20, 21, 22, 0),
	gsSP1Triangle(20, 22, 23, 0),
	gsSPEndDisplayList(),
};

Vtx jers_wario_cap_Cap_DL_mesh_layer_2_vtx_0[6] = {
	{{ {0, 46, 122}, 0, {496, 715}, {0, 226, 123, 255} }},
	{{ {82, 38, 103}, 0, {1150, 795}, {47, 210, 109, 255} }},
	{{ {69, 121, 125}, 0, {1051, 122}, {58, 67, 91, 255} }},
	{{ {0, 119, 140}, 0, {496, 122}, {0, 81, 97, 255} }},
	{{ {-69, 121, 125}, 0, {-59, 122}, {198, 67, 91, 255} }},
	{{ {-82, 38, 103}, 0, {-158, 795}, {209, 210, 109, 255} }},
};

Gfx jers_wario_cap_Cap_DL_mesh_layer_2_tri_0[] = {
	gsSPVertex(jers_wario_cap_Cap_DL_mesh_layer_2_vtx_0 + 0, 6, 0),
	gsSP2Triangles(0, 1, 2, 0, 0, 2, 3, 0),
	gsSP2Triangles(0, 3, 4, 0, 0, 4, 5, 0),
	gsSPEndDisplayList(),
};


Gfx mat_jers_wario_cap_Cap_Dark__CAP_[] = {
	gsSPCopyLightsPlayerPart(CAP),
	gsDPPipeSync(),
	gsDPSetCombineLERP(SHADE, 0, PRIMITIVE, 0, 0, 0, 0, ENVIRONMENT, SHADE, 0, PRIMITIVE, 0, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPSetPrimColor(0, 0, 149, 149, 149, 255),
	gsSPEndDisplayList(),
};

Gfx mat_jers_wario_cap_Cap__CAP_[] = {
	gsSPCopyLightsPlayerPart(CAP),
	gsDPPipeSync(),
	gsDPSetCombineLERP(0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT, 0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsSPEndDisplayList(),
};

Gfx mat_jers_wario_cap_Emblem__EMBLEM__layer2[] = {
	gsSPLight(&jers_wario_cap_Emblem__EMBLEM__layer2_lights.l, 1),
    gsSPLight(&jers_wario_cap_Emblem__EMBLEM__layer2_lights.a, 2),
    gsSPCopyLightEXT(2, 17),
	gsDPPipeSync(),
	gsDPSetCombineLERP(TEXEL0, SHADE, TEXEL1, SHADE, TEXEL0, 0, ENVIRONMENT, 0, TEXEL0, SHADE, TEXEL1, SHADE, TEXEL0, 0, ENVIRONMENT, 0),
	gsDPSetRenderMode(G_RM_AA_ZB_XLU_DECAL, G_RM_AA_ZB_XLU_DECAL2),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPSetTextureImage(G_IM_FMT_I, G_IM_SIZ_8b_LOAD_BLOCK, 1, jers_wario_cap_wario_cutout_i8),
	gsDPSetTile(G_IM_FMT_I, G_IM_SIZ_8b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 511, 512),
	gsDPSetTile(G_IM_FMT_I, G_IM_SIZ_8b, 4, 0, 0, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0),
	gsDPSetTileSize(0, 0, 0, 124, 124),
	gsDPSetTextureImage(G_IM_FMT_I, G_IM_SIZ_8b_LOAD_BLOCK, 1, jers_wario_cap_logo_W_i8),
	gsDPSetTile(G_IM_FMT_I, G_IM_SIZ_8b_LOAD_BLOCK, 0, 128, 6, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(6, 0, 0, 511, 512),
	gsDPSetTile(G_IM_FMT_I, G_IM_SIZ_8b, 4, 128, 1, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0),
	gsDPSetTileSize(1, 0, 0, 124, 124),
	gsSPEndDisplayList(),
};

Gfx mat_revert_jers_wario_cap_Emblem__EMBLEM__layer2[] = {
	gsDPPipeSync(),
	gsSPEndDisplayList(),
};

Gfx jers_wario_cap_Cap_DL_mesh_layer_1[] = {
	gsSPDisplayList(mat_jers_wario_cap_Cap_Dark__CAP_),
	gsSPDisplayList(jers_wario_cap_Cap_DL_mesh_layer_1_tri_0),
	gsSPDisplayList(mat_jers_wario_cap_Cap__CAP_),
	gsSPDisplayList(jers_wario_cap_Cap_DL_mesh_layer_1_tri_1),
	gsSPEndDisplayList(),
};

Gfx jers_wario_cap_Cap_DL_mesh_layer_2[] = {
	gsSPDisplayList(mat_jers_wario_cap_Emblem__EMBLEM__layer2),
	gsSPDisplayList(jers_wario_cap_Cap_DL_mesh_layer_2_tri_0),
	gsSPDisplayList(mat_revert_jers_wario_cap_Emblem__EMBLEM__layer2),
	gsSPEndDisplayList(),
};

Gfx jers_wario_cap_material_revert_render_settings[] = {
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

