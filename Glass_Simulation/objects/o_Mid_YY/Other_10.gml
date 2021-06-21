reset_dialogue_defaults();
/// Dialogue 1


i = 0;
if o_Main.level == "level 1" {
	line(id, "Time to get started on this sign...");
	myEmotion[i] = 0;
	myScripts[i] = [shop_2];
} else {
	line(id, "The letters are done... Time to fill them and seal them up.");
	myEmotion[i] = 0;
	i++;
	
	line(id, "We want this neon light to be |bblue|d. Neon gas actually produces a |rred light|d when |8electrified|0.");
	myEmotion[i] = 0;
	i++;
	line(id, "For |bblue|d, I am going to use a mix of argon and helium.");
	myEmotion[i] = 0;
	i++;
	line(id, "I have already put a drop of mercury in the glass tube to make the |bblue|d more vibrant.");
	myEmotion[i] = 0;
	i++;
	line(id, "When the light turns on, the mercury heats up, vaporises, and creates |8fluorescence|0.");
	myEmotion[i] = 0;
	i++;
	
	line(id, "Thanks to the helium, the lamp can heat the argon more quickly in colder climates.");
	myEmotion[i] = 2;
	i++;
	line(id, "It will stop the light from dimming when it's cold.");
	myEmotion[i] = 2;
	i++;	
}






