/// @description Insert description here
// You can write your code in this editor
if (ds_list_size(cardsOnMemory)>0){
	for (var i = 0; i<ds_list_size(cardsOnMemory); i += 1) {
		if (i = xMarks){ draw_text(985,30+(20*i), "X"); }
		draw_text(990,30+(20*i), string(ds_list_find_value(cardsOnMemory,i)));
	}
}

if (ds_list_size(cardsOnTable)>0){
	for (var j = 0; j<ds_list_size(cardsOnTable); j += 1) {
		draw_text(30,30+(20*j), string(ds_list_find_value(cardsOnTable,j)));
	}
}