extends Button

onready var button = $Button

func _send_home():
	get_tree().change_scene("res://scenes/screens/Home.tscn")

func _ready():
	self.connect('pressed', self, '_send_home')
