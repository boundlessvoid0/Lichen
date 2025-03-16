extends ColorRect

# BROKEN
var _darkness_level : float;
var _blur_level : float;
var _dead: bool;

func UpdateDarknessLevel(darkness_level) -> void:
		material.set_shader_parameter("darkness_level", darkness_level);

func UpdateBlur(blur_level) -> void:
		material.set_shader_parameter("blur_amount", blur_level);

func SwitchShader(shader : String) -> void:
	material.shader = load(shader);

func death(delta : float) -> void:
	SwitchShader("res://Game/Shaders/death_darken_screen.gdshader");
	_darkness_level += delta * 2;
	_blur_level += delta * 3;
	UpdateBlur(_blur_level);
	UpdateDarknessLevel(_darkness_level);

func _process(delta: float) -> void:
	if _dead:
		death(delta);
