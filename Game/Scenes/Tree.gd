extends Node2D

var is_chopped = false
var in_area = false

func _process(delta):
	if in_area == true:
		_activate()
	_check_chop()

func _check_chop():
	if is_chopped == true:
		$Tree_Area/Tree_Sprite.play("tree_chopped")
		

func _activate():
	if Input.is_key_pressed(KEY_E):
		is_chopped = true
		

func _on_tree_area_area_entered(area: Area2D) -> void:
	if area.get_parent() is CharacterBody2D:
		in_area = true


func _on_tree_area_area_exited(area: Area2D) -> void:
	in_area = false # Replace with function body.
