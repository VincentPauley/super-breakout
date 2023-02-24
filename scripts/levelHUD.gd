extends Node

const height = 64
onready var PlayerName = $PlayerName

func get_active_player():
	pass
#	var playerName = Globals.get_active_player_name()
#	print('HUD: ' + playerName)

# Called when the node enters the scene tree for the first time.
func _ready():
	print('level HUD ready', Globals.get_active_player_name())
	PlayerName.text = Globals.get_active_player_name()
