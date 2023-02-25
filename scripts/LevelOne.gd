extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var Ball = $Ball


func _react_ball_lost():
	print('Level 1 knows the ball was lost')
# Called when the node enters the scene tree for the first time.
func _ready():
	$Ball.connect('ball_lost', self, '_react_ball_lost')


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
