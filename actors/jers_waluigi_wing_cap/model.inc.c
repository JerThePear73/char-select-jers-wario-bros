Lights1 jers_waluigi_wing_cap_Emblem__EMBLEM__layer2_lights = gdSPDefLights1(
	0xFF, 0xC3, 0x0,
	0x0, 0x0, 0x0, 0x28, 0x28, 0x28);

Lights1 jers_waluigi_wing_cap_Cap__CAP__lights = gdSPDefLights1(
	0x34, 0xA, 0x4A,
	0x6F, 0x1F, 0x9A, 0x28, 0x28, 0x28);

Lights1 jers_waluigi_wing_cap_Cap_Dark__CAP__lights = gdSPDefLights1(
	0x34, 0xA, 0x4A,
	0x6F, 0x1F, 0x9A, 0x28, 0x28, 0x28);

Gfx jers_waluigi_wing_cap_wing_ia8_aligner[] = {gsSPEndDisplayList()};
u8 jers_waluigi_wing_cap_wing_ia8[] = {
	#include "actors/jers_waluigi_wing_cap/wing.ia8.inc.c"
};

Gfx jers_waluigi_wing_cap_logo_cutout_waluigi_i8_aligner[] = {gsSPEndDisplayList()};
u8 jers_waluigi_wing_cap_logo_cutout_waluigi_i8[] = {
	#include "actors/jers_waluigi_wing_cap/logo_cutout_waluigi.i8.inc.c"
};

Gfx jers_waluigi_wing_cap_logo_L_i8_aligner[] = {gsSPEndDisplayList()};
u8 jers_waluigi_wing_cap_logo_L_i8[] = {
	#include "actors/jers_waluigi_wing_cap/logo_L.i8.inc.c"
};

Vtx jers_waluigi_wing_cap_Wing_Cap_DL_mesh_layer_4_vtx_0[8] = {
	{{ {144, 145, 70}, 0, {-16, -16}, {102, 180, 0, 255} }},
	{{ {71, 69, 7}, 0, {-16, 1008}, {88, 165, 7, 255} }},
	{{ {106, 92, -138}, 0, {2032, 1008}, {102, 181, 0, 255} }},
	{{ {197, 245, -60}, 0, {2032, -16}, {110, 192, 252, 255} }},
	{{ {-148, 145, 70}, 0, {-16, -16}, {154, 180, 0, 255} }},
	{{ {-109, 92, -138}, 0, {2032, 1008}, {154, 181, 0, 255} }},
	{{ {-74, 69, 7}, 0, {-16, 1008}, {168, 165, 7, 255} }},
	{{ {-201, 245, -60}, 0, {2032, -16}, {146, 192, 252, 255} }},
};

Gfx jers_waluigi_wing_cap_Wing_Cap_DL_mesh_layer_4_tri_0[] = {
	gsSPVertex(jers_waluigi_wing_cap_Wing_Cap_DL_mesh_layer_4_vtx_0 + 0, 8, 0),
	gsSP2Triangles(0, 1, 2, 0, 0, 2, 3, 0),
	gsSP2Triangles(4, 5, 6, 0, 4, 7, 5, 0),
	gsSPEndDisplayList(),
};

Vtx jers_waluigi_wing_cap_Wing_Cap_DL_mesh_layer_2_vtx_0[8] = {
	{{ {0, 125, 103}, 0, {502, 40}, {17, 55, 113, 255} }},
	{{ {55, 34, 64}, 0, {1008, 917}, {54, 204, 102, 255} }},
	{{ {69, 113, 96}, 0, {1133, 159}, {45, 33, 114, 255} }},
	{{ {0, 49, 76}, 0, {502, 766}, {0, 214, 120, 255} }},
	{{ {0, 49, 76}, 0, {490, 766}, {0, 214, 120, 255} }},
	{{ {0, 125, 103}, 0, {490, 40}, {17, 55, 113, 255} }},
	{{ {-55, 34, 64}, 0, {-16, 917}, {202, 204, 102, 255} }},
	{{ {-68, 113, 96}, 0, {-141, 159}, {167, 11, 90, 255} }},
};

