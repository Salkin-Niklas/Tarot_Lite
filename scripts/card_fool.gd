extends Card
class_name CardFool

func _init(ank: Anker) -> void:
	super(ank)
	sprite.texture = preload("res://assets/fool_tmp.png")
	face = Faces.FOOL
	color = Colors.TRUMPF


func _ready() -> void:
	type = Types.ACTIVE
	cooldown = 10
	self.add_child(timer)
	timer.set_one_shot(true)

func activate(_args: Array = []) -> void:
	if timer.is_stopped():
		world.player.global_position = Vector2(0,0)
		timer.start(cooldown)
		cardboard.cards_activated.append(self)
		print("fooled")
