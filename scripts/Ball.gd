extends Area2D

signal ball_lost

onready var ColorRect = $ColorRect

const BALL_SPEED = 400

var yDirection = 1
var xDirection = 1

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

func _on_area_entered(_area):
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

func _physics_process(delta):
	handle_x_reflection()
	_handle_ball_lost()
	var velocity = Vector2.ZERO
	velocity.y += yDirection
	velocity.x += xDirection

	if velocity.length() > 0:
		velocity = velocity.normalized() * BALL_SPEED

	position.y += velocity.y * delta
	position.x += velocity.x * delta
	
	
#func _process(delta):
#	var fps = Engine.get_frames_per_second()
	
	
