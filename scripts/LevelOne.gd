extends Node


onready var Ball = $Ball
onready var HUD = $LevelHUD


func _react_ball_lost():
	print('Level 1 knows the ball was lost')
	HUD.reset_lives_indicator()
# Called when the node enters the scene tree for the first time.
func _ready():
	$Ball.connect('ball_lost', self, '_react_ball_lost')


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
