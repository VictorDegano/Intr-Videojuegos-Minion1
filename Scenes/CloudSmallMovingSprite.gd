extends Sprite

func _ready():
	_init_tween()

func _init_tween():
	position.x = -70
	var move_to = Vector2(get_viewport_rect().size.x+70,position.y)
	var startPosition = Vector2(-70,position.y) # Posicion inicial del movimiento
	var duration = move_to.length() / 80

	$Tween.interpolate_property(self, "position", startPosition, move_to, duration, Tween.TRANS_LINEAR,Tween.EASE_IN, 1)
	$Tween.start()