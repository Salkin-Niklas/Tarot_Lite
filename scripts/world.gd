extends Node2D

@export
var size: int = 50

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
	
