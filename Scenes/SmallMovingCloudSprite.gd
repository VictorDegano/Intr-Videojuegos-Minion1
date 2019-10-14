extends Sprite

func _ready():
	position.x = -70
	_init_tween()

func _init_tween():
	var move_to = Vector2.RIGHT
	var startPosition = Vector2(-70,0) # Posicion inicial del movimiento
	move_to = move_to * (get_viewport_rect().size.x+50)
	var duration = move_to.length() / 80

	$Tween.interpolate_property(self, "position", startPosition, move_to, duration, Tween.TRANS_LINEAR,Tween.EASE_IN_OUT, 1)
	$Tween.start()