// Draw all nodes
for (var i = 0; i < ds_list_size(nodes); i++) {
	var n = nodes[| i]
	n.draw();
}
draw_set_color(c_white);