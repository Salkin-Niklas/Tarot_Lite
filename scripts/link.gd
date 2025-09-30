class_name Link
extends Node

func _init(room1: Room, room2: Room) -> void:
	r1 = room1
	r2 = room2

@export var r1: Room
@export var r2: Room

func build(t: TileMapLayer)->void:
	var origin: Vector2i = Vector2i(r1.position)/16 + r1.size/2
	var destination: Vector2i = Vector2i(r2.position)/16 + r2.size/2
	var cells: Array[Vector2i] = []
	
	for x in range(abs(destination.x - origin.x)):
		cells.append(origin + Vector2i(x, 0))
		cells.append(origin + Vector2i(x, 1))
	if (cells.size() != 0): origin = cells[cells.size()-1]
	for y in range(abs(destination.y - origin.y)):
		cells.append(origin + Vector2i(0, y))
		cells.append(origin + Vector2i(1, y))
	
	t.set_cells_terrain_connect(cells, 0, 0)
