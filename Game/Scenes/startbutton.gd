extends Button

var fade_speed = 1.0
var fading = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if fading:
		self.modulate.a = max(modulate.a - fade_speed * delta, 0)

func _on_pressed() -> void:
	fading = true
	get_parent().get_parent().get_node("Player/Character_Main").start_animation_titel()
