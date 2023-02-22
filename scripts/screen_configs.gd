extends Node

var CONFIGS = {
	'Home': {
		'bgColor': 'f66a0c'
	},
	'ProfileSelector': {
		'bgColor': '000000'	
	},
	'ProfileMaker': {
		'bgColor': 'f89a0c'	
	},
	'Default': {
		'bgColor': 'a8a8a8'
	}
}

func get_config(sceneName):
	if CONFIGS.has(sceneName):
		return CONFIGS[sceneName]
	else:
		return CONFIGS['Default']
