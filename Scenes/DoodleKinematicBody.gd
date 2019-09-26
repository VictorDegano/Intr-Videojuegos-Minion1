extends KinematicBody2D

export(int) var GRAVITY = 300.0
export(int) var JUMP_FORCE = 350.0
export(int) var WALK_SPEED = 100.0
export(int) var FRICTION = 10.0

var velocity = Vector2()

func _process(delta):
	var finalWalkSpeed = WALK_SPEED
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			velocity.y = -JUMP_FORCE
			$AudioJump.play()
			Event.emit_signal("update_score", JUMP_FORCE, position.y)
		else:
			velocity.y = 0.5
	else:
		finalWalkSpeed = WALK_SPEED / 1.5
		velocity.y += delta * GRAVITY
	
	if Input.is_action_pressed("ui_left"):
		velocity.x = -finalWalkSpeed
	elif Input.is_action_pressed("ui_right"):
		velocity.x = finalWalkSpeed
	else: # ¿Valdria la pena chequear si ya no es 0 x para no recalcular siempre?
		velocity.x = max(0, abs(velocity.x)-FRICTION) * sign(velocity.x)

	Utils.checkLimit(self,get_viewport_rect())

func _physics_process(delta):
	move_and_slide(velocity, Vector2.UP)

#Se llama cuando cae fuera de la camara(Aka sale de la pantalla)
func _on_screen_exited():
	#Se puede "mergear" en un solo sonido
	$AudioFall.play()
	yield(get_tree().create_timer(0.85), "timeout")
	$AudioFallingHit.play()
	yield(get_tree().create_timer(0.30), "timeout")
	Event.emit_signal("game_over")
	hide()

func jumpBoost(boost:float):
	velocity.y = -boost
	Event.emit_signal("update_score", boost, position.y)