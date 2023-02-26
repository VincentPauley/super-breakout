extends Area2D

var BrickScene = preload("res://scenes/util/Brick.tscn")

func _add_brick(position: Vector2, dimensions):
	var newBrick = BrickScene.instance()
	add_child(newBrick)
	newBrick.set_pos(position)
	newBrick.set_dimensions(dimensions.width, dimensions.height)
	
const brickData = [
	Vector2(5, 50),
	Vector2(5, 150),
	Vector2(5, 300)
]

# Called when the node enters the scene tree for the first time.
func _ready():
	for data in brickData:
		_add_brick(data, { 'width': 150, 'height': 6})

