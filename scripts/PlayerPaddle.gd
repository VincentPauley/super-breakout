extends Area2D


onready var PlayerRect = $PlayerRect

var paddleWidth

const SPEED = 400

# Called when the node enters the scene tree for the first time.
func _ready():
	paddleWidth = PlayerRect.rect_size.x

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed('left'):	
		position.x -= SPEED * delta
	if Input.is_action_pressed('right'):
		position.x += SPEED * delta
