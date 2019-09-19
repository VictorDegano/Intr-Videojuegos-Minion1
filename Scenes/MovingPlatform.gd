extends KinematicBody2D

const PLATFORM_MARGIN = 63
export(int) var SPEED = 3000.0
#var startXPosition = 0
var velocity = Vector2()
var direction = Vector2.ZERO
var signDirection = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
#	startXPosition = get_viewport_rect().size.x * randf()
	# Se puede revisar si la posicion inicia en parte a alguna mitad del viewport y hacer que se mueva al otro lado

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity.x = delta * SPEED * sign(signDirection)
	
	if global_position.x < 0 +PLATFORM_MARGIN:
		global_position.x = PLATFORM_MARGIN
		direction = Vector2.RIGHT
		signDirection = 1
	if global_position.x > get_viewport_rect().size.x - PLATFORM_MARGIN:
		global_position.x = get_viewport_rect().size.x - PLATFORM_MARGIN
		direction = Vector2.LEFT
		signDirection = -1

func _physics_process(delta):
	move_and_slide(velocity, direction)
