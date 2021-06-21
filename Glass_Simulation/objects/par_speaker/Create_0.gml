
//-----------Customise (FOR USER)
//playerobject = o_Player;
interact_key = ord("E");
detection_radius = 320;

myVoice			= snd_voice1;
myPortrait		= -1;
myFont			= f_Silver14;
myName			= "None";
myColour = c_white;

myPortraitTalk		= -1;
myPortraitTalk_x	= -1;
myPortraitTalk_y	= -1;
myPortraitIdle		= -1;
myPortraitIdle_x	= -1;
myPortraitIdle_y	= -1;

//-----------Defaults Setup (LEAVE THIS STUFF)
reset_dialogue_defaults();


line = function(__speaker, _text) {
	var pre_text = _text;
	var string_len = string_length(pre_text);
	var final_text = "";

	//myTextCol[i] = [1, __speaker.myColour];
	myTextCol[i] = [];
	myEffects[i] = [];
	var current_index = 1;
	
	for (var j = 1; j <= string_len; j++) {
		var ch = string_char_at(pre_text, j);
		if (ch != "|") {
			final_text += ch;
		} else {
			j++;
			ch = string_char_at(pre_text, j);
			switch ch {
				// -- Colors --
				case "w": // White text
					array_push(myTextCol[i], current_index, c_white);
					break;
				case "r": // Red text
					array_push(myTextCol[i], current_index, c_red);
					break;
				case "g": // Green text
					array_push(myTextCol[i], current_index, c_lime);
					break;
				case "b": // Blue text
					array_push(myTextCol[i], current_index, c_aqua);
					break;
				case "p": // Pink text
					array_push(myTextCol[i], current_index, c_fuchsia);
					break;
				case "d": // Default color
					array_push(myTextCol[i], current_index, myColour);
					break;
				// -- Effects --
				case "0": // Normal
					array_push(myEffects[i], current_index, 0);
					break;
				case "1": // Shake
					array_push(myEffects[i], current_index, 1);
					break;
				case "2": // Wave
					array_push(myEffects[i], current_index, 2);
					break;
				case "3": // Colour Shift
					array_push(myEffects[i], current_index, 3);
					break;
				case "4": // Wave+Shift
					array_push(myEffects[i], current_index, 4);
					break;
				case "5": // Spin
					array_push(myEffects[i], current_index, 5);
					break;
				case "6": // Pulse
					array_push(myEffects[i], current_index, 6);
					break;
				case "7": // Flicker
					array_push(myEffects[i], current_index, 7);
					break;
				case "8": // Neon
					array_push(myEffects[i], current_index, 8);
					break;
				
			}
			current_index -= 1;
		}
		current_index++;
	} 
	
	// Default color
	if (array_length(myTextCol[i]) > 0) {
		if (myTextCol[i][0] != 1) {
			//array_push(myTextCol[i], 1, myColour);
			show_debug_message("Here");
			array_insert(myTextCol[i], 0, 1, myColour);
		}
	} else {
		myTextCol[i] = [1, __speaker.myColour];
	}
	
	myText[i] = final_text;
	mySpeaker[i] = __speaker;
}


initiate_conversation = function() {
	if(myTextbox != noone){ 
		if(!instance_exists(myTextbox)){ myTextbox = noone; exit; }
	}
	//if I haven't already created my textbox, make one:
	else {
		if(instance_exists(obj_textbox)){ exit; }	//exit if a textbox already exists
		event_user(0);								//if you need variables to update for text
			
		//Hand over variables
		create_dialogue(myText, mySpeaker, myEffects, myTextSpeed, myTypes, myNextLine, myScripts, myTextCol, myEmotion, myEmote);
	}
}