Gfx jers_waluigi_wing_cap_Wing_Cap_DL_mesh_layer_2_tri_0[] = {
	gsSPVertex(jers_waluigi_wing_cap_Wing_Cap_DL_mesh_layer_2_vtx_0 + 0, 8, 0),
	gsSP2Triangles(0, 1, 2, 0, 3, 1, 0, 0),
	gsSP2Triangles(4, 5, 6, 0, 5, 7, 6, 0),
	gsSPEndDisplayList(),
};

Vtx jers_waluigi_wing_cap_Wing_Cap_DL_mesh_layer_1_vtx_0[80] = {
	{{ {78, 11, 0}, 0, {623, 740}, {117, 210, 16, 255} }},
	{{ {84, 9, -37}, 0, {624, 752}, {123, 228, 240, 255} }},
	{{ {102, 47, -33}, 0, {880, 496}, {118, 28, 218, 255} }},
	{{ {65, 4, 95}, 0, {432, 752}, {65, 87, 66, 255} }},
	{{ {78, 11, 0}, 0, {623, 740}, {111, 58, 19, 255} }},
	{{ {55, 34, 64}, 0, {-16, 1008}, {86, 81, 47, 255} }},
	{{ {84, 9, -37}, 0, {880, 496}, {123, 228, 240, 255} }},
	{{ {69, -3, -69}, 0, {880, 496}, {100, 237, 180, 255} }},
	{{ {63, 65, -45}, 0, {880, 476}, {42, 102, 194, 255} }},
	{{ {0, 78, -50}, 0, {880, 427}, {0, 110, 193, 255} }},
	{{ {69, 132, 39}, 0, {880, 496}, {65, 104, 223, 255} }},
	{{ {-62, 65, -45}, 0, {880, 476}, {214, 102, 194, 255} }},
	{{ {-68, 132, 39}, 0, {880, 496}, {191, 104, 223, 255} }},
	{{ {69, 113, 96}, 0, {880, 477}, {89, 11, 90, 255} }},
	{{ {97, 54, 17}, 0, {804, 555}, {121, 244, 38, 255} }},
	{{ {69, 113, 96}, 0, {880, 452}, {89, 11, 90, 255} }},
	{{ {55, 34, 64}, 0, {304, 880}, {54, 204, 102, 255} }},
	{{ {-77, 11, 0}, 0, {623, 740}, {139, 210, 16, 255} }},
	{{ {-101, 47, -33}, 0, {880, 496}, {138, 28, 218, 255} }},
	{{ {-83, 9, -37}, 0, {624, 752}, {139, 219, 223, 255} }},
	{{ {-64, 4, 95}, 0, {432, 752}, {191, 87, 66, 255} }},
	{{ {-54, 34, 64}, 0, {-16, 1008}, {170, 81, 47, 255} }},
	{{ {-77, 11, 0}, 0, {623, 740}, {145, 58, 19, 255} }},
	{{ {-83, 9, -37}, 0, {880, 496}, {139, 219, 223, 255} }},
	{{ {-68, -3, -69}, 0, {880, 496}, {162, 240, 172, 255} }},
	{{ {-96, 54, 17}, 0, {804, 555}, {135, 244, 38, 255} }},
	{{ {-68, 113, 96}, 0, {880, 477}, {167, 11, 90, 255} }},
	{{ {-68, 113, 96}, 0, {880, 452}, {167, 11, 90, 255} }},
	{{ {-54, 34, 64}, 0, {304, 880}, {202, 204, 102, 255} }},
	{{ {97, 54, 17}, 0, {624, 752}, {121, 244, 38, 255} }},
	{{ {55, 34, 64}, 0, {-16, 1008}, {54, 204, 102, 255} }},
	{{ {102, 47, -33}, 0, {624, 752}, {118, 28, 218, 255} }},
	{{ {69, 132, 39}, 0, {624, 752}, {65, 104, 223, 255} }},
	{{ {97, 54, 17}, 0, {624, 752}, {121, 244, 38, 255} }},
	{{ {102, 47, -33}, 0, {624, 752}, {118, 28, 218, 255} }},
	{{ {63, 65, -45}, 0, {624, 752}, {42, 102, 194, 255} }},
	{{ {69, -3, -69}, 0, {624, 752}, {100, 237, 180, 255} }},
	{{ {62, 51, -98}, 0, {624, 752}, {73, 47, 163, 255} }},
	{{ {0, -2, -104}, 0, {624, 752}, {253, 215, 136, 255} }},
	{{ {0, -2, -104}, 0, {624, 816}, {253, 215, 136, 255} }},
	{{ {0, 64, -121}, 0, {624, 816}, {0, 70, 150, 255} }},
	{{ {-61, 51, -98}, 0, {624, 752}, {183, 47, 163, 255} }},
	{{ {-68, -3, -69}, 0, {624, 752}, {162, 240, 172, 255} }},
	{{ {-101, 47, -33}, 0, {624, 752}, {138, 28, 218, 255} }},
	{{ {69, 132, 39}, 0, {880, 421}, {65, 104, 223, 255} }},
	{{ {0, 78, -50}, 0, {880, 368}, {0, 110, 193, 255} }},
	{{ {0, 151, 41}, 0, {880, 368}, {0, 121, 218, 255} }},
	{{ {-68, 132, 39}, 0, {880, 421}, {191, 104, 223, 255} }},
	{{ {102, 47, -33}, 0, {880, 496}, {118, 28, 218, 255} }},
	{{ {62, 51, -98}, 0, {880, 496}, {73, 47, 163, 255} }},
	{{ {63, 65, -45}, 0, {880, 476}, {42, 102, 194, 255} }},
	{{ {0, 64, -121}, 0, {880, 368}, {0, 70, 150, 255} }},
	{{ {-61, 51, -98}, 0, {880, 496}, {183, 47, 163, 255} }},
	{{ {-62, 65, -45}, 0, {880, 476}, {214, 102, 194, 255} }},
	{{ {-101, 47, -33}, 0, {880, 496}, {138, 28, 218, 255} }},
	{{ {0, 125, 103}, 0, {502, 40}, {0, 41, 120, 255} }},
	{{ {55, 34, 64}, 0, {1008, 917}, {54, 204, 102, 255} }},
	{{ {69, 113, 96}, 0, {1133, 159}, {89, 11, 90, 255} }},
	{{ {0, 49, 76}, 0, {502, 766}, {0, 214, 120, 255} }},
	{{ {-54, 34, 64}, 0, {1008, 917}, {202, 204, 102, 255} }},
	{{ {-68, 113, 96}, 0, {1133, 159}, {167, 11, 90, 255} }},
	{{ {0, 125, 103}, 0, {880, 427}, {0, 41, 120, 255} }},
	{{ {69, 113, 96}, 0, {880, 477}, {89, 11, 90, 255} }},
	{{ {69, 132, 39}, 0, {880, 433}, {65, 104, 223, 255} }},
	{{ {0, 125, 103}, 0, {880, 427}, {0, 41, 120, 255} }},
	{{ {0, 151, 41}, 0, {880, 368}, {0, 121, 218, 255} }},
	{{ {-68, 132, 39}, 0, {880, 433}, {191, 104, 223, 255} }},
	{{ {-68, 113, 96}, 0, {880, 477}, {167, 11, 90, 255} }},
	{{ {65, 4, 95}, 0, {656, 560}, {65, 87, 66, 255} }},
	{{ {55, 34, 64}, 0, {432, 688}, {86, 81, 47, 255} }},
	{{ {0, 49, 76}, 0, {880, 368}, {0, 96, 84, 255} }},
	{{ {0, 4, 125}, 0, {880, 368}, {0, 93, 86, 255} }},
	{{ {-64, 4, 95}, 0, {656, 560}, {191, 87, 66, 255} }},
	{{ {-54, 34, 64}, 0, {432, 688}, {170, 81, 47, 255} }},
	{{ {-77, 11, 0}, 0, {623, 740}, {139, 210, 16, 255} }},
	{{ {-54, 34, 64}, 0, {-16, 1008}, {202, 204, 102, 255} }},
	{{ {-96, 54, 17}, 0, {624, 752}, {135, 244, 38, 255} }},
	{{ {-101, 47, -33}, 0, {624, 752}, {138, 28, 218, 255} }},
	{{ {-68, 132, 39}, 0, {624, 752}, {191, 104, 223, 255} }},
	{{ {-62, 65, -45}, 0, {624, 752}, {214, 102, 194, 255} }},
};

