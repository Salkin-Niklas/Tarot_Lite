extends CharacterBody2D


var max_health: float = 100
var health: float = 0

var max_speed: float = 50

func _ready() -> void:
	health = max_health
	self.global_position = Vector2(0,0)
	

func _physics_process(delta: float) -> void:
	if not (Input.is_key_pressed(KEY_W) or Input.is_key_pressed(KEY_S)):
		velocity.y = move_toward(velocity.y, 0.0, delta*100)
	elif Input.is_key_pressed(KEY_W):
		velocity.y = move_toward(velocity.y, -max_speed, delta*200)
	else: #Input.is_key_pressed(KEY_S):
		velocity.y = move_toward(velocity.y, max_speed, delta*200)
	
	if not (Input.is_key_pressed(KEY_A) or Input.is_key_pressed(KEY_D)):
		velocity.x = move_toward(velocity.x, 0.0, delta*100)
	elif Input.is_key_pressed(KEY_A):
		velocity.x = move_toward(velocity.x, -max_speed, delta*200)
	else: #Input.is_key_pressed(KEY_D):
		velocity.x = move_toward(velocity.x, max_speed, delta*200)
	move_and_slide()
	#print(velocity)
