extends KinematicBody2D

func _on_Area2D_body_entered(body):
	if body.is_on_floor():
		$AudioBreaking.play()
		yield(get_tree().create_timer(0.05), "timeout")
		hide()
		yield(get_tree().create_timer(1.53), "timeout")
		queue_free()

func _on_screen_exited():
	print("FREE")
	$CollisionPolygon2D.disabled = true
	queue_free()
	hide()
