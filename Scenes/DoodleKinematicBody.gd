extends KinematicBody2D

export(int) var GRAVITY = 300.0
export(int) var JUMP_FORCE = 350.0
export(int) var WALK_SPEED = 100.0
export(int) var FRICTION = 10.0

var velocity = Vector2()

func _process(delta):
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			velocity.y = -JUMP_FORCE
			Event.emit_signal("update_score", JUMP_FORCE, position.y)
	else:
		velocity.y += delta * GRAVITY

	if Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("ui_right"):
		velocity.x = WALK_SPEED
	else: # ¿Valdria la pena chequear si ya no es 0 x para no recalcular siempre?
		velocity.x = max(0, abs(velocity.x)-FRICTION) * sign(velocity.x)
		
	Utils.checkLimit(self,get_viewport_rect())
	
func _physics_process(delta):
	move_and_slide(velocity, Vector2.UP)

#Se llama cuando cae fuera de la camara(Aka sale de la pantalla)
func _on_screen_exited():
	print("¡GAME OVER!")
	hide()
	pause_mode = true