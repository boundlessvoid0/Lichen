extends Node2D

var is_chopped = false
var in_area = false

func GetSequence() -> String:
	return "Holz"

func Interact() -> void:
	if is_chopped:
		return;
	$Tree_Area/Tree_Sprite.play("tree_chopped")
	$Tree_Area/Tree_Collision.disabled = true
	is_chopped = true;
