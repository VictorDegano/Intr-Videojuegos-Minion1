extends KinematicBody2D

const PLATFORM_MARGIN = 63
export(int) var SPEED = 3000.0
var velocity = Vector2()
var direction = Vector2.ZERO
var signDirection = 1

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

func _on_screen_exited():
	print("FREE")
	$CollisionPolygon2D.disabled = true
	queue_free()
	hide()
