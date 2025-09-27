@tool
class_name Room
extends Node2D

@export
var size: Vector2i

func build(t: TileMapLayer) -> void:
	var cells: Array[Vector2i] = []
	for x in range(size.x):
		for y in range(size.y):
			cells.append(Vector2i(position/16) + Vector2i(x,y))
	t.set_cells_terrain_connect(cells,0,0)
	
func _process(_delta: float) -> void:
	position = Vector2i(position.x - int(position.x) % 16, position.y - int(position.y) % 16)
