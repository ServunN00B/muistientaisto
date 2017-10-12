/// @description Insert description here
// You can write your code in this editor
cardsOnTable = ds_list_create();
cardsOnMemory = ds_list_create();
instance_create_layer(60,60,layer_get_id("Instances"),objBlock);
arenaAlarm0 = 1;
normalAlarm0 = 0;
go = true;
aiCardValue = 0;
aiPair = undefined;
xMarks = -1;
j = 0;
turn = 1;
AItxt = file_text_open_append("AI.txt");
file_text_write_string(AItxt, "AI vuoro alkaa");
file_text_writeln(AItxt);