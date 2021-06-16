// Draw all nodes

// Outer glow shader
if (glowing) {
	surface_set_target(o_Glow.glow_pass_surface);
	for (var i = 0; i < ds_list_size(nodes); i++) {
		var n = nodes[| i]
		n.draw();
	}
	surface_reset_target();
}

// Draw normally
for (var i = 0; i < ds_list_size(nodes); i++) {
	var n = nodes[| i]
	n.draw();
}