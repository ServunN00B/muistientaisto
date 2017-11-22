/// @description Choosing Special card
if (drawSelect) {
	var aikaJ = string(floor(alarm_get(2)/room_speed));
	var deksti = "Pelaaja " + string(objArenaController.ChoosingPlayer) + " aikaa valita kortit " + aikaJ + "sek";
	var lisaX = string_width(deksti);
	draw_rectangle_color(objSpeCardSelectionHolder.x,objSpeCardSelectionHolder.y -20, 
						objSpeCardSelectionHolder.x + lisaX ,objSpeCardSelectionHolder.y, 
						c_black, c_black, c_black, c_black,	false);
	draw_text_color(objSpeCardSelectionHolder.x,objSpeCardSelectionHolder.y -20, 
					deksti, c_white, c_white, c_white, c_white, 1);
}