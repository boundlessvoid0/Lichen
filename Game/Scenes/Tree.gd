extends Node2D

var is_chopped = false

func _check_chop():
	if is_chopped == true:
		$Tree_Area/Tree_Sprite.play("tree_chopped")
