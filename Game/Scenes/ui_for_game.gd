extends Control

var HolzCount = 1
var EssenCount = 2
var SteinCount = 2
var WasserCount = 2

var Line1
var Line2
var Line3
var Line4

func decreaseHolzCounter():
	HolzCount -= 1
	update_menu(1, HolzCount)
func decreaseEssenCounter():
	EssenCount -= 1
	update_menu(2, EssenCount)
func decreaseSteinCounter():
	SteinCount -= 1
	update_menu(3, SteinCount)
func decreaseWasserCounter():
	WasserCount -= 1
	update_menu(4, WasserCount)

func update_menu(Line, Counter):
	if Counter != 0:
		get("Line"+str(Line)).text = str("x "+str(Counter))
	else:
		get("Line"+str(Line)).text = str("Done")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_readyday1()
	

func _readyday1():
	Line1 = Label.new()
	Line1.label_settings = load("res://Game/Scenes/Quest.tres")
	Line2 = Label.new()
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
