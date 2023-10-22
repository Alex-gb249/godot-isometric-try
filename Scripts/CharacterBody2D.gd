extends CharacterBody2D

const SPEED = 100
const maxSpeed = 50

signal custom_signal

var motion = Vector2()

func carterian_to_isometric(cartesian):
	var screen_pos = Vector2()
	screen_pos.x = cartesian.x - cartesian.y
	screen_pos.y = (cartesian.x + cartesian.y) / 2
	return screen_pos

func _physics_process(_delta):
	var direction = Vector2()

	if Input.is_action_pressed("ui_right"):
		direction += Vector2(1, 0)

	elif Input.is_action_pressed("ui_left"):
		direction += Vector2(-1, 0)
		
	if Input.is_action_pressed("ui_up"):
		direction += Vector2(0, -0.5)
		
	elif Input.is_action_pressed("ui_down"):
		direction += Vector2(0, 0.5)

	motion = direction.normalized() * SPEED * _delta
	#motion = carterian_to_isometric(motion)
	move_and_collide(motion)
