extends Node2D

export(int) var JUMP_FORCE = 700.0

func _on_player_jump(player):
	
	if player.position.y < global_position.y:
		$AnimationPlayer.play("Activate")
		player.jumpBoost(JUMP_FORCE)

func _on_screen_exited():
	print("FREE")
	queue_free()
