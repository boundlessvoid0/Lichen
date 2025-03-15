extends Node2D

var is_chopped = false
var in_area = false

func GetSequence() -> String:
	return "Stein"

func Interact() -> void:
	if is_chopped:
		return;
	$Stone_Area/Stone_Collision.disabled = true
	is_chopped = true;
