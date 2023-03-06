extends KinematicBody2D

var velocity = Vector2(-300, 1)

onready var CollisionShape = $CollisionShape2D
onready var Sprite = $Sprite
onready var ColorRect = $ColorRect

var ball_width := 0.0
var ball_height := 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	ball_width = ColorRect.get_size().x
	ball_height = ColorRect.get_size().y

func _physics_process(delta):
	var collision := move_and_collide(velocity * delta) # null when not colliding

	if collision != null:
		var collider_groups = collision.collider.get_groups()
		
		if collider_groups.has('side_walls'):
			velocity.x = velocity.x * -1
		
#		velocity.y = velocity.y * -1

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
