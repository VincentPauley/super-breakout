extends Node2D

onready var PlayButton = $PlayButton

func _ready():
	PlayButton.connect('pressed', self, '_to_player_select')

func _to_player_select():
	var error_code := get_tree().change_scene("res://scenes/screens/ProfileSelector.tscn")
	if error_code:
		print_debug(error_code)
