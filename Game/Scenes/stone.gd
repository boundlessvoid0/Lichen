extends Node2D

var state = 0;
var sound_stone = preload("res://Game/Sounds/Stein.wav")

func GetSequence() -> String:
	return "Stein"

func Interact() -> void:
	$Stone_Area/Stone_Collision.disabled = true
	$AudioStreamPlayer2D.stream = sound_stone
	$AudioStreamPlayer2D.play()

func Update() -> void:
	state += 1;
	self.get_node("Stone_Area/Stone_Sprite").play(str(state));
	$Stone_Area/Stone_Collision.disabled = false;
