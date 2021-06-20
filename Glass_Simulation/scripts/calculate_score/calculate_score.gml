// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function calculate_score(){
	
	total_distance = 0;
	counter = 0;
	max_d1 = 16
	max_d = max_d1*max_d1;

	
	
	with (o_Checker_Node) {
		other.counter += 1
		var n = instance_nearest(x, y, o_Node);
		var p = point_distance(x, y, n.x, n.y)
		//other.total_distance += min(p*p*p, other.max_d); // max distance to consider is 200 away
		other.total_distance += min(p*p, other.max_d)
		if !is_lit {
			other.total_distance += other.max_d1;
		}
	}
	
	// worst possible score is counter * 200
	
	var max_score = max_d*counter;
	var max_score_true = max_score - max_score/1.1;
	var score_precision = floor(max(0, (max_score - total_distance) - max_score/1.1));
	o_Main.score_precision = score_precision;
	o_Main.score_precision_ratio = score_precision/max_score_true;
	show_debug_message("max score:" + string(max_score_true));
}