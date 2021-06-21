// INITIALIZE
// Persistent objects
instance_create_layer(0,0, "Instances", o_Glow);
instance_create_layer(0,0, "Instances", o_Input);
instance_create_layer(0,0, "Instances", o_Main);

o_Main.level = "level 1";
//o_Main.level = "start";
room_goto(r_Workshop);
//room_goto(r_Title); // Change this for room selection


