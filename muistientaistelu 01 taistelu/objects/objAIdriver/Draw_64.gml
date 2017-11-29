/// @description Insert description here
// You can write your code in this editor
if (objPerSave.debugMod) {
	draw_set_color(c_black);
	draw_rectangle(1085,12,1125, 70,false);
	draw_set_color(c_white);
	for (var j=0; j<ds_list_size(spePriority); j+=1){
		draw_text(1085, 10 + 15*j, string(ds_list_find_value(spePriority,j)));
	}
}