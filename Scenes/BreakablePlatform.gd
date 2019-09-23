extends KinematicBody2D

func _on_Area2D_body_entered(body):
	
	#Se compara las posiciones del cuerpo que colisiona y de 
	#la plataforma para ademas de saber si esta en el piso saber 
	#que esta sobre esta plataforma
	print(body.is_on_floor())
	if body.is_on_floor() && body.position.y < global_position.y:
		$AudioBreaking.play()
		yield(get_tree().create_timer(0.05), "timeout")
		hide()
		$CollisionPolygon2D.disabled = true
		yield(get_tree().create_timer(1.53), "timeout") # Para esperar que termine el sonido
		queue_free()

func _on_screen_exited():
	print("FREE")
	$CollisionPolygon2D.disabled = true
	queue_free()
