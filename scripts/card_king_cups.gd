extends Card
class_name CardKingCups

func _init(ank: Anker) -> void:
	super(ank)
	sprite.texture = preload("res://assets/king_cups.png")
	face = Faces.KING
	color = Colors.CUPS


func _ready() -> void:
	type = Types.PASSIVE

func check_passive_activasion() -> void:
	for c: Card in cardboard.cards_activated.duplicate():
		if c.is_card([Faces.FOOL]):
			activate([false])
		elif c.is_card([Faces.KING]):
			activate([true])
	

func activate(args: Array = []) -> void:
	if args[0]:
		world.player.change_health(50)
	else:
		world.player.change_health(-30)
	cardboard.cards_activated.append(self)
