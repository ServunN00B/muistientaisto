var a = objSpecialCardHolder.x;
var b = objSpecialCardHolder.y;
var c = 140; //Spire width
var f = 20; //padding
e = 0;
if (argument0 > 0) { e = variable_instance_get(argument1, "spot")} //
var vuorossa;
if (objPerSave.isTurn = 1) {vuorossa = objPerSave.dsP1SpecialCards; } else {vuorossa = objPerSave.dsP2SpecialCards}

switch(argument0) {
	case 0:
		for (j=0; j <3; j+=1) {
			with(instance_create_layer(a+j*(c + f),b, layer_get_id("Instances"), objSpecialCard)) {
				spot = objArenaController.j;
				value = ds_list_find_value(vuorossa,objArenaController.j);
				sprite_index = objPerSave.SpessuSpr[value];
				image_xscale = 0.3;
				image_yscale = 0.3;
			}
		}
		break;
	
	case 1:
		with(instance_create_layer(a+e*(c + f),b, layer_get_id("Instances"), objSpecialCard)) {
			spot = variable_instance_get(argument1, "spot");
			sprite_index = objPerSave.SpessuSpr[ds_list_find_value(vuorossa,3)];
			image_xscale = 0.3;
			image_yscale = 0.3;
			value = ds_list_find_value(vuorossa,3);
		}
		break;
}
	