Gfx jers_waluigi_wing_cap_Wing_Cap_DL_mesh_layer_1_tri_0[] = {
	gsSPVertex(jers_waluigi_wing_cap_Wing_Cap_DL_mesh_layer_1_vtx_0 + 0, 32, 0),
	gsSP2Triangles(0, 1, 2, 0, 3, 4, 5, 0),
	gsSP2Triangles(6, 7, 2, 0, 8, 9, 10, 0),
	gsSP2Triangles(11, 12, 9, 0, 10, 13, 14, 0),
	gsSP2Triangles(15, 16, 14, 0, 17, 18, 19, 0),
	gsSP2Triangles(20, 21, 22, 0, 23, 18, 24, 0),
	gsSP2Triangles(12, 25, 26, 0, 27, 25, 28, 0),
	gsSP2Triangles(0, 29, 30, 0, 31, 29, 0, 0),
	gsSPVertex(jers_waluigi_wing_cap_Wing_Cap_DL_mesh_layer_1_vtx_0 + 32, 32, 0),
	gsSP2Triangles(0, 1, 2, 0, 0, 2, 3, 0),
	gsSP2Triangles(4, 5, 2, 0, 4, 6, 5, 0),
	gsSP2Triangles(7, 8, 5, 0, 7, 9, 8, 0),
	gsSP2Triangles(10, 9, 6, 0, 10, 11, 9, 0),
	gsSP2Triangles(12, 13, 14, 0, 15, 14, 13, 0),
	gsSP2Triangles(16, 17, 18, 0, 17, 13, 18, 0),
	gsSP2Triangles(17, 19, 13, 0, 20, 13, 19, 0),
	gsSP2Triangles(20, 21, 13, 0, 22, 21, 20, 0),
	gsSP2Triangles(23, 24, 25, 0, 26, 24, 23, 0),
	gsSP2Triangles(26, 23, 27, 0, 23, 28, 27, 0),
	gsSP2Triangles(29, 30, 31, 0, 29, 31, 14, 0),
	gsSPVertex(jers_waluigi_wing_cap_Wing_Cap_DL_mesh_layer_1_vtx_0 + 64, 16, 0),
	gsSP2Triangles(0, 1, 2, 0, 0, 2, 3, 0),
	gsSP2Triangles(4, 5, 6, 0, 4, 6, 7, 0),
	gsSP2Triangles(8, 7, 6, 0, 8, 6, 9, 0),
	gsSP2Triangles(10, 11, 12, 0, 13, 10, 12, 0),
	gsSP2Triangles(14, 13, 12, 0, 14, 15, 13, 0),
	gsSPEndDisplayList(),
};

