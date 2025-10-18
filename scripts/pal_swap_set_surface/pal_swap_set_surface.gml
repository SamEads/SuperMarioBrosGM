/// @function pal_swap_set
/// @param palette_sprite_index
function pal_swap_set_surface() {

	shader_set(Pal_Shader);
	var _pal_sprite = argument[0];
	var _pal_index = argument[1];

	//Using a surface based palette
	var tex = surface_get_texture(_pal_sprite);
    
	texture_set_stage(Pal_Texture, tex);
	gpu_set_texfilter_ext(Pal_Texture, 1)
    
	var texel_x = texture_get_texel_width(tex);
	var texel_y = texture_get_texel_height(tex);
	var texel_hx = texel_x * 0.5;
	var texel_hy = texel_y * 0.5;
    
	shader_set_uniform_f(Pal_Texel_Size, texel_x, texel_y);
	shader_set_uniform_f(Pal_UVs, texel_hx, texel_hy, 1.0+texel_hx, 1.0+texel_hy);
	shader_set_uniform_f(Pal_Index, _pal_index);

}