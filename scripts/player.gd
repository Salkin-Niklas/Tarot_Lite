extends CharacterBody2D


var max_health: float = 100
var health: float = 0

var max_speed: float = 5
var speed: Vector2 = Vector2(0,0)

func _ready() -> void:
	health = max_health
	self.global_position = Vector2(0,0)
	

func _physics_process(delta: float) -> void:
	if Input.is_key_pressed(KEY_W):
		#if !(depth <= max_depth):
		speed.y = move_toward(speed.y, max_speed, 0.05)
		
	elif Input.is_key_pressed(KEY_S):
		#if !(depth <= max_depth):
		speed.y = move_toward(speed.y, -max_speed, 0.05)
		
	if not (Input.is_key_pressed(KEY_W) or Input.is_key_pressed(KEY_S)):
		speed.y = move_toward(speed.y, 0.0, 0.05)
		# if motionless add drift
		
	if Input.is_key_pressed(KEY_A):
		speed.x = move_toward(speed.x, max_speed, 0.05)
		
	elif Input.is_key_pressed(KEY_D):
		speed.x = move_toward(speed.x, -max_speed, 0.05)
	move_and_collide(speed)
