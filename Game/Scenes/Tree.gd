extends Node2D

var is_chopped = false
var in_area = false
var tree_chopping = preload("res://Game/Sounds/Holz.wav")

func GetSequence() -> String:
	return "Holz"

func Interact() -> void:
	if is_chopped:
		return;
	get_node("AudioStreamPlayer2D").stream = tree_chopping
	$AudioStreamPlayer2D.play()
	$Tree_Area/Tree_Sprite.play("tree_chopped")
	$Tree_Area/Tree_Collision.disabled = true
	is_chopped = true;
