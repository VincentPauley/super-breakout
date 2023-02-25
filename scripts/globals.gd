extends Node

var active_profile = 0
var active_profile_edit = 0
# Called when the node enters the scene tree for the first time.

func get_active_player_name():
	print('Global > active_profile >: ', active_profile)
	if active_profile < 1:
		return 'Guest'
	var currentSaveData = SaveGameInterface.game_data['profile_' + str(active_profile)].playerName
	return currentSaveData
