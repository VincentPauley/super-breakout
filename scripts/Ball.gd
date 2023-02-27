extends Area2D

signal ball_lost

export var xPos := 0
export var yPos := 0

onready var ColorRect := $ColorRect

const BALL_SPEED_BASE := 350

var BALL_SPEED_X := BALL_SPEED_BASE
const BALL_SPEED_Y := BALL_SPEED_BASE

var yDirection := -1
var xDirection := 1

var screenWidth
var screenHeight
var ballWidth

# Called when the node enters the scene tree for the first time.
func _ready():
	connect('area_entered', self, '_on_area_entered')
	screenWidth = get_viewport_rect().size.x
	screenHeight = get_viewport_rect().size.y
	ballWidth = ColorRect.rect_size.x
	print(screenHeight)

func _on_area_entered(area):
	if area.name == 'PlayerPaddle':
		var xDiff = position.x - area.get_paddle_center_x()
		BALL_SPEED_X = BALL_SPEED_BASE * ((xDiff) * .02 + 1)
	yDirection = yDirection * -1

func handle_x_reflection():
	if xDirection > 0 and position.x > screenWidth - ballWidth:
		xDirection = xDirection * -1

	if xDirection < 0 and position.x < 0:
		xDirection = xDirection * -1

func _handle_ball_lost():
	if (position.y > screenHeight):
		Globals._use_life()
		emit_signal('ball_lost')
		queue_free()

func set_y_pos(y: int):
	position.y = y

func set_x_pos(x):
	position.x = x

func _physics_process(delta):
	handle_x_reflection()
	_handle_ball_lost()
	var velocity = Vector2.ZERO
	velocity.y += yDirection * BALL_SPEED_Y
	velocity.x += xDirection * BALL_SPEED_X

	position.y += velocity.y * delta
	position.x += velocity.x * delta

#func _process(delta):
#	var fps = Engine.get_frames_per_second()
	
	
