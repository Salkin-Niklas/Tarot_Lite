extends Area2D
class_name Card

var cooldown: float = 0
@onready var timer: Timer = $Timer

var dragging: bool = false

enum Types{
	ACTIVE,
	PASSIVE,
	UPGRADE,
	DEFAULT
}
var type: Types = Types.DEFAULT

func _process(_delta: float) -> void:
	if dragging: self.global_position = get_viewport().get_mouse_position()

func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if timer.is_stopped():
		#locked
		return
	if event is InputEventMouseButton:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			dragging = true
		else:
			dragging = false

func activate(_world: Node2D) -> void:
	return

func check_passive_activasion(_world: Node2D) -> void:
	return

func equip(_world: Node2D) -> void:
	return

func unequip(_world: Node2D) -> void:
	return
