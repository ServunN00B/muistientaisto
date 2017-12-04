var loppu = false;
var pPituus = string_length(argument0);
var pPaikka = string_pos(argument0,",");
var pKopio = string_copy(argument0,1,pPaikka-1);
var tulos = ds_list_create();
for (var i = 0; loppu = false; i += 1) {
	if (pPaikka = 0) {
		pPituus = string_length(argument0);
		pKopio = string_copy(argument0,1,pPituus);
		ds_list_add(tulos, real(pKopio));
		loppu = true;
	} else {
		pKopio = string_copy(argument0,1,pPaikka-1);
		ds_list_add(tulos, real(pKopio));
	}
	argument0 = string_copy(argument0,pPaikka+1,pPituus);
	pPaikka = string_pos(argument0,",");
}
return tulos;
ds_list_destroy(tulos);