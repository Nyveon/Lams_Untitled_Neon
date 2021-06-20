
//-----------Customise (FOR USER)
playerobject = o_Player;
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


line = function(_speaker, _text) {
	myText[i] = _text;
	myTextCol[i] = [1, _speaker.myColour];
	mySpeaker[i] = _speaker;
}