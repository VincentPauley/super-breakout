extends Area2D

onready var PlayerRect = $PlayerRect

var paddleWidth
var screenWidth

const SPEED = 400

func get_paddle_center_x():
	return position.x + (paddleWidth / 2)

# this no worky yet - I think positioning is off from paddle
#func get_paddle_top():
#	return PlayerRect.position.y

# Called when the node enters the scene tree for the first time.
func _ready():
	paddleWidth = PlayerRect.rect_size.x
	screenWidth = get_viewport_rect().size.x
	position.x = (screenWidth / 2) - (paddleWidth / 2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed('left'):	
		velocity.x -= 1
	if Input.is_action_pressed('right'):
		velocity.x += 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED

	position.x += velocity.x * delta
	position.x = clamp(position.x, 0, screenWidth - paddleWidth)
	
