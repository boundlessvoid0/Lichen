extends Node2D

var state = 0;

func GetSequence() -> String:
	return "Wasser"

func Interact() -> void:
	Update();
	return

func Update() -> void:
	self.get_node("Lake_Area/Lake_Sprite").play(str(state));
