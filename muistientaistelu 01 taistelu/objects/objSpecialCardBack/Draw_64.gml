/// @description Insert description here
// You can write your code in this editor
if (showDes) {
	draw_sprite_ext( sprCIBg, 0, mouse_x ,mouse_y , 0.5, 0.4, 0, c_white, 1 );
	//draw_sprite(sprCIBg, 0, mouse_x + 15,mouse_y + 0);
	draw_text_ext(mouse_x + 15,mouse_y + 0, variable_instance_get(spCardFront, "sNAME"), 5, 150);
	draw_text_ext(mouse_x + 15,mouse_y + 15, variable_instance_get(spCardFront, "sTEXT"), 15, 150);
	
}