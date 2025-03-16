extends CharacterBody2D

const SPEED = 500.0
const GRAVITY = 100.0

var sound_dead = preload("res://Game/Sounds/HamsterSterben.wav")

var TARGET_X = 0  # Adjust to world's center
var _timer = Timer.new();
var _randomNumberGenerator = RandomNumberGenerator.new();

var is_harvested = false

func Interact() -> void:
	self.get_node("Sprite_Chonk").play("dead :(");
	$Chonk_Interaction/Collision_Interaction.disabled = true
	$AudioStreamPlayer2D.stream = sound_dead
	$AudioStreamPlayer2D.play()
	is_harvested = true;

func GetSequence() -> String:
	return "Essen"

func Update() -> void:
	if is_harvested:
		get_node("Flies").visible = true;
		get_node("Flies").play("default");

func _movement(delta : float):
	velocity.x += TARGET_X * delta;
	move_and_slide()

func SetNewLocation():
	await _timer.timeout
	if _randomNumberGenerator.randi_range(-5, 4) < 0:
		TARGET_X = _randomNumberGenerator.randi_range(-40, 40);
		if is_on_wall():
			TARGET_X *= -1;

	_timer.stop();
	_timer.start(_randomNumberGenerator.randi_range(4,8));

func _ready() -> void:
	self.add_child(_timer);
	get_node("Flies").visible = false;
	_timer.start(5);

func _physics_process(delta: float) -> void:
	if is_harvested:
		return

	if is_on_floor() != true:
		velocity.y = velocity.y+GRAVITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	SetNewLocation();
	_movement(delta)
	_collision_check()

func _collision_check():

# Animationtree
	if velocity.x == 0:
		self.get_node("Sprite_Chonk").play("idle")
	else:
		self.get_node("Sprite_Chonk").play("walk")
		if velocity.x > 0:
			self.get_node("Sprite_Chonk").flip_h = true
			self.get_node("Sprite_Chonk")
		elif velocity.x < 0:
			self.get_node("Sprite_Chonk").flip_h = false
