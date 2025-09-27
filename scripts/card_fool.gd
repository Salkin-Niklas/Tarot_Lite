extends Card

func _ready() -> void:
	type = Types.ACTIVE
	cooldown = 10
	timer.set_one_shot(true)

func activate(world: Node2D) -> void:
	if timer.is_stopped():
		world.player.global_position = Vector2(0,0)
		$Timer.start(cooldown)
