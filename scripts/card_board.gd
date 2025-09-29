extends Control
#let cards snap to its children and activate them 
var slots_active: Array[Anker] = []
var n_active: int = 9
var keys_active: Array[Key] = [KEY_KP_7, KEY_KP_8, KEY_KP_9, KEY_KP_4, KEY_KP_5, KEY_KP_6, KEY_KP_1, KEY_KP_2, KEY_KP_3]

func _ready() -> void:
	for i: int in range(0,n_active,1):
		var new_slot = Anker.new()
		new_slot.type = new_slot.Types.ACTIVE
		new_slot.custom_minimum_size = Vector2(35,45)
		$GridActive.add_child(new_slot)
		slots_active.append(new_slot)


func _process(_delta: float) -> void:
	# input for active cards
	for i: int in range(0,n_active,1):
		if Input.is_key_pressed(keys_active[i]):
			slots_active[i].attached_card.activate($"../..")
	
	# check effects of passive cards
