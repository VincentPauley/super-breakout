extends Area2D

onready var ColorRect = $ColorRect
onready var CollisionShape2D = $CollisionShape2D

func set_pos(newPos: Vector2):
#	print('got the call')
#	position.x = newPos.x
#	position.y = newPos.y
	position = newPos

# Called when the node enters the scene tree for the first time.
func _ready():
	print('rect bounds: ')
	print(position)
	print(ColorRect.rect_size)
	print('collision bounds: ')
	print(CollisionShape2D.shape.extents)
	# ok it's like the positioning and whatnot is centered.. causing the match

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
