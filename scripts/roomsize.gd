@tool
class_name RoomSizeHint
extends ColorRect

func _ready() -> void:
	color = Color(0.21, 0.21, 0.21, 1.0)

func _process(_delta: float) -> void:
	if Engine.is_editor_hint():
		size = $"..".size*16
	else:
		queue_free()
