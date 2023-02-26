# TODO: deprecate

extends Area2D

var BrickScene = preload("res://scenes/util/Brick.tscn")

func _add_brick(position: Vector2, dimensions):
	var newBrick = BrickScene.instance()
	add_child(newBrick)
	newBrick.set_pos(position)
	newBrick.set_dimensions(dimensions.width, dimensions.height)
	newBrick.set_collision_boundaries(dimensions.width / 2, dimensions.height / 2)

const brickData = [
	{ 'position': Vector2(800, 50), 'dimensions': { 'width': 150, 'height': 16} },
	{ 'position': Vector2(105, 150), 'dimensions': { 'width': 150, 'height': 16} },
	{ 'position': Vector2(670, 300), 'dimensions': { 'width': 150, 'height': 16} },
	{ 'position': Vector2(370, 405), 'dimensions': { 'width': 150, 'height': 16} },
	{ 'position': Vector2(60, 200), 'dimensions': { 'width': 150, 'height': 16} }
]

#landed on: amount: 15, brick width: 64


# Called when the node enters the scene tree for the first time.
func _ready():
	print(get_viewport_rect()) # calc the directions from here if ya want
	
	for data in brickData:
		_add_brick(data.position, data.dimensions)

