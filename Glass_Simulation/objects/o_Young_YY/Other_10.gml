reset_dialogue_defaults();
/// Dialogue 1

// Emotions for young sy:
// 0 = very happy
// 1 = happy
// 2 = neutral

// Emotions for young yy:
// 0 = neutral
// 1 = happy
i = 0;
switch (o_Main.level) {
	case "start":
		line(o_Young_SY, "|8Neon lights|0 are so |4pretty|0. Can you show me how to make one, Yeye?");
		myEmotion[i] = 1;
		i++
		line(id, "Of course. It's about time for you to learn the family business.");
		myEmotion[i] = 1;
		i++
		line(o_Young_SY, "Hooray! Thank you, Yeye. So what do we do first?");
		myEmotion[i] = 0;
		i++
		line(id, "First we need to shape the glass tube that will become the |8neon light.|0");
		myEmotion[i] = 0;
		i++
		line(id, "Try using the |2hand tool|0 to move the glass around. Drag the glass onto the template.");
		myEmotion[i] = 0;
		myScripts[i] = [shop_1, 0];
		break;
	case "tutorial 1":
		line(id, "Next, we need to |rheat up|d the glass in order to bend it into the shape we want.");
		myEmotion[i] = 1;
		i++;
		line(id, "You can use the |2hand tool|0 to |gpick up|d the torch.");
		myEmotion[i] = 1;
		i++;
		line(id, "And |gmove|d the flame onto the glass to |rheat|d a section of it.");
		myEmotion[i] = 1;
		myScripts[i] = [shop_1, 1];
		break;
	case "tutorial 2":
		line(o_Young_SY, "Wow! The glass is so cool and bendy. I can make it into any shape I want.");
		myEmotion[i] = 0;
		i++;
		line(id, "That's right, Siu-Ying. You can even use the |2rotate tool|0 to |gmove|d the glass around. Try it. ");
		myEmotion[i] = 1;
		myScripts[i] = [shop_1, 2];
		i++;
	case "tutorial 3":
		line(id, "Now, time to put what you have learned together.");
		myEmotion[i] = 0;
		i++
		line(id, "|rHeat up|d a section of the glass and try |grotating|d it to |gbend|d the glass.");
		myEmotion[i] = 0;
		myScripts[i] = [shop_1, 3];
		i++
	case "tutorial 4":
		line(id, "If you |rheat up|d a larger section of the glass, you can also use the |2\"pull tool\"|0 in order to create |bcurves|d.");
		myEmotion[i] = 0;
		i++;
		line(id, "Give it a try. When you're done, press the |2done button.|0");
		myEmotion[i] = 0;
		myScripts[i] = [shop_1, 4];
		i++;
	case "tutorial 5":
		line(id, "Now that we have created a glass tube, we move on to the next part: filling it up with neon gas.");
		myEmotion[i] = 0;
		i++
		line(id, "Neon gas gives off a |8|rred glow|d|0 when electrified. Argon gas gives off a |8|plavender glow|d|0.");
		myEmotion[i] = 0;
		i++
		line(id, "We are going to fill your sign up with neon and argon to create a |3special new color|0.");
		myEmotion[i] = 0;
		i++
		line(o_Young_SY, "Wow, a |3special new color|0? I can't wait to see it! How do I fill the tube, Yeye?");
		myEmotion[i] = 2;
		i++
		line(id, "Use the |2left mouse button|0 on the |rvalves|d to release gas into the glass tubes.");
		myEmotion[i] = 0;
		i++
		line(id, "Keep the gas levels within the |bblue markings|d on each tube.");
		myEmotion[i] = 0;
		i++
		line(id, "When both gas levels are correct, the meter on the left will fill up.");
		myEmotion[i] = 0;
		i++
		line(id, "Gas is expensive so try to fill the meter as quickly as you can!");
		myEmotion[i] = 0;
		myScripts[i] = [shop_1, 5];
		i++	
	case "tutorial 6":
		line(id, "Great job, Siu-Ying.");
		myEmotion[i] = 1;
		i++
		line(id, "You have my blood, so I am sure with more practice you will become a neon sign master like your Yeye in no time.");
		myEmotion[i] = 1;
		myScripts[i] = [shop_1, 6];
		i++	
}



