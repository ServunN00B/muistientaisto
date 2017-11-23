/// @description Normalcard variables
if (instance_exists(objAIdriver)) { ds_list_add(objAIdriver.cardsOnTable, id); }
clicks = 0;
found = false;
pairs = 0;
turned = false;
OrigScale = image_xscale;
scaleChange = 0.3
BigScale = OrigScale + scaleChange;
scaleStep = scaleChange / 15;
scaling = false;