extends Area2D

onready var ColorRect = $ColorRect
onready var CollisionShape2D = $CollisionShape2D

func set_pos(newPos: Vector2):
	position = newPos

func set_dimensions(width: int, height: int):
	print('rect width: ', width)
	ColorRect.rect_size.x = width
	ColorRect.rect_size.y = height
	
#	ColorRect.rect_size.x
#	CollisionShape2D.position.x = position.x - width

func set_collision_boundaries(width, height):
	
#	print('collision stuff')
#	print(CollisionShape2D.shape.extents.x)
#	print(CollisionShape2D.shape.extents.y)
	CollisionShape2D.shape.extents.x = width
	CollisionShape2D.shape.extents.y = height
#	
	# don't fully understand yet but this is working for the moment
	CollisionShape2D.position.x = CollisionShape2D.position.x - (ColorRect.rect_size.x / 2 + 10)
	
	# the further right it goes the farther off it is...
	
#	print('collision extents x:')
#	print(CollisionShape2D.shape.extents.x)
#	CollisionShape2D.position = position

# Called when the node enters the scene tree for the first time.
#func _ready():
#	print('rect x: ', ColorRect.rect_size.x)
#	print('rect y: ', ColorRect.rect_size.y)
#	print('collision bounds: ')
#	
	# ok it's like the positioning and whatnot is centered.. causing the match

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
