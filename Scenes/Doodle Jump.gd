extends Node

onready var player = $DoodleKinematicBody
onready var score = $CanvasLayer/ScoreLabel
onready var interface = $Interfaz

func _ready():
	Event.connect("start_game", self,"_on_start_game")
	get_tree().set_pause(true)

#Se puede poner aca la llamada a un metodo que popule la pantalla con 
#las plataformas y ponga al player sobre la plataforma mas baja
func on_start_game():
	score.reset()
#	player.reset()
	interface.show_message("¡START!")
	pass