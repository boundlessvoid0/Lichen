extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_readyday1()
	

func _readyday1():
	var Line1 = Label.new()
	var Line2 = Label.new()
	Line1.set_name("Line1")
	Line2.set_name("Line2")
	get_node("VBoxContainer/Quest1").add_child(Line1)
	get_node("VBoxContainer/Quest2").add_child(Line2)
	Line1.text = "Get new Wood"
	Line2.text = "Get new Rock"
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
