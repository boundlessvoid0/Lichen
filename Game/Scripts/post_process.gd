extends ColorRect

var _darkness_level : float;

func UpdateDarknessLevel(darkness_level) -> void:
		material.set_shader_parameter("darkness_level", darkness_level);


func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_D):
		_darkness_level += delta;
	if Input.is_key_pressed(KEY_A):
		_darkness_level -= delta;
	UpdateDarknessLevel(_darkness_level);
