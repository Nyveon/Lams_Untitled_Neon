// Count how many objectives are lit
if checking {
	var counter = 0;
	if o_Main.level == "tutorial 2" {
		with (o_Node) {
			counter += o_Glass.nodes[| index].isHeated()*3;
		}
	}  if o_Main.level == "tutorial 5" {
	} else {
		with (o_Checker_Node) {
			counter += is_lit;
		}
	}
	
	// Win the tutorial level
	if (counter >= goal) {
		tutorial_score += 1;
	}
	if (tutorial_score > 60) {
		checking = false;
		alarm[0] = 30;
		var instance = instance_create_layer(0, 0, "GUI", o_Fade_Out);
		instance.target_room = r_Dialogue_1;
		instance.fade_rate = 0.04;
	}
}


