extends Node

onready var HUD = $LevelHUD

var ballScene = preload("res://scenes/util/Ball.tscn")
var canLaunchBall = true

func _react_ball_lost():
	HUD.reset_lives_indicator()
	canLaunchBall = true

func _create_ball_instance():
	var newBall = ballScene.instance()
	add_child(newBall)
	newBall.set_y_pos(200)
	newBall.set_x_pos(500)
	newBall.connect('ball_lost', self, '_react_ball_lost')

func _process(delta):
	if Input.is_action_pressed("action") and canLaunchBall:
		_create_ball_instance()
		canLaunchBall = false
