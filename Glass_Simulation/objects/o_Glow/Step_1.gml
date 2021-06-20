/// @description Insert description here
// You can write your code in this editor
if !surface_exists(glow_pass_surface) {
	glow_pass_surface = surface_create(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
}