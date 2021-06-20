if fullness < 100 {
	fullness = max(fullness - decay, 0);	
} else {
	fullness = 100;
}