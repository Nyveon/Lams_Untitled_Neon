// Destroy all node objects
for (var i = 0; i < ds_list_size(nodes); i++) {
	var n = nodes[| i];
	instance_destroy(n.instance);
}

// Destroy ds_list
ds_list_destroy(nodes);