Vtx jers_waluigi_wing_cap_Wing_Cap_DL_mesh_layer_1_vtx_1[17] = {
	{{ {-50, 14, 52}, 0, {752, 624}, {199, 145, 233, 255} }},
	{{ {-64, 4, 95}, 0, {880, 496}, {18, 132, 233, 255} }},
	{{ {-77, 11, 0}, 0, {623, 740}, {22, 134, 27, 255} }},
	{{ {50, 14, 52}, 0, {752, 624}, {179, 162, 36, 255} }},
	{{ {78, 11, 0}, 0, {623, 740}, {234, 134, 27, 255} }},
	{{ {65, 4, 95}, 0, {880, 496}, {238, 132, 233, 255} }},
	{{ {84, 9, -37}, 0, {880, 496}, {234, 132, 18, 255} }},
	{{ {-83, 9, -37}, 0, {624, 752}, {18, 134, 29, 255} }},
	{{ {-50, 14, 52}, 0, {880, 496}, {199, 145, 233, 255} }},
	{{ {0, 17, 62}, 0, {880, 368}, {12, 160, 174, 255} }},
	{{ {-64, 4, 95}, 0, {880, 432}, {18, 132, 233, 255} }},
	{{ {0, 4, 125}, 0, {880, 368}, {0, 132, 230, 255} }},
	{{ {65, 4, 95}, 0, {880, 432}, {238, 132, 233, 255} }},
	{{ {50, 14, 52}, 0, {880, 496}, {179, 162, 36, 255} }},
	{{ {0, -2, -104}, 0, {624, 752}, {1, 130, 19, 255} }},
	{{ {69, -3, -69}, 0, {624, 752}, {234, 133, 21, 255} }},
	{{ {-68, -3, -69}, 0, {880, 496}, {19, 134, 29, 255} }},
};

