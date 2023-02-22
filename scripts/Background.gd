extends Area2D

onready var ColorRect = $ColorRect

func _set_background_color(color: String):
	ColorRect.color = color

# once loaded into a scene this sets the background color to whatever the scene has configured
func _ready():
	var sceneName = get_tree().get_current_scene().get_name()
	var screen_config = ScreenConfigs.get_config(sceneName)
	_set_background_color(screen_config.bgColor)
