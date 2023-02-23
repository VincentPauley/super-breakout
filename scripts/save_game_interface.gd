extends Node

const SAVE_FILE = 'user://sb_save_file.save'

var game_data = {}
# Called when the node enters the scene tree for the first time.
func _ready():
	load_data()
	
func save_data():
	var file = File.new()
	file.open(SAVE_FILE, file.WRITE)
	file.store_var(game_data)
	file.close()

func load_data():
	var file = File.new()
	if not file.file_exists(SAVE_FILE):
		print('saving new file...')
		# initial save here
		game_data = {
			'profile_1': null,
			'profile_2': null,
			'profile_3': null,
			'profile_4': null
		}
		save_data()
	file.open(SAVE_FILE, File.READ)
	game_data = file.get_var()
	file.close()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
