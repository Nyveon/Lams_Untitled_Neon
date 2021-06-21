// INITIALIZE
// Persistent objects
instance_create_layer(0,0, "Instances", o_Glow);
instance_create_layer(0,0, "Instances", o_Input);
instance_create_layer(0,0, "Instances", o_Main);


room_goto(r_Title); // Change this for room selection
o_Main.level = "start";
//room_goto(r_Tutorial_Workshop);
