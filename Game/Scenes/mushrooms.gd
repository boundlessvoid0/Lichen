extends Node2D

var is_collected = false
var in_area_mushroom = false

func _process(delta):
	if in_area_mushroom == true:
		_collecting()
	_check_collected()

func _check_collected():
	if is_collected == true:
		$Area2D/AnimatedSprite2D.visible = false
		$Area2D/CollisionShape2D.disabled = true

func _collecting():
	if Input.is_key_pressed(KEY_E):
		is_collected = true
	

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent() is CharacterBody2D:
		in_area_mushroom = true

func _on_area_2d_area_exited(area: Area2D) -> void:
	in_area_mushroom = false
