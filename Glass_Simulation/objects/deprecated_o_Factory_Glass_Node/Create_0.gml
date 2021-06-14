/*
var mid = instance_create_layer(room_width/2, room_height/2, "Instances", o_Glass_Node);
var right = instance_create_layer(room_width/2 + 72, room_height/2, "Instances", o_Glass_Node);
var left = instance_create_layer(room_width/2 - 72, room_height/2, "Instances", o_Glass_Node);

mid.right = right;
mid.left = left;
right.left = mid;
left.right = mid;
*/


a = instance_create_layer(room_width/2 - 144, room_height/2, "Instances", o_Glass_Node);
for (var i = 0; i < 256; i++) {
	b = instance_create_layer(room_width/2 - 144 + (a.joint_distance*i), room_height/2, "Instances", o_Glass_Node);
	a.right = b;
	b.left = a;
	a = b;
}

a = instance_create_layer(room_width/2 - 144, room_height/2 + 7, "Instances", o_Glass_Node);
for (var i = 0; i < 128; i++) {
	b = instance_create_layer(room_width/2 - 144 + (a.joint_distance*i), room_height/2 + 7, "Instances", o_Glass_Node);
	a.right = b;
	b.left = a;
	a = b;
}

