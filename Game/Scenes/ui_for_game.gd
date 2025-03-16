extends Control

var HolzCount = 1
var EssenCount = 1
var SteinCount = 1
var WasserCount = 1
var Daytime = 1
var TaskCounter

var Player
@onready var Haus = get_parent().get_parent().get_node("Haus/AnimatedSprite2D")
var HausLevel = 0

var Icon1= TextureRect.new()
var Icon2= TextureRect.new()
var Icon3= TextureRect.new()
var Icon4= TextureRect.new()


var Line1= Label.new()
var Line2= Label.new()
var Line3= Label.new()
var Line4= Label.new()

func _ready() -> void:
	get_node("VBoxContainer/Quest1").add_child(Icon1)
	get_node("VBoxContainer/Quest2").add_child(Icon2)
	get_node("VBoxContainer/Quest3").add_child(Icon3)
	get_node("VBoxContainer/Quest4").add_child(Icon4)

	get_node("VBoxContainer/Quest1").add_child(Line1)
	get_node("VBoxContainer/Quest2").add_child(Line2)
	get_node("VBoxContainer/Quest3").add_child(Line3)
	get_node("VBoxContainer/Quest4").add_child(Line4)

	Line1.set_name("Line1")
	Line2.set_name("Line2")
	Line3.set_name("Line3")
	Line4.set_name("Line4")
	
	Line1.label_settings = load("res://Game/Scenes/Quest.tres")
	Line2.label_settings = load("res://Game/Scenes/Quest.tres")
	Line3.label_settings = load("res://Game/Scenes/Quest.tres")
	Line4.label_settings = load("res://Game/Scenes/Quest.tres")

	Icon1.texture = load("res://Game/Images/Icons/Loeg.png")
	Icon2.texture = load("res://Game/Images/Icons/Met.png")
	Icon3.texture = load("res://Game/Images/Icons/rogk.png")
	Icon4.texture = load("res://Game/Images/Icons/Watr.png")
	

	
	_readyday1()
	

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
		TaskCounter -= 1
	
	match TaskCounter:
		0:
			get_parent().get_node("AnimatedSprite2D").play("4")
		1:
			get_parent().get_node("AnimatedSprite2D").play("3")
		2:
			get_parent().get_node("AnimatedSprite2D").play("2")
		3:
			get_parent().get_node("AnimatedSprite2D").play("2")
		4:
			get_parent().get_node("AnimatedSprite2D").play("1")
# Called when the node enters the scene tree for the first time.


func _readyday1():
	Line1.text = str("x " + str(HolzCount))
	Line2.text = str("x " + str(EssenCount))
	Line3.text = str("x " + str(SteinCount))
	Line4.text = str("x " + str(WasserCount))
	
	TaskCounter = 4

func _readyday2():
	
	_readytexts()
	_reset_day()


func _process(delta: float) -> void:
	pass

func _readytexts():
	HolzCount = 1
	EssenCount = 1
	SteinCount = 1
	WasserCount = 1

	Line1.text = str("x " + str(HolzCount))
	Line2.text = str("x " + str(EssenCount))
	Line3.text = str("x " + str(SteinCount))
	Line4.text = str("x " + str(WasserCount))
	
func _reset_day():
	Player.HolzLock = false
	Player.EssenLock = false
	Player.SteinLock = false
	Player.WasserLock = false
	TaskCounter = 4
	get_parent().get_node("AnimatedSprite2D").play("1")
	HausLevel += 1
	Haus.play("lv"+str(HausLevel))
	
