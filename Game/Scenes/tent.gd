extends Node2D

var in_area = false

func GetSequence() -> String:
	return "Haus"

func Interact() -> void:
	print("You are trying to Sleep")
	$Area2D/CollisionShape2D.disabled = true;

func Update() -> void:
	$Area2D/CollisionShape2D.disabled = false;
