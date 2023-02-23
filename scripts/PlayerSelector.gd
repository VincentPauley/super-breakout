extends Area2D

export var playerNumber = 0
onready var Button = $Button

func _ready():
	Button.connect('pressed', self, '_profile_chosen')

func _profile_chosen():
	print('selected profile: ', playerNumber)
