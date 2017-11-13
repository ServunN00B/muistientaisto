/// @description Insert description here
// You can write your code in this editor
scrDealinSpecialCards(1, self.id);
var vuorossa;
if (objPerSave.isTurn = 1) {vuorossa = objPerSave.dsP1SpecialCards;} else {vuorossa = objPerSave.dsP2SpecialCards}
ds_list_delete(vuorossa, ds_list_find_index(vuorossa, self.value))
ds_list_add(vuorossa, self.value);
instance_destroy(self.id);