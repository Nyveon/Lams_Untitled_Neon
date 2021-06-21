reset_dialogue_defaults();
/// Dialogue 1

// SY portrait
// 0 Sad
// 1 Angry
// 2 Neutral
// 3 Very happy
// 4 Happy

// YY portrait
// 0 neutral
// 1 angry
// 2 happy

i = 0;
line(id, "Siu-Ying, come see Yeye finish this sign.");
myEmotion[i] = 2;
i++;
line(id, "The argon gas is invisible now but it will be a nice |plavender|d when it is |8electrified|0.");
myEmotion[i] = 2;
i++;
line(id, "Signs used to be mostly |rred|d and |ggreen|d, but customers like new designs nowadays.");
myEmotion[i] = 2;
i++;

line(o_SY, "Yeye, I know all this. I told you, I don't want to make signs for the rest of my life.");
myEmotion[i] = 2;
i++;
line(o_SY, "I'm not a kid anymore. I have my own life, my own dreams.");
myEmotion[i] = 2;
i++;

line(id, "Yes, I know you're not a kid anymore. That's exactly why you must work now, so you can raise a family.");
myEmotion[i] = 0;
i++;
line(id, "You can't play games all day anymore, Siu-Ying.");
myEmotion[i] = 0;
i++;

line(o_SY, "I'm not just going to play games all day, Yeye. I already told you, I'm going to start my own board game cafe.");
myEmotion[i] = 0;
i++;
line(o_SY, "It's a |bbusiness|d. I already have a plan, a loan, suppliers, and staff. Once I find a space to lease, I'm moving out.");
myEmotion[i] = 0;
i++;

line(id, "You think games are a business? Come on, at least get a |1real job|0.");
myEmotion[i] = 0;
i++;

line(o_SY, "At least people buy board games. Who buys neon lights anymore? It's 2014!");
myEmotion[i] = 1;
i++;
line(o_SY, "Everyone is using LED lights now. The whole world is moving forward, but you're still stuck in the past.");
myEmotion[i] = 1;
i++;

line(id, "So this is how you turn out..");
myEmotion[i] = 0;
i++;
line(id, "I always hoped you would be different, but you're just like your father. A deep disappointment.");
myEmotion[i] = 0;
i++;

line(o_SY, "Neon is dead... |1I wish you were too.|0");
myEmotion[i] = 1;
i++;

line(id, "|1Get. out. of. my. shop!|0");
myEmotion[i] = 1;
myScripts[i] = [shop_3]; 
i++;






