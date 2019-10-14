extends StaticBody2D

onready var collision = $CollisionPolygon2D 

func _on_screen_exited():
	print("FREE")
	collision.disabled = true
	get_parent().queue_free()
	hide()