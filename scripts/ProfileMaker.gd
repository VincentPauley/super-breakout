extends Node

onready var nameEntry = $TextEdit

func _ready():
	nameEntry.connect('text_changed', self, '_store_current_entry')

func _store_current_entry():
	print(nameEntry.text) # NOTE: no parameters needed from connect(), access node directly 
