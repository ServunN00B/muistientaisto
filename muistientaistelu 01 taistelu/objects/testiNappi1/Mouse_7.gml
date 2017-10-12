/// @description Insert description here
// You can write your code in this editor
var plop = "";
for (var i = 0; i<ds_list_size(cardDebug); i+=1) {
	plop = plop + string(ds_list_find_value(cardDebug, i)) + ", ";
}
debudi = file_text_open_append("debudit.txt");
file_text_write_string(debudi, plop);
file_text_writeln(debudi);
show_message(plop);
file_text_close(debudi);