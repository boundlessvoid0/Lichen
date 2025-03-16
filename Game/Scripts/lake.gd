extends Node2D

var state = 0;
var water_sound = preload("res://Game/Sounds/WasserImEimer.wav")

func GetSequence() -> String:
	return "Wasser"

func Interact() -> void:
	$AudioStreamPlayer2D.stream = water_sound
	$AudioStreamPlayer2D.play()
	return

func Update() -> void:
	state += 1;
	self.get_node("Lake_Area/Lake_Sprite").play(str(state));
