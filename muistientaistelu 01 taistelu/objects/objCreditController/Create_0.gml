/// @description Insert description here
// You can write your code in this editor
image_alpha = 0.7;
creds = ds_list_create();
teksti = file_text_open_read("credits.txt");
maxRows = 10;
	
while (!file_text_eof(teksti)){
		ds_list_add(creds, file_text_read_string(teksti));
		file_text_readln(teksti);	
}

file_text_close(teksti);
textRows = ds_list_size(creds);
totalTime = objMenuBackground.onePicTime * 2;
