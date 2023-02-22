extends Node

onready var button = $Button

export var SceneName = 'EMPTY'
export var SceneLocation = 'EMPTY' # TODO: actual error page

# Called when the node enters the scene tree for the first time.
func _ready():
	button.text = SceneName
	button.connect('pressed', self, 'handle_scene_change')
	
func handle_scene_change():
	get_tree().change_scene(SceneLocation)

