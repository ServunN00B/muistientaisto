/// @description 

//scrSpecialCards(self.value);


//Dealing new card from deck
scrDealinSpecialCards(1, self.id);
var vuorossa;
if (objPerSave.isTurn = 1) {vuorossa = objPerSave.dsP1SpecialCards;} else {vuorossa = objPerSave.dsP2SpecialCards}
ds_list_delete(vuorossa, ds_list_find_index(vuorossa, self.sID))
ds_list_add(vuorossa, self.sID);
instance_destroy(spCardBack);
instance_destroy(self.id);