extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	_collision_check()

func _collision_check():
	if $Sprite_Character_Main.flip_h == false:
		$Area2D_for_Objects/Collision_Object_Left.disabled = false
		$Area2D_for_Objects/Collision_Object_Right.disabled = true
	elif $Sprite_Character_Main.flip_h == true:
		$Area2D_for_Objects/Collision_Object_Left.disabled = true
		$Area2D_for_Objects/Collision_Object_Right.disabled = false

	move_and_slide()
