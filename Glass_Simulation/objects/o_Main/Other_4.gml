switch (level) {
	// --Main menu, intro cutscene and first dialogue--
	case "start":
		play_track(0);
	
		if (room == r_Dialogue_1) {
			var fade = instance_create_layer(0, 0, "Text", o_Fade_In);
			fade.target_action = function() {
				o_Young_YY.initiate_conversation();
			}
			fade.my_text = "15 years ago...";
		}
		

		
		break;
	// -- Tutorials --
	case "tutorial 1": // --Move tutorial
		if (room = r_Tutorial_Workshop) {
			play_track(1);
			
			var letter = letter_line;
			var ll = array_length(letter)
			start_minigame_1(letter, room_width/2 - ll/2, 92, ll);
			
			// Hide flame
			o_Flame.muted = true;
			o_Flame.x = 1000;
			o_Flame.y = 1000;
			
			// Fake buttons
			var fb = 0;
			fb = instance_create_layer(86, 205, "GUI", o_Fake_Button);
			fb.sprite_index = s_Rotate;
			fb = instance_create_layer(139, 205, "GUI", o_Fake_Button);
			fb.sprite_index = s_Pull;
			fb = instance_create_layer(221, 205, "GUI", o_Fake_Button);
			fb.sprite_index = s_Reset;
			fb = instance_create_layer(282, 205, "GUI", o_Fake_Button);
			fb.sprite_index = s_Done;
			
			
			var instance = instance_create_layer(0, 0, "Instances", o_Tutorial_Objective);
			instance.goal = ll;
			
		} else if (room == r_Dialogue_1) { // Tutorial ended	
			leave_tutorial();			
		}
		break;
	case "tutorial 2": // --Heat tutorial
		if (room = r_Tutorial_Workshop) {
			
			var letter = letter_line;
			var ll = array_length(letter)
			// Glass bar for level
			var glass = instance_create_layer(x, y, "Instances", o_Glass);
			with glass {
				//Make DA TUBE
				for (var i = 0; i < ll; i++) {
					ds_list_add(nodes, new Node(room_width/2 - ll/2 + (joint_distance*i), 92, i));
				}
			}
			
			// Fake buttons
			var fb = 0;
			fb = instance_create_layer(86, 205, "GUI", o_Fake_Button);
			fb.sprite_index = s_Rotate;
			fb = instance_create_layer(139, 205, "GUI", o_Fake_Button);
			fb.sprite_index = s_Pull;
			fb = instance_create_layer(221, 205, "GUI", o_Fake_Button);
			fb.sprite_index = s_Reset;
			fb = instance_create_layer(282, 205, "GUI", o_Fake_Button);
			fb.sprite_index = s_Done;
			
			var instance = instance_create_layer(0, 0, "Instances", o_Tutorial_Objective);
			instance.goal = ll;

			
		} else if (room == r_Dialogue_1) { // Tutorial ended
			leave_tutorial();		
		}
		break;	
	case "tutorial 3": // --Rotate tutorial
		if (room = r_Tutorial_Workshop) {
			
			var letter = letter_rotate;
			var ll = array_length(letter)
			start_minigame_1(letter, room_width/2, 64, ll);
			var instance = instance_create_layer(0, 0, "Instances", o_Tutorial_Objective);
			instance.goal = ll;
			
			// Add relevant buttons
			instance_create_layer(86, 205, "GUI", o_Button_Rotate);
			instance_create_layer(221, 205, "GUI", o_Button_Reset);
			
			// Fake buttons
			var fb = 0;
			fb = instance_create_layer(139, 205, "GUI", o_Fake_Button);
			fb.sprite_index = s_Pull;
			fb = instance_create_layer(282, 205, "GUI", o_Fake_Button);
			fb.sprite_index = s_Done;
			
			// Hide flame
			o_Flame.muted = true;
			o_Flame.x = 1000;
			o_Flame.y = 1000;
		
		} else if (room == r_Dialogue_1) { // Tutorial ended	
			leave_tutorial();			
		}
		break;
	case "tutorial 4":
		if (room = r_Tutorial_Workshop) {
			
			var letter = letter_bend;
			var ll = array_length(letter)
			start_minigame_1(letter, room_width/2, 64, ll);
			var instance = instance_create_layer(0, 0, "Instances", o_Tutorial_Objective);
			instance.goal = ll;
			
			// Add relevant buttons
			instance_create_layer(86, 205, "GUI", o_Button_Rotate);
			instance_create_layer(221, 205, "GUI", o_Button_Reset);
			
			// Fake buttons
			var fb = 0;
			fb = instance_create_layer(139, 205, "GUI", o_Fake_Button);
			fb.sprite_index = s_Pull;
			fb = instance_create_layer(282, 205, "GUI", o_Fake_Button);
			fb.sprite_index = s_Done;
		
		} else if (room == r_Dialogue_1) { // Tutorial ended	
			leave_tutorial();			
		}
		break;
	case "tutorial 5":
		if (room = r_Tutorial_Workshop) {
			
			var letter = letter_pull;
			var ll = array_length(letter)
			start_minigame_1(letter, room_width/2 - ll/2, 92, ll);
			var instance = instance_create_layer(0, 0, "Instances", o_Tutorial_Objective);
			instance.goal = ll;
			
			// Add relevant buttons
			instance_create_layer(86, 205, "GUI", o_Button_Rotate);
			instance_create_layer(139, 205, "GUI", o_Button_Pull);
			instance_create_layer(221, 205, "GUI", o_Button_Reset);
			instance_create_layer(282, 205, "GUI", o_Button_Done);
			
		} else if (room == r_Dialogue_1) { // Tutorial ended	
			leave_tutorial();			
		}
		break;		
	case "tutorial 6":
		if (room == r_Dialogue_1) { // Tutorial ended	
			leave_tutorial();			
		}
		break;
	case "cutscene 1":
		if (room == r_Dialogue_1) {
			var fade = instance_create_layer(0, 0, "Text", o_Fade_In);
			fade.target_action = function() {
				o_Young_YY.initiate_conversation();
			}
			fade.my_text = "10 years ago...";
		}
	case "level 1":
		play_track(2);
	
		break;
}