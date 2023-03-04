extends Button

onready var button = $HomeButton

func _send_home():
	var error_code := get_tree().change_scene("res://scenes/screens/Home.tscn")
	if error_code:
		print_debug(error_code)
func _ready():
	self.connect('pressed', self, '_send_home')
