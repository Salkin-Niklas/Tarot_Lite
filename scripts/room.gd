@abstract
class_name Room
extends Node2D

var size: Vector2i

func build(t: TileMapLayer, ground: TileMapLayer) -> void:
	var cells: Array[Vector2i] = []
	for x in range(size.x):
		for y in range(size.y):
			cells.append(Vector2i(position) + Vector2i(x,y))
			ground.set_cell(Vector2i(x,y), 0, Vector2i(6,2))
	t.set_cells_terrain_connect(cells,0,0)
