// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function dialogue_scripts(){
	return;
}

// Intro cutscene function for switching off the lights
function intro(_i) {
	audio_sound_pitch(d_Off, random_range(0.8,1.1));
	audio_play_sound(d_Off, 1, 0);
	switch (_i) {
		case 0:
			o_Cutsign_1.glowing = false;
			o_Cutsign_2.flickering = true;
			break;
		case 1:
			o_Cutsign_2.glowing = false;
			o_Cutsign_3.flickering = true;
			o_Cutsign_9.flickering = true;
			break;
		case 2:
			o_Cutsign_1.visible = false;
			o_Cutsign_3.glowing = false;
			o_Cutsign_9.glowing = false;
			o_Cutsign_4.flickering = true;
			break;
		case 3:
			o_Cutsign_2.visible = false;
			o_Cutsign_4.glowing = false;
			o_Cutsign_5.flickering = true;
			break;
		case 4:
			o_Cutsign_3.visible = false;
			o_Cutsign_9.visible = false;
			o_Cutsign_5.glowing = false;
			o_Cutsign_6.flickering = true;
			o_Cutsign_7.flickering = true;
			break;
		case 5:
			o_Cutsign_4.visible = false;
			o_Cutsign_6.glowing = false;
			o_Cutsign_7.glowing = false;
			o_Cutsign_8.flickering = true;
			break;
		case 6:
			o_Cutsign_5.visible = false;
			o_Cutsign_8.glowing = false;
			var instance = instance_create_layer(0, 0, "Text", o_Fade_Out);
			instance.target_room = r_Dialogue_1;
			break;
	}
	return;
}

function shop_1(_i) {
	switch (_i) {
		case 0:
			o_Main.level = "tutorial 1";
			break;
		case 1:
			o_Main.level = "tutorial 2";
			break;
		case 2:
			o_Main.level = "tutorial 3";
			break;
		case 3:
			o_Main.level = "tutorial 4";
			break;
		case 4:
			o_Main.level = "tutorial 5";
			break;
		case 5:
			o_Main.level = "tutorial 6";
			room_goto(r_Pump);
			return;
		case 6:
			o_Main.level = "cutscene 1";
			var instance = instance_create_layer(0, 0, "Text", o_Fade_Out);
			instance.target_room = r_Dialogue_1;
			return;
		case 7:
			o_Main.level = "level 1";
			var instance = instance_create_layer(0, 0, "Text", o_Fade_Out);
			instance.target_room = r_Dialogue_2;
			return;			
	}
	room_goto(r_Tutorial_Workshop);
}

function shop_2() {
	var instance = instance_create_layer(0, 0, "Text", o_Fade_Out);
	instance.target_room = r_Workshop;
	return;	
}

function shop_3() {
	var instance = instance_create_layer(0, 0, "Text", o_Fade_Out);
	o_Main.level = "level 5";
	instance.target_room = r_Dialogue_2;
	return;	
}

function shop_4() {
	var instance = instance_create_layer(0, 0, "Text", o_Fade_Out);
	instance.target_room = r_Pump;
	return;	
}