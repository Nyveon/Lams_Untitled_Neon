/// @description Insert description here
// You can write your code in this editor
reset_dialogue_defaults();


if (state == 0) {
	i = 0;
	line(id, "In the post-World War II era, neon lights were an iconic part of Hong Kong's city streets.");
	myScripts[i] = [intro, i];
	i++;
	line(id, "The city hummed with the ever-present illumination of thousands of neon signs.");
	myScripts[i] = [intro, i];
	i++;
	line(id, "Signs that advertised everything from restaurants to nightclubs.");
	myScripts[i] = [intro, i];
	i++;
	line(id, "Electric reds, bright blues, and even the occasional hot pinks cast a romantic, hazy glow over the city.");
	myScripts[i] = [intro, i];
	i++;
	line(id, "But over time...");
	myScripts[i] = [intro, i];
	i++;
	line(id, "Increased regulations and the introduction of cost-efficient LED lights led to the slow decline of these iconic displays.");
	myScripts[i] = [intro, i];
	i++;
	line(id, "Now, only a handful of dedicated artisans still craft neon signs...");
	myScripts[i] = [intro, i];
	i++;
	state += 1;
} else {
	i = 0;
	line(id, "");
	myScripts[i] = [intro, 7];
}


