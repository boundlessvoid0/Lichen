extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.global_position.y = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.global_position.y = 0
	get_child(0).global_position.x = self.global_position.x

func _change_parent(node_self):
	var node = self
	var new_parent = node_self
	node.get_parent().remove_child(self)
	new_parent.add_child(node)
