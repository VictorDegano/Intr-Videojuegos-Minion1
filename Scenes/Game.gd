extends Node

func _ready():
	Event.connect("game_over",self,"_on_game_over")
	
func _on_game_over():
	$BackgroundMusicAudio/Tween.interpolate_property($BackgroundMusicAudio, "volume_db", -3, -80, 10, Tween.TRANS_LINEAR, Tween.EASE_IN, 0)
	$BackgroundMusicAudio/Tween.start()