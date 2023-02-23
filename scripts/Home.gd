extends Node2D

onready var PlayButton = $PlayButton

func _ready():
	PlayButton.connect('pressed', self, '_to_player_select')

func _to_player_select():
	get_tree().change_scene("res://scenes/screens/ProfileSelector.tscn")

