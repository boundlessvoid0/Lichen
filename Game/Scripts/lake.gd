extends Node2D

var state = 0;

func GetSequence() -> String:
	return "Wasser"

func Interact() -> void:
	$Lake_Area/Lake_Collision.disabled = true
	return

func Update() -> void:
	state += 1;
	self.get_node("Lake_Area/Lake_Sprite").play(str(state));
	$Lake_Area/Lake_Collision.disabled = false;
