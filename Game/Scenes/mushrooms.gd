extends Node2D

var is_collected = false
var in_area_mushroom = false

func GetSequence() -> String:
	return "Essen"

func Interact() -> void:
	if is_collected:
		return;
	$Area2D/AnimatedSprite2D.visible = false
	$Area2D/CollisionShape2D.disabled = true
	is_collected = true;
