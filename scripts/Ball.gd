extends Area2D

onready var ColorRect = $ColorRect

const BALL_SPEED = 400

var yDirection = 1
var xDirection = 1

var screenWidth
var ballWidth



# Called when the node enters the scene tree for the first time.
func _ready():
	connect('area_entered', self, '_on_area_entered')
	screenWidth = get_viewport_rect().size.x
	ballWidth = ColorRect.rect_size.x

func _on_area_entered(area):
	yDirection = yDirection * -1

func handle_x_reflection():
	if xDirection > 0 and position.x > screenWidth - ballWidth:
		xDirection = xDirection * -1
		
	if xDirection < 0 and position.x < 0:
		xDirection = xDirection * -1
		
func _physics_process(delta):
	handle_x_reflection()
	var velocity = Vector2.ZERO
	velocity.y += yDirection
	velocity.x += xDirection

	if velocity.length() > 0:
		velocity = velocity.normalized() * BALL_SPEED

	position.y += velocity.y * delta
	position.x += velocity.x * delta
	
#func _process(delta):
#	var fps = Engine.get_frames_per_second()
	
	
