extends CharacterBody2D
signal _animation_titel_ended(node)

signal _death_pressed()

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

const SPEED = 500.0
const JUMP_VELOCITY = -400.0
const GRAVITY = 100.0

var _animation_titel_bool = false
var _locked = true
var TARGET_X = 1500  # Adjust to world's center
var _interactables = Array();
var Camera
var _timer = Timer.new();
@onready var SelectionTimer = get_node("Selection Timer")

var HolzLock = false
var EssenLock = false
var SteinLock = false
var WasserLock = false
var HouseLock = false


var random_number 

var pp = null;

var continuegame

func death():
	_locked = true;
	if get_parent().get_parent().has_node("CanvasLayer"):
		var postProcessScript = get_parent().get_parent().get_node("CanvasLayer/PostProcessing").get_script();
		postProcessScript._dead = true;

func _ready():
	$Icons_Character.visible = false
	$Icons_Character2.visible = false
	Camera = get_parent().get_parent().get_node("Camera2D")
	Camera.get_node("UI for game").Player = self
	self.add_child(_timer);
	pp = self.get_parent().get_parent().get_node("CanvasLayer/PostProcessing");
	pp.set_process(false);
	_timer.one_shot = true;
	

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
			Camera.position.x = 0
			Camera.get_node("UI for game/VBoxContainer").visible = true

	move_and_slide()

func _movement():
	if _locked:
		return  # Prevents movement while in animation state
	var direction
	if Input.is_action_pressed("ui_left") or Input.is_key_pressed(KEY_A):
		direction = -1
	elif Input.is_action_pressed("ui_right") or Input.is_key_pressed(KEY_D):
		direction = 1
	if direction:
		velocity.x = direction * SPEED
		if $Timer.time_left <= 0:
			random_number = int(randf_range(0, 2))
			if random_number == 0:
				$AudioStreamPlayer2D.set_stream(preload("res://Game/Sounds/Walk1.wav"))
				$AudioStreamPlayer2D.play()
				$Timer.start(0.5)
			if random_number == 1:
				$AudioStreamPlayer2D.set_stream(preload("res://Game/Sounds/Walk2.wav"))
				$AudioStreamPlayer2D.play()
				$Timer.start(0.5)
			if random_number == 2:
				$AudioStreamPlayer2D.set_stream(preload("res://Game/Sounds/Walk3.wav"))
				$AudioStreamPlayer2D.play()
				$Timer.start(0.5)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
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


func _on_area_2d_for_objects_area_entered(area: Area2D) -> void:
	if _locked == true:
		return
	_interactables.push_back(area.get_parent());


func _on_area_2d_for_objects_area_exited(area: Area2D) -> void:
	$Icons_Character.visible = false
	$Icons_Character2.visible = false
	_interactables.erase(area.get_parent());

func _deathornot(_interactable):
	pp.Play(2, 1);
	_timer.start(2);
	await _timer.timeout
	_interactable.Interact();
	Camera.get_node("UI for game")._nextday()

func _process(delta : float) -> void:
	if _interactables.size() > 0:
		var _interactable = _interactables.get(_interactables.size() - 1);
		var sequence = _interactable.GetSequence();
		if sequence == "Haus" and !(HolzLock && EssenLock && WasserLock && SteinLock) == false:
			if Input.is_key_pressed(KEY_E):
				_interactable.Interact();
				Camera.get_node("UI for game")._nextday()
				Camera.get_node("UI for game/Sleep menu").visible = true
				Camera.get_node("UI for game/Sleep menu/Continue Game").disabled = false
				Camera.get_node("UI for game/Sleep menu/End Game").disabled = false
				
				await _death_pressed
		
				Camera.get_node("UI for game/Sleep menu").visible = false
				Camera.get_node("UI for game/Sleep menu/Continue Game").disabled = true
				Camera.get_node("UI for game/Sleep menu/End Game").disabled = true
				if continuegame == false:
					Camera.get_node("Blackscreen").visible = true
					Camera.get_node("Blackscreen/Label").text = str("U saved Nature")
			
			if sequence != "":
				print(sequence)
				$Icons_Character2/Icons_Area/AnimatedSprite2D.play(sequence)
				$Icons_Character.visible = true
				$Icons_Character2.visible = true
				
				
		elif get(sequence+"Lock") == false:
			if sequence != "":
				print(sequence)
				$Icons_Character2/Icons_Area/AnimatedSprite2D.play(sequence)
				$Icons_Character.visible = true
				$Icons_Character2.visible = true
			if Input.is_key_pressed(KEY_E):
				pp.Play(4, 2);
				_timer.start(2);
				await _timer.timeout;
				_interactable.Interact();
				if Camera.get_node("UI for game").call("decrease"+sequence+"Counter") <= 0:
					set(sequence+"Lock", true)
				_interactable = null;


func _on_selection_timer_timeout() -> void:
	pass # Replace with function body.


func _on_continue_game_pressed() -> void:
	continuegame = true
	emit_signal("_death_pressed")


func _on_end_game_pressed() -> void:
	continuegame = false
	emit_signal("_death_pressed")
