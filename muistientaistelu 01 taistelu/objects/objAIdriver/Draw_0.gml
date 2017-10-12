/// @description Insert description here
// You can write your code in this editor
if (ds_list_size(cardsOnMemory)>0){
	for (var i = 0; i<ds_list_size(cardsOnMemory); i += 1) {
		if (i = xMarks){ draw_text(800,120+(20*i), "X"); }
		draw_text(820,120+(20*i), string(ds_list_find_value(cardsOnMemory,i)));
	}
}