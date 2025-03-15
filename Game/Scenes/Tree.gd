extends Node2D

var is_chopped = false
var in_area = false

func GetSequence() -> String:
	return "Holz"

func Interact() -> void:
	if is_chopped:
		return;
	is_chopped = true;
