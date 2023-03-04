extends Node

onready var nameEntry = $TextEdit
onready var PlayButton = $PlayButton

var playerName

func _ready():
	nameEntry.connect('text_changed', self, '_store_current_entry')
	PlayButton.connect('pressed', self, '_save_and_play')

func _store_current_entry():
	playerName = nameEntry.text # NOTE: no parameters needed from connect(), access node directly 

func _save_and_play():
	var profile_id = 'profile_' + str(Globals.active_profile_edit)
	SaveGameInterface.game_data[profile_id] = {
		'playerName' : playerName,
		'highestLevelReached': 1
	}
	SaveGameInterface.save_data()
	var error_code := get_tree().change_scene("res://scenes/screens/LevelOne.tscn")
	if error_code:
		print_debug(error_code)
