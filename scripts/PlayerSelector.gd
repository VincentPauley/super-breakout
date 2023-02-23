extends Area2D

export var playerNumber = 0
onready var Button = $Button

func _ready():
	Button.connect('pressed', self, '_profile_chosen')
	
func _profile_chosen():
	
#	SaveGameInterface.game_data

	if playerNumber == 1:
		print('it was player 1')
	# todo: continue
#	print('selected profile: ', playerNumber)
