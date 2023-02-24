extends Area2D

export var playerNumber = 0
onready var Button = $Button
onready var PlayerNameIndicator = $PlayerNameIndicator

var save_exists = false

func _ready():
	_check_for_existing_player()
	Button.connect('pressed', self, '_profile_chosen')
	print('player number is: ', playerNumber)

func _check_for_existing_player():
	var profile_data = SaveGameInterface.game_data['profile_' + str(playerNumber)]
	if profile_data:
		save_exists = true
		PlayerNameIndicator.text = profile_data.playerName
		Button.text = 'Play'

func _profile_chosen():
	Globals.active_profile = playerNumber
	if save_exists:
		get_tree().change_scene("res://scenes/screens/LevelOne.tscn")
	else:
		Globals.active_profile_edit = playerNumber
		get_tree().change_scene("res://scenes/screens/ProfileMaker.tscn")
