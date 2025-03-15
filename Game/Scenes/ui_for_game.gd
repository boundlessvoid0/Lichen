extends Control

var HolzCount = 2
var EssenCount = 2
var SteinCount = 2
var WasserCount = 2

func decreaseHolzCounter():
	HolzCount -= 1
func decreaseEssenCounter():
	HolzCount -= 1
func decreaseSteinCounter():
	HolzCount -= 1
func decreaseWasserCounter():
	HolzCount -= 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_readyday1()
	

func _readyday1():
	var Line1 = Label.new()
	Line1.label_settings = load("res://Game/Scenes/Quest.tres")
	var Line2 = Label.new()
	Line2.label_settings = load("res://Game/Scenes/Quest.tres")
	var Icon1 = TextureRect.new()
	var Icon2 = TextureRect.new()
	Line1.set_name("Line1")
	Line2.set_name("Line2")
	Icon1.texture = load("res://Game/Images/Icons/Loeg.png")
	Icon2.texture = load("res://Game/Images/Icons/Watr.png")
	get_node("VBoxContainer/Quest1").add_child(Icon1)
	get_node("VBoxContainer/Quest2").add_child(Icon2)
	get_node("VBoxContainer/Quest1").add_child(Line1)
	get_node("VBoxContainer/Quest2").add_child(Line2)
	Line1.text = "x 2"
	Line2.text = "x 2"
#	Icon1.custom_minimum_size = Vector2(16, 16)
#	Icon2.custom_minimum_size = Vector2(16, 16)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
