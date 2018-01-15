/// @description Insert description here
// You can write your code in this editor
var pituus = array_length_1d(objToDestroy);
for (var i = 0; i < pituus; i += 1) {
	instance_destroy(objToDestroy[i]);
}
instance_destroy(self.id);