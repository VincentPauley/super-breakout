extends Area2D

# TODOs:
# [X] - need to decelerate on stops
# [ ] - acceleration needs to reset to min on direction change 
# [ ] - contain paddle in scene

const MIN_ACCELERATION := 1.0
const MAX_ACCELERATION := 20.0
const ACCELERATION_FACTOR := 0.75
const BASE_SPEED := 70

onready var SCREEN_WIDTH := get_viewport_rect().size.x
onready var ColorRect := $ColorRect

var _last_dir = ''
var _paddle_width := 0

func _ready():
	position.x = 0
	_paddle_width = ColorRect.rect_size.x

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

func _modify_x_pos(velo: float) -> void:
	var new_pos = position.x + velo * acceleration
	
	var _paddle_min = 0
	
	if new_pos < _paddle_min:
		new_pos = _paddle_min
	if new_pos > SCREEN_WIDTH - _paddle_width:
		new_pos = SCREEN_WIDTH - _paddle_width
	
	position.x = new_pos
#	clamp(position.x, 0, SCREEN_WIDTH)

func _physics_process(delta):
	var base_velo = BASE_SPEED * delta
	var requesting_left: bool = _requesting_left()
	var requesting_right: bool = _requesting_right()
	
	var _requesting_movement: bool = requesting_left || requesting_right
	
	_adjust_acceleration(_requesting_movement)

	# handle input movement
	if _requesting_movement:
		if requesting_left && !requesting_right:
			_modify_x_pos(-1 * base_velo)
			_last_dir = 'left' # TODO: use dir as 1 || -1 to signify the change
		if requesting_right && !requesting_left:
			_modify_x_pos(base_velo)
			_last_dir = 'right'

	# handle deceleration after input
	if !_requesting_movement && acceleration > MIN_ACCELERATION:
		if _last_dir == 'right':
			_modify_x_pos(base_velo)
		if _last_dir == 'left':
			_modify_x_pos(-1 * base_velo)
