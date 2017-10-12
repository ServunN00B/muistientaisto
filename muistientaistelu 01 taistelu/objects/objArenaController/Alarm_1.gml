/// @description End of turn alarm

show_message("End of turn");
canTurn = false;
var debudi = file_text_open_append("debudit.txt");
var plop =  "Pelaaja " + string(objArenaController.isTurn) + ". Parien määrä " + string(objNormalCard.pairs) + " : ";
var plop2 = 0;
var vuorossa;
if (objArenaController.isTurn = 1) { vuorossa = objArenaController.p1Score } else { vuorossa = objArenaController.p2Score }

for (var i = 0; i<ds_list_size(vuorossa); i+=1) {
	plop = plop + string(ds_list_find_value(vuorossa, i)) + ", ";
	plop2 = plop2 + ds_list_find_value(vuorossa, i);
}
plop = plop + " = " + string(plop2);
file_text_write_string(debudi, plop);
file_text_writeln(debudi);
show_message(objNormalCard.pairs);
file_text_close(debudi);

//Changin turn
scrTurnChange();
