class_name Link
extends Node

@export var r1: Room
@export var r2: Room

func build(t: TileMapLayer)->void:
	var origin: Vector2i = Vector2i(r1.position/16) + r1.size/2
	var destination: Vector2i = Vector2i(r1.position/16) + r1.size/2
	var cells: Array[Vector2i] = []
	
	for x in range(abs(destination.x - origin.x)):
		cells.append(origin + Vector2i(x, 0))
	#origin = cells[cell.size()-1]
	for y in range(abs(destination.y - origin.y)):
		cells.append(origin + Vector2i(0, y))
		
	t.set_cells_terrain_connect(cells, 0, 0)
