/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_black);
draw_rectangle(15,12,40,140,false);
draw_set_color(c_white);
for (var j=0; j<ds_list_size(dsP1SpecialCards); j+=1){
draw_text(15, 10 + (12*j), string(ds_list_find_value(dsP1SpecialCards,j)));
}
draw_text(15, 110, string(objPerSave.p1SpecialEffect));
draw_text(15, 120, string(objPerSave.p1LastingSpecialEffect));

draw_set_color(c_black);
draw_rectangle(1010,12,1035,140,false);
draw_set_color(c_white);
for (var j=0; j<ds_list_size(dsP2SpecialCards); j+=1){
draw_text(1010, 10 + (12*j), string(ds_list_find_value(dsP2SpecialCards,j)));
}
draw_text(1010, 110, string(objPerSave.p2SpecialEffect));
draw_text(1010, 120, string(objPerSave.p2LastingSpecialEffect));
