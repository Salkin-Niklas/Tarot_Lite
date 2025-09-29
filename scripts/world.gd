extends Node2D

@export
var size: int = 50

@onready var player: CharacterBody2D = $Player
var cardboard: Control

func _ready() -> void:
	$tiles.clear()
	var cells: Array[Vector2i] = []
	for x in range(-size, size):
		for y in range(-size, size):
			$ground.set_cell(Vector2i(x,y), 0, Vector2i(6,2))
			cells.append(Vector2i(x,y))
	$tiles.set_cells_terrain_connect(cells, 0, 1)
	
	for n in $Rooms.get_children():
		if n is Room or n is Link:
			n.build($tiles)
	
	cardboard = preload("res://scenes/card_board.tscn").instantiate()
	$GUI.add_child(cardboard)
	await get_tree().create_timer(1).timeout
	add_child(CardFool.new(cardboard.slots_active[1]))
	add_child(CardFool.new(cardboard.slots_active[2]))
	add_child(CardFool.new(cardboard.slots_active[6]))
