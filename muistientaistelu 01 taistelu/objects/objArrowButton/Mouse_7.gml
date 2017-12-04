/// @description Insert description here
// You can write your code in this editor
var target = instance_find(asset_get_index(targetObj),0);
var varToMod = real(variable_instance_get(target, targetVar));
show_message("Entinen arvo " + string(varToMod));

switch(moreless) {
	case "more": 
		if (varToMod < defaultMax) {
			varToMod = varToMod + 1;
		}
		
	break;
	
	case "less":
		if (varToMod > 0) {
			varToMod = varToMod - 1;
		}
		
	break;
}
show_message("Uusi arvo " + string(varToMod));
variable_instance_set(target, targetVar, varToMod);