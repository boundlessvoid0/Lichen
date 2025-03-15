extends Node2D

var state = 0;

func GetSequence() -> String:
	return "Wasser"

func Interact() -> void:
	return

func Update() -> void:
	state += 1;
	self.get_node("Lake_Area/Lake_Sprite").play(str(state));
