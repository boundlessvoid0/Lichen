extends Node2D

var state = 0;
var water_sound = preload("res://Game/Sounds/WasserImEimer.wav")

func _ready():
	$Crickets_Sound.play()

func GetSequence() -> String:
	return "Wasser"

func Interact() -> void:
	$AudioStreamPlayer2D.stream = water_sound
	$AudioStreamPlayer2D.play()

	$Lake_Area/Lake_Collision.disabled = true

	return

func Update() -> void:
	state += 1;
	self.get_node("Lake_Area/Lake_Sprite").play(str(state));
	$Lake_Area/Lake_Collision.disabled = false;


func _on_crickets_sound_finished() -> void:
	if state < 3:
		$Crickets_Sound.play()
	else:
		$Crickets_Sound.stop()
