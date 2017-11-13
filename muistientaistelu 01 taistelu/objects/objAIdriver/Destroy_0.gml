/// @description Insert description here
// You can write your code in this editor
instance_destroy(objBlock);
//window_set_cursor(cr_default); 
ds_list_destroy(cardsOnMemory);
ds_list_destroy(cardsOnTable);
file_text_close(AItxt);
