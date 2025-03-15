extends ColorRect

var _darkness_level : float;
var _blur_level : float;
var death: bool;

func UpdateDarknessLevel(darkness_level) -> void:
		material.set_shader_parameter("darkness_level", darkness_level);

func UpdateBlur(blur_level) -> void:
		material.set_shader_parameter("blur_amount", blur_level);

func SwitchShader(shader : String) -> void:
	material.shader = load(shader);

func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_D):
		_darkness_level += delta;
	if Input.is_key_pressed(KEY_A):
		_darkness_level += delta;
	if Input.is_key_pressed(KEY_S):
		SwitchShader("res://Game/Shaders/death_darken_screen.gdshader");
	if Input.is_key_pressed(KEY_W):
		SwitchShader("res://Game/Shaders/darken_screen.gdshader");
	if Input.is_key_pressed(KEY_K):
		death = true;
	if death:
		SwitchShader("res://Game/Shaders/death_darken_screen.gdshader");
		_darkness_level += delta * 2;
		_blur_level += delta * 3;
		UpdateBlur(_blur_level);
	UpdateDarknessLevel(_darkness_level);
