#include "src/game/envfx_snow.h"

const GeoLayout jers_wario_ring_particle_geo[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_SCALE(LAYER_OPAQUE, 19661),
		GEO_OPEN_NODE(),
			GEO_ASM(LAYER_OPAQUE + 3, geo_mario_set_player_colors),
GEO_ASM(LAYER_ALPHA + 3, geo_mario_set_player_colors),
GEO_ASM(LAYER_TRANSPARENT + 3, geo_mario_set_player_colors),

			GEO_ASM(LAYER_OPAQUE << 2, geo_mirror_mario_backface_culling),
GEO_ASM(LAYER_ALPHA << 2, geo_mirror_mario_backface_culling),
GEO_ASM(LAYER_TRANSPARENT << 2, geo_mirror_mario_backface_culling),

			GEO_ASM((LAYER_OPAQUE << 2) | 1, geo_mirror_mario_backface_culling),
GEO_ASM((LAYER_ALPHA << 2) | 1, geo_mirror_mario_backface_culling),
GEO_ASM((LAYER_TRANSPARENT << 2) | 1, geo_mirror_mario_backface_culling),

			GEO_DISPLAY_LIST(LAYER_TRANSPARENT, jers_wario_ring_particle_Ring_mesh_layer_5),
		GEO_CLOSE_NODE(),
		GEO_DISPLAY_LIST(LAYER_TRANSPARENT, jers_wario_ring_particle_material_revert_render_settings),
	GEO_CLOSE_NODE(),
	GEO_END(),
};
