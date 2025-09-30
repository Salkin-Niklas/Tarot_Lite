extends Area2D
class_name Card

var cooldown: float = 0
@onready var timer: Timer = Timer.new()

var dragging: bool = false
@onready var cardboard: Control = $"../..".cardboard
var anker: Anker
var snap_range: float = 30.0

enum Types{
	ACTIVE,
	PASSIVE,
	UPGRADE,
	DEFAULT
}
var type: Types = Types.DEFAULT

var sprite: Sprite2D

func _init(ank: Anker, placeholder: bool = false) -> void:
	self.anker = ank
	self.anker.attached_card = self
	self.global_position = self.anker.global_position
	
	if not placeholder:
		var col: CollisionShape2D = CollisionShape2D.new()
		col.shape = preload("res://assets/card_col.tres")
		add_child(col)
		
		sprite = Sprite2D.new()
		add_child(sprite)
	else:
		input_pickable = false

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if dragging:
		self.global_position = get_global_mouse_position()

func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if type==Types.DEFAULT:
		return
	if not timer.is_stopped():
		#locked? oder soll man um cds herum micron können?
		#man kann eh eine active karte drauflegen und so switchen oder das auch dann verbieten?
		return
	if event is InputEventMouseButton:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			dragging = true
		else:
			dragging = false
			snap_to_anker()

func snap_to_anker() -> void:
	match type:
		Types.ACTIVE:
			var nearest_anker: Anker = anker
			var nearest_dst: float = (self.global_position - anker.global_position).length()
			for a: Anker in cardboard.slots_active:
				var dst: float = (self.global_position - a.global_position).length()
				if dst<snap_range and dst<nearest_dst:
					nearest_anker = a
					nearest_dst = dst
			if not anker == nearest_anker:
				anker.attached_card = nearest_anker.attached_card
				nearest_anker.attached_card.global_position = anker.global_position
				nearest_anker.attached_card = self
				anker = nearest_anker
			self.global_position = anker.global_position
		
		Types.PASSIVE:
			pass
		
		Types.UPGRADE:
			pass
		
		Types.DEFAULT:
			pass

func activate(_world: Node2D) -> void:
	return

func check_passive_activasion(_world: Node2D) -> void:
	return

func equip(_world: Node2D) -> void:
	return

func unequip(_world: Node2D) -> void:
	return
