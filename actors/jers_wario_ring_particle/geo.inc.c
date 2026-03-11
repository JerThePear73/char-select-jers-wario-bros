#include "src/game/envfx_snow.h"

const GeoLayout jers_wario_ring_particle_1_Switch_opt1[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_DISPLAY_LIST(LAYER_TRANSPARENT_INTER, jers_wario_ring_particle_Ring_mesh_layer_7_mat_override_Ring_Particle_Tex_1_0),
	GEO_CLOSE_NODE(),
	GEO_RETURN(),
};
const GeoLayout jers_wario_ring_particle_1_Switch_opt2[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_DISPLAY_LIST(LAYER_TRANSPARENT_INTER, jers_wario_ring_particle_Ring_mesh_layer_7_mat_override_Ring_Particle_Tex_2_1),
	GEO_CLOSE_NODE(),
	GEO_RETURN(),
};
const GeoLayout jers_wario_ring_particle_1_Switch_opt3[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_DISPLAY_LIST(LAYER_TRANSPARENT_INTER, jers_wario_ring_particle_Ring_mesh_layer_7_mat_override_Ring_Particle_Tex_3_2),
	GEO_CLOSE_NODE(),
	GEO_RETURN(),
};
const GeoLayout jers_wario_ring_particle_1_Switch_opt4[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_DISPLAY_LIST(LAYER_TRANSPARENT_INTER, jers_wario_ring_particle_Ring_mesh_layer_7_mat_override_Ring_Particle_Tex_4_3),
	GEO_CLOSE_NODE(),
	GEO_RETURN(),
};
const GeoLayout jers_wario_ring_particle_1_Switch_opt5[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_DISPLAY_LIST(LAYER_TRANSPARENT_INTER, jers_wario_ring_particle_Ring_mesh_layer_7_mat_override_Ring_Particle_Tex_5_4),
	GEO_CLOSE_NODE(),
	GEO_RETURN(),
};
const GeoLayout jers_wario_ring_particle_1_Switch_opt6[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_DISPLAY_LIST(LAYER_TRANSPARENT_INTER, jers_wario_ring_particle_Ring_mesh_layer_7_mat_override_Ring_Particle_Tex_6_5),
	GEO_CLOSE_NODE(),
	GEO_RETURN(),
};
const GeoLayout jers_wario_ring_particle_1_Switch_opt7[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_DISPLAY_LIST(LAYER_TRANSPARENT_INTER, jers_wario_ring_particle_Ring_mesh_layer_7_mat_override_Ring_Particle_Tex_7_6),
	GEO_CLOSE_NODE(),
	GEO_RETURN(),
};
const GeoLayout jers_wario_ring_particle_1_Switch_opt8[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_DISPLAY_LIST(LAYER_TRANSPARENT_INTER, jers_wario_ring_particle_Ring_mesh_layer_7_mat_override_Ring_Particle_Tex_8_7),
	GEO_CLOSE_NODE(),
	GEO_RETURN(),
};
const GeoLayout jers_wario_ring_particle_1_Switch_opt9[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_DISPLAY_LIST(LAYER_TRANSPARENT_INTER, jers_wario_ring_particle_Ring_mesh_layer_7_mat_override_Ring_Particle_Tex_9_8),
	GEO_CLOSE_NODE(),
	GEO_RETURN(),
};
const GeoLayout jers_wario_ring_particle_1_Switch_opt10[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_DISPLAY_LIST(LAYER_TRANSPARENT_INTER, jers_wario_ring_particle_Ring_mesh_layer_7_mat_override_Ring_Particle_Tex_10_9),
	GEO_CLOSE_NODE(),
	GEO_RETURN(),
};
const GeoLayout jers_wario_ring_particle_geo[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_SCALE(LAYER_OPAQUE, 19661),
		GEO_OPEN_NODE(),
			GEO_ASM(LAYER_OPAQUE + 3, geo_mario_set_player_colors),
GEO_ASM(LAYER_ALPHA + 3, geo_mario_set_player_colors),
GEO_ASM(LAYER_TRANSPARENT + 3, geo_mario_set_player_colors),

			GEO_SWITCH_CASE(0, jwar_ring_particle_anim),
			GEO_OPEN_NODE(),
				GEO_NODE_START(),
				GEO_OPEN_NODE(),
					GEO_DISPLAY_LIST(LAYER_TRANSPARENT_INTER, jers_wario_ring_particle_Ring_mesh_layer_7),
				GEO_CLOSE_NODE(),
				GEO_BRANCH(1, jers_wario_ring_particle_1_Switch_opt1),
				GEO_BRANCH(1, jers_wario_ring_particle_1_Switch_opt2),
				GEO_BRANCH(1, jers_wario_ring_particle_1_Switch_opt3),
				GEO_BRANCH(1, jers_wario_ring_particle_1_Switch_opt4),
				GEO_BRANCH(1, jers_wario_ring_particle_1_Switch_opt5),
				GEO_BRANCH(1, jers_wario_ring_particle_1_Switch_opt6),
				GEO_BRANCH(1, jers_wario_ring_particle_1_Switch_opt7),
				GEO_BRANCH(1, jers_wario_ring_particle_1_Switch_opt8),
				GEO_BRANCH(1, jers_wario_ring_particle_1_Switch_opt9),
				GEO_BRANCH(1, jers_wario_ring_particle_1_Switch_opt10),
			GEO_CLOSE_NODE(),
			GEO_ASM(LAYER_OPAQUE << 2, geo_mirror_mario_backface_culling),
GEO_ASM(LAYER_ALPHA << 2, geo_mirror_mario_backface_culling),
GEO_ASM(LAYER_TRANSPARENT << 2, geo_mirror_mario_backface_culling),

			GEO_ASM((LAYER_OPAQUE << 2) | 1, geo_mirror_mario_backface_culling),
GEO_ASM((LAYER_ALPHA << 2) | 1, geo_mirror_mario_backface_culling),
GEO_ASM((LAYER_TRANSPARENT << 2) | 1, geo_mirror_mario_backface_culling),

		GEO_CLOSE_NODE(),
		GEO_DISPLAY_LIST(LAYER_TRANSPARENT_INTER, jers_wario_ring_particle_material_revert_render_settings),
	GEO_CLOSE_NODE(),
	GEO_END(),
};
