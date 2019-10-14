extends Node

onready var player = $DoodleKinematicBody
onready var score = $CanvasLayer/ScoreLabel
onready var interface = $Interfaz
onready var game_over = false
onready var first_game = true

func _ready():
	Event.connect("start_game", self,"_on_start_game")
	Event.connect("game_over", self,"_on_game_over")
	get_node("Game").propagate_call("hide")
	get_tree().set_pause(true)

func _on_game_over():
	game_over = true

#Se puede poner aca la llamada a un metodo que popule la pantalla con 
#las plataformas y ponga al player sobre la plataforma mas baja
func _on_start_game():
	if game_over:
		game_over = false
		var newGame = load("res://Scenes/Game.tscn")
		get_node("Game").free()
		self.add_child_below_node(get_node("Interfaz"),newGame.instance())

	if first_game:
		get_node("Game").propagate_call("show")
		first_game = false
		
	get_tree().set_pause(false)
	interface.show_message("¡START!")