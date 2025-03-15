extends CharacterBody2D

const SPEED = 500.0
const JUMP_VELOCITY = -400.0
const GRAVITY = 100.0

var TARGET_X = 0  # Adjust to world's center
var _timer = Timer.new();
var _randomNumberGenerator = RandomNumberGenerator.new();


func Kill() -> void:
	self.get_node("Sprite_Chonk").play("dead :(");

func _movement(delta : float):
	velocity.x += TARGET_X * delta;
	move_and_slide()

func SetNewLocation():
	await _timer.timeout
	TARGET_X = _randomNumberGenerator.randi_range(-20, 20);
	if is_on_wall():
		TARGET_X *= -1;

	_timer.stop();
	_timer.start(_randomNumberGenerator.randi_range(2,5));

func _ready() -> void:
	self.add_child(_timer);
	_timer.start(5);

func _physics_process(delta: float) -> void:
	if is_on_floor() != true:
		velocity.y = velocity.y+GRAVITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	SetNewLocation();
	_movement(delta)
	_collision_check()

func _collision_check():
#	if $Sprite_Character_Main.flip_h == false:
#		$Area2D_for_Objects/Collision_Object_Left.disabled = false
#		$Area2D_for_Objects/Collision_Object_Right.disabled = true
#	elif $Sprite_Character_Main.flip_h == true:
#		$Area2D_for_Objects/Collision_Object_Left.disabled = true
#		$Area2D_for_Objects/Collision_Object_Right.disabled = false

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
