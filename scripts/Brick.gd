extends Area2D

onready var ColorRect = $ColorRect
onready var CollisionShape2D = $CollisionShape2D

func set_pos(newPos: Vector2):
	position = newPos

func set_dimensions(width: int, height: int):
	ColorRect.rect_size.x = width
	ColorRect.rect_size.y = height

# Called when the node enters the scene tree for the first time.
func _ready():
	print('rect x: ', ColorRect.rect_size.x)
	print('rect y: ', ColorRect.rect_size.y)
#	print('collision bounds: ')
#	print(CollisionShape2D.shape.extents)
	# ok it's like the positioning and whatnot is centered.. causing the match

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
