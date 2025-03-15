extends CharacterBody2D
signal _animation_titel_ended(node)

const SPEED = 500.0
const JUMP_VELOCITY = -400.0
const GRAVITY = 100.0

var _animation_titel_bool = false
var _locked = true
var TARGET_X = 0  # Adjust to world's center

func death():
	_locked = true;
	if get_parent().get_parent().has_node("CanvasLayer"):
		var postProcessScript = get_parent().get_parent().get_node("CanvasLayer/PostProcessing").get_script();
		postProcessScript._dead = true;

func start_animation_titel():
	_animation_titel_bool = true
	_locked = true

func _animation_titel():
	var direction = sign(TARGET_X - global_position.x)  # Moves toward target
	velocity.x = direction * SPEED

	if abs(global_position.x - TARGET_X) < 5: 
		velocity.x = 0
		_animation_titel_bool = false
		_locked = false
		if get_parent().get_parent().has_node("Camera2D"):
			get_parent().get_parent().get_node("Camera2D")._change_parent(self)

	move_and_slide()

func _movement():
	if _locked:
		return  # Prevents movement while in animation state
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	var yrection := Input.get_axis("ui_up", "ui_down")
	if yrection:
		velocity.y = yrection * SPEED
	move_and_slide()


func _physics_process(delta: float) -> void:
	if is_on_floor() != true:
		velocity.y = velocity.y+GRAVITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if _animation_titel_bool == false:
		_movement()
	else:
		_animation_titel()
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
		self.get_node("Sprite_Character_Main").play("idle")
	else:
		self.get_node("Sprite_Character_Main").play("walk")
		if velocity.x > 0:
			self.get_node("Sprite_Character_Main").flip_h = true
			self.get_node("Sprite_Character_Main")
			$Area2D_for_Objects/Collision_Object_Left.disabled = true
			$Area2D_for_Objects/Collision_Object_Right.disabled = false
		elif velocity.x < 0:
			self.get_node("Sprite_Character_Main").flip_h = false
			$Area2D_for_Objects/Collision_Object_Left.disabled = false
			$Area2D_for_Objects/Collision_Object_Right.disabled = true


func _animation_titel_has_ended(node_self):
	emit_signal("_animation_titel_ended", node_self)
