extends Area2D

var BrickScene = preload("res://scenes/util/Brick.tscn")

func _add_brick(position: Vector2, dimensions):
	var newBrick = BrickScene.instance()
	add_child(newBrick)
	newBrick.set_pos(position)
	newBrick.set_dimensions(dimensions.width, dimensions.height)

const brickData = [
	{ 'position': Vector2(5, 50), 'dimensions': { 'width': 150, 'height': 16} },
	{ 'position': Vector2(5, 150), 'dimensions': { 'width': 150, 'height': 16} },
	{ 'position': Vector2(5, 300), 'dimensions': { 'width': 150, 'height': 16} }
]

# Called when the node enters the scene tree for the first time.
func _ready():
	for data in brickData:
		_add_brick(data.position, data.dimensions)

