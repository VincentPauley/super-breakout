extends Node

const height = 64 # TODO: get the REAL height here
onready var PlayerName = $PlayerName
onready var LivesLeftIndicator = $LivesLeftIndicator

func reset_lives_indicator():
	LivesLeftIndicator.text = str(Globals.current_life_count)

func _ready():
	PlayerName.text = Globals.get_active_player_name()
	reset_lives_indicator()
