extends Node

var active_profile = 0
var current_life_count = 0

var active_profile_edit = 0
var paused := false

func _use_life():
	current_life_count = current_life_count -1
	
func toggle_false() -> void:
	paused = !paused	


func get_active_player_name():
	print('Global > active_profile >: ', active_profile)
	if active_profile < 1:
		return 'Guest'
	var currentSaveData = SaveGameInterface.game_data['profile_' + str(active_profile)].playerName
	return currentSaveData

func _process(delta):
	# better for single button clicks to toggle
	if Input.is_action_just_pressed('pause'):
		toggle_false()
