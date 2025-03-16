extends ColorRect

var _darkness_level : float;
var _blur_level : float;
var _dead: bool;
var _reverse: bool;
var _house: bool;
var _timer = Timer.new();
var _time : float = 0;

func UpdateDarknessLevel(darkness_level) -> void:
		material.set_shader_parameter("darkness_level", darkness_level);

func House(delta : float) -> bool:
	if _darkness_level >= 1:
		return true;
	_darkness_level += delta;
	UpdateDarknessLevel(_darkness_level);
	return false;

func UpdateBlur(blur_level) -> void:
		material.set_shader_parameter("blur_amount", blur_level);

func SwitchShader(shader : String) -> void:
	material.shader = load(shader);

func Harvest(delta : float) -> void:
	if _darkness_level >= _time:
		_reverse = true;
	elif _darkness_level <= 0:
		_reverse = false;
	SwitchShader("res://Game/Shaders/darken_screen.gdshader");
	if _reverse:
		_darkness_level -= delta;
	else:
		_darkness_level += delta;
	UpdateDarknessLevel(_darkness_level);

func _ready() -> void:
	set_process(!is_processing());
	self.add_child(_timer);
	_timer.one_shot = true;

func Play(time : float, div : int) -> void:
	_timer.start(time);
	_darkness_level = 0;
	_time = time / div;
	set_process(true);
	await _timer.timeout;
	set_process(false);


func death(delta : float) -> void:
	SwitchShader("res://Game/Shaders/death_darken_screen.gdshader");
	_darkness_level += delta * 2;
	_blur_level += delta * 3;
	UpdateBlur(_blur_level);
	UpdateDarknessLevel(_darkness_level);

func _process(delta: float) -> void:
	if _dead:
		death(delta);
	else:
		Harvest(delta);
