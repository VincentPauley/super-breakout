extends KinematicBody2D

const MIN_ACCELERATION := 1.0
const MAX_ACCELERATION := 20.0
const ACCELERATION_FACTOR := 0.75

func _ready():
	position.x = 0

func _requesting_left() -> bool:
	return Input.is_action_pressed('left')

func _requesting_right() -> bool:
	return Input.is_action_pressed('right')
	
var acceleration := MIN_ACCELERATION

func _adjust_acceleration(motion: bool) -> void:
	if motion and acceleration < MAX_ACCELERATION:
		acceleration = acceleration + ACCELERATION_FACTOR
	if !motion and acceleration > MIN_ACCELERATION:
		acceleration = acceleration - ACCELERATION_FACTOR * 2 # decelerate twice as fast
	
	clamp(acceleration, MIN_ACCELERATION, MAX_ACCELERATION)

func _physics_process(delta):
	var requesting_left = _requesting_left()
	var requesting_right = _requesting_right()
	
	_adjust_acceleration(requesting_left || requesting_right)

	if requesting_left:
		position.x -= 50 * delta * acceleration
	if requesting_right:
		position.x += 50 * delta * acceleration