Gfx jers_waluigi_wing_cap_Wing_Cap_DL_mesh_layer_1_tri_1[] = {
	gsSPVertex(jers_waluigi_wing_cap_Wing_Cap_DL_mesh_layer_1_vtx_1 + 0, 17, 0),
	gsSP2Triangles(0, 1, 2, 0, 3, 4, 5, 0),
	gsSP2Triangles(6, 4, 3, 0, 7, 6, 3, 0),
	gsSP2Triangles(3, 8, 7, 0, 3, 9, 8, 0),
	gsSP2Triangles(9, 10, 8, 0, 9, 11, 10, 0),
	gsSP2Triangles(9, 12, 11, 0, 9, 13, 12, 0),
	gsSP2Triangles(8, 2, 7, 0, 14, 15, 6, 0),
	gsSP2Triangles(7, 14, 6, 0, 7, 16, 14, 0),
	gsSPEndDisplayList(),
};


Gfx mat_jers_waluigi_wing_cap_Wing_New[] = {
	gsSPGeometryMode(G_CULL_BACK, 0),
	gsDPPipeSync(),
	gsDPSetCombineLERP(0, 0, 0, TEXEL0, TEXEL0, 0, ENVIRONMENT, 0, 0, 0, 0, TEXEL0, TEXEL0, 0, ENVIRONMENT, 0),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPSetTextureImage(G_IM_FMT_IA, G_IM_SIZ_8b_LOAD_BLOCK, 1, jers_waluigi_wing_cap_wing_ia8),
	gsDPSetTile(G_IM_FMT_IA, G_IM_SIZ_8b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 1023, 256),
	gsDPSetTile(G_IM_FMT_IA, G_IM_SIZ_8b, 8, 0, 0, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, 0),
	gsDPSetTileSize(0, 0, 0, 252, 124),
	gsSPEndDisplayList(),
};

Gfx mat_revert_jers_waluigi_wing_cap_Wing_New[] = {
	gsSPGeometryMode(0, G_CULL_BACK),
	gsDPPipeSync(),
	gsSPEndDisplayList(),
};

