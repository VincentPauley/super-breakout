extends Area2D

onready var CollisionBlock = $CollisionShape2D

func _ready():
	connect('area_entered', self, '_handle_collision')
	
func _handle_collision(ball):
	# TODO: create a signal to make the row aware of one being removed
	queue_free()
