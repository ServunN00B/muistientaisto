/// @description Insert description here
// You can write your code in this editor
instance_destroy(objBlock); 
ds_list_destroy(cardsOnMemory);
ds_list_destroy(cardsOnTable);
ds_list_destroy(speCardsOnTable);
ds_list_destroy(speValueOnTable);
ds_list_destroy(spePriority);
file_text_close(AItxt);