Gfx mat_jers_waluigi_wing_cap_Emblem__EMBLEM__layer2[] = {
	gsSPLight(&jers_waluigi_wing_cap_Emblem__EMBLEM__layer2_lights.l, 1),
    gsSPLight(&jers_waluigi_wing_cap_Emblem__EMBLEM__layer2_lights.a, 2),
    gsSPCopyLightEXT(2, 17),
	gsDPPipeSync(),
	gsDPSetCombineLERP(TEXEL0, SHADE, TEXEL1, SHADE, TEXEL0, 0, ENVIRONMENT, 0, TEXEL0, SHADE, TEXEL1, SHADE, TEXEL0, 0, ENVIRONMENT, 0),
	gsDPSetRenderMode(G_RM_AA_ZB_XLU_DECAL, G_RM_AA_ZB_XLU_DECAL2),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPSetTextureImage(G_IM_FMT_I, G_IM_SIZ_8b_LOAD_BLOCK, 1, jers_waluigi_wing_cap_logo_cutout_waluigi_i8),
	gsDPSetTile(G_IM_FMT_I, G_IM_SIZ_8b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 511, 512),
	gsDPSetTile(G_IM_FMT_I, G_IM_SIZ_8b, 4, 0, 0, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0),
	gsDPSetTileSize(0, 0, 0, 124, 124),
	gsDPSetTextureImage(G_IM_FMT_I, G_IM_SIZ_8b_LOAD_BLOCK, 1, jers_waluigi_wing_cap_logo_L_i8),
	gsDPSetTile(G_IM_FMT_I, G_IM_SIZ_8b_LOAD_BLOCK, 0, 128, 6, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(6, 0, 0, 511, 512),
	gsDPSetTile(G_IM_FMT_I, G_IM_SIZ_8b, 4, 128, 1, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0),
	gsDPSetTileSize(1, 0, 0, 124, 124),
	gsSPEndDisplayList(),
};

Gfx mat_revert_jers_waluigi_wing_cap_Emblem__EMBLEM__layer2[] = {
	gsDPPipeSync(),
	gsDPSetRenderMode(G_RM_AA_ZB_OPA_DECAL, G_RM_AA_ZB_OPA_DECAL2),
	gsSPEndDisplayList(),
};

Gfx mat_jers_waluigi_wing_cap_Cap__CAP_[] = {
	gsSPCopyLightsPlayerPart(CAP),
	gsDPPipeSync(),
	gsDPSetCombineLERP(0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT, 0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsSPEndDisplayList(),
};

Gfx mat_jers_waluigi_wing_cap_Cap_Dark__CAP_[] = {
	gsSPCopyLightsPlayerPart(CAP),
	gsDPPipeSync(),
	gsDPSetCombineLERP(SHADE, 0, PRIMITIVE, 0, 0, 0, 0, ENVIRONMENT, SHADE, 0, PRIMITIVE, 0, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPSetPrimColor(0, 0, 149, 149, 149, 255),
	gsSPEndDisplayList(),
};

Gfx jers_waluigi_wing_cap_Wing_Cap_DL_mesh_layer_4[] = {
	gsSPDisplayList(mat_jers_waluigi_wing_cap_Wing_New),
	gsSPDisplayList(jers_waluigi_wing_cap_Wing_Cap_DL_mesh_layer_4_tri_0),
	gsSPDisplayList(mat_revert_jers_waluigi_wing_cap_Wing_New),
	gsSPEndDisplayList(),
};

Gfx jers_waluigi_wing_cap_Wing_Cap_DL_mesh_layer_2[] = {
	gsSPDisplayList(mat_jers_waluigi_wing_cap_Emblem__EMBLEM__layer2),
	gsSPDisplayList(jers_waluigi_wing_cap_Wing_Cap_DL_mesh_layer_2_tri_0),
	gsSPDisplayList(mat_revert_jers_waluigi_wing_cap_Emblem__EMBLEM__layer2),
	gsSPEndDisplayList(),
};

Gfx jers_waluigi_wing_cap_Wing_Cap_DL_mesh_layer_1[] = {
	gsSPDisplayList(mat_jers_waluigi_wing_cap_Cap__CAP_),
	gsSPDisplayList(jers_waluigi_wing_cap_Wing_Cap_DL_mesh_layer_1_tri_0),
	gsSPDisplayList(mat_jers_waluigi_wing_cap_Cap_Dark__CAP_),
	gsSPDisplayList(jers_waluigi_wing_cap_Wing_Cap_DL_mesh_layer_1_tri_1),
	gsSPEndDisplayList(),
};

Gfx jers_waluigi_wing_cap_material_revert_render_settings[] = {
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

