extends Button

var fade_speed = 1.0
var fading = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if fading and modulate.a > 0:
		self.modulate.a = max(modulate.a - fade_speed * delta, 0)

func _on_pressed() -> void:
	fading = true
	self.disabled = true
