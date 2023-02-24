extends Node

const height = 64 # TODO: get the REAL height here
onready var PlayerName = $PlayerName

func _ready():
	PlayerName.text = Globals.get_active_player_name()
