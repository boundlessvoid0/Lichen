extends Node2D

var defaultRes = Vector2i(1920, 1080);
var res = DisplayServer.screen_get_size();


func _ready() -> void:
	var diff = Vector2(res) / Vector2(defaultRes);
	get_child(0).apply_scale(diff);
