extends CharacterBody2D


const SPEED = 3000.0
const JUMP_VELOCITY = -400.0
const GRAVITY = 100.0


func _physics_process(delta: float) -> void:
	if is_on_floor() != true:
		velocity.y = velocity.y+GRAVITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	var yrection := Input.get_axis("ui_up", "ui_down")
	if yrection:
		velocity.y = yrection * SPEED
	move_and_slide()
