extends Area2D

onready var CollisionShape = $CollisionShape2D

var yDirection = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	connect('area_entered', self, '_on_area_entered')

func _on_area_entered(area):
	yDirection = yDirection * -1
#	print('area entered in ball', area)

func _process(delta):
	position.y += 150 * delta * yDirection
