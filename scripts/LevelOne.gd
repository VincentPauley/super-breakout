extends Node

onready var HUD = $LevelHUD
onready var PlayerPaddle = $PlayerPaddle


# pause related items
onready var PauseText = $PauseText
onready var PauseTextModal = $PauseTextModal
onready var PauseOverlay = $PauseOverlay

var ballScene = preload("res://scenes/util/Ball.tscn")
var canLaunchBall = true

func _react_ball_lost():
	HUD.reset_lives_indicator()
	canLaunchBall = true

func _create_ball_instance():
	var newBall = ballScene.instance()
	add_child(newBall)
#	print(PlayerPaddle.get_paddle_top())
	newBall.set_y_pos(400)
#	newBall.set_x_pos(PlayerPaddle.get_paddle_center_x())
	newBall.connect('ball_lost', self, '_react_ball_lost')

func _process(delta):
	if Globals.paused:
		PauseText.visible = true
		PauseTextModal.visible = true
		PauseOverlay.visible = true
		return
		
	if !Globals.paused && PauseText.visible: 
		PauseText.visible = false
		PauseTextModal.visible = false
		PauseOverlay.visible = false

	if Input.is_action_pressed("action") and canLaunchBall:
		_create_ball_instance()
		canLaunchBall = false
