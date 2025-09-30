extends CharacterBody2D

signal health_changed(val: float)
signal max_health_changed(val: float)
signal died()

var max_health: float = 100
var health: float = 0

var max_speed: float = 50

enum States{
	ALIVE,
	DEAD,
	DEFAULT
}
var state: States = States.ALIVE
const invincible := false

func _ready() -> void:
	health = max_health
	max_health_changed.emit(max_health)
	health_changed.emit(health)
	self.global_position = Vector2(0,0)
	

func _physics_process(delta: float) -> void:
	if state == States.DEAD:
		velocity = Vector2(0,0)
		return
	
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

func change_health(amount: float) -> void:
	if invincible and amount<0.0:
		return
	health += amount
	if health <= 0:
		state = States.DEAD
		health = 0
	if health > max_health:
		health = max_health
	health_changed.emit(health)
	print(health)

func change_max_health(amount: float) -> void:
	max_health += amount
	if max_health <= 0:
		state = States.DEAD
	max_health_changed.emit(max_health)
