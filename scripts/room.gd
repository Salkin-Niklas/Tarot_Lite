@abstract
class_name Room
extends Node2D

var size: Vector2i

func build(t: TileMapLayer) -> void:
	var cells: Array[Vector2i] = []
	for x in range(size.x):
		for y in range(size.y):
			cells.append(Vector2i(position/16) + Vector2i(x,y))
	t.set_cells_terrain_connect(cells,0,0)
