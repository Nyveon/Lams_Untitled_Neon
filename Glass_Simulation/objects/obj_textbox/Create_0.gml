/// @description

if(instance_number(obj_textevent)>1 or instance_number(obj_textbox)>1){ instance_destroy(); exit; }

//-----------Customise (FOR USER)
interact_key		= mb_left;
up_key				= vk_up;		//for dialogue choices
down_key			= vk_down;		//for dialogue choices

scale				= 1;
x_buffer			= 10 * scale;
y_buffer			= 4 * scale;


if (room = r_Intro) {
	portrait_frame		= s_None_Pixel;
	dialogue_box		= s_Dialogue_Box_Wide;
} else {
	portrait_frame		= s_Portrait_Frame;
	dialogue_box		= s_Dialogue_Box;
}
finished_effect		= s_dialogueArrow;
emote_sprite		= s_None_Pixel;

choice_snd_effect	= snd_moveselect;
select_snd_effect	= snd_select;

default_col			= c_white;
choice_col			= c_yellow;
select_col			= c_orange;


priority_snd_effect = 5;
open_mouth_frame	= 1;	//You only need to change this if you are using animated sprites
							//Set this to equal the frame where the mouth is OPEN for talking sprites

//-----------Setup (LEAVE THIS STUFF)
#region
portrait_talk	= -1;
portrait_talk_n = -1;
portrait_talk_s = -1;
portrait_talk_c = 0;

portrait_idle	= -1;
portrait_idle_n = -1;
portrait_idle_s = -1;
portrait_idle_c = 0;

emotes			= -1;
speaker			= noone;

boxHeight		= sprite_get_height(dialogue_box) * scale;
boxWidth		= sprite_get_width(dialogue_box) * scale;
gui_width		= room_width;
gui_height		= room_height;
gb_diff			= gui_width - boxWidth;
portraitWidth	= sprite_get_width(portrait_frame) * scale;
finishede_num	= sprite_get_number(finished_effect);
finishede_spd	= (sprite_get_speed(spr_dialoguefinished)/room_speed);

pos_x			= (gb_diff/2)+(portraitWidth/2);
pos_y			= gui_height-boxHeight-16;


finishede_x		= pos_x + boxWidth - x_buffer;
finishede_y		= pos_y + boxHeight - y_buffer;



letter			= 0;
charCount		= 0;
charCount_f		= 0;
text_speed		= 0;
text_speed_c	= 0;
audio_c			= 0;
page			= 0;
str_len			= -1;
pause			= false;
chosen			= false;
choice			= 0;

creator			= noone;
type			= 0;
text			= -1;
text_NE			= -1;
breakpoints		= -1;
nextline		= 0;
text_col		= c_white;
emotion			= 0;

portrait		= 1;
voice			= 1;
font			= 1;

charSize		= 1;
stringHeight	= 1;

//---------------------Effect variables

t			= 0;
amplitude	= 4;
freq		= 2;
ec			= 0;	//effect c

#endregion