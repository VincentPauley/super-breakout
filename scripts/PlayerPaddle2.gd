extends KinematicBody2D

# TODOs:
# [X] - need to decelerate on stops
# [ ] - contain paddle in scene

const MIN_ACCELERATION := 1.0
const MAX_ACCELERATION := 20.0
const ACCELERATION_FACTOR := 0.75

var _last_dir = ''

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
	var requesting_left: bool = _requesting_left()
	var requesting_right: bool = _requesting_right()
	
	var _requesting_movement: bool = requesting_left || requesting_right
	
	_adjust_acceleration(_requesting_movement)

	# handle input movement
	if _requesting_movement:
		if requesting_left && !requesting_right:
			position.x -= 50 * delta * acceleration
			_last_dir = 'left'
		if requesting_right && !requesting_left:
			position.x += 50 * delta * acceleration
			_last_dir = 'right'

	# handle deceleration after input
	if !_requesting_movement && acceleration > MIN_ACCELERATION:
		if _last_dir == 'right':
			position.x += 50 * delta * acceleration
		if _last_dir == 'left':
			position.x -= 50 * delta * acceleration
