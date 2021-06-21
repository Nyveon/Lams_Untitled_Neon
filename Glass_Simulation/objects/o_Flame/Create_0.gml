num = 0;
old_num = 0;
touching = ds_list_create();

// Heating element
hitbox_offset_y = 4;
hitbox = instance_create_layer(x, y, "Instances", o_FlameHitbox);

// Dragging
dragging = false;
mouse_relative_x = 0;
mouse_relative_y = 0;

//todo: split in two
//todo: draggable