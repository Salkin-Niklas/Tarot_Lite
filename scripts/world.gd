extends Node2D

@export
var size: int = 50

@onready var player: CharacterBody2D = $Game/Player
@onready var cardboard: Control = $GUI/CardBoard


func _ready() -> void:
	$Game/tiles.clear()
	var cells: Array[Vector2i] = []
	for x in range(-size, size):
		for y in range(-size, size):
			$Game/ground.set_cell(Vector2i(x,y), 0, Vector2i(6,2))
			cells.append(Vector2i(x,y))
	$Game/tiles.set_cells_terrain_connect(cells, 0, 1)
	
	for n in $Game/Rooms.get_children():
		if n is Room or n is Link:
			n.build($Game/tiles)
	
	await get_tree().create_timer(0.01).timeout # anchors are not positioned until some frames in
	$Cards.add_child(CardFool.new(cardboard.slots_active[1]))
	$Cards.add_child(CardFool.new(cardboard.slots_active[2]))
	$Cards.add_child(CardFool.new(cardboard.slots_active[6]))
	$Cards.add_child(CardKingCups.new(cardboard.slots_passive[0]))
	$Cards.add_child(CardKingCups.new(cardboard.slots_passive[1]))
