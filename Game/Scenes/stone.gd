extends Node2D

var state = 0;

func GetSequence() -> String:
	return "Stein"

func Interact() -> void:
	$Stone_Area/Stone_Collision.disabled = true

func Update() -> void:
	self.get_node("Lake_Area/Stone_Sprite").play(str(state));
	$Stone_Area/Stone_Collision.disabled = false;
