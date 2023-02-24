extends Area2D

export var playerNumber = 0
onready var Button = $Button

func _ready():
	Button.connect('pressed', self, '_profile_chosen')

func _profile_chosen():
	Globals.active_profile_edit = playerNumber
	get_tree().change_scene("res://scenes/screens/ProfileMaker.tscn")
