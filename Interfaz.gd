extends CanvasLayer

onready var messageLabel = $Mensajes
onready var messageTimer = $Timer
onready var startbutton = $Button

func _ready():
	Event.connect("game_over",self,"game_over")
	messageTimer.connect("timeout", self,"_on_timeout")
	startbutton.connect("pressed", self,"_on_button_pressed")

func show_message(message):
	messageLabel.text = message
	messageLabel.show()
	messageTimer.start()

func game_over():
	show_message("¡Game Over!")
	yield(messageTimer, "timeout")
	startbutton.show()
	messageLabel.text = "Bunny Jump"
	messageLabel.show()
	get_tree().set_pause(true)

#Utilizado para ocultar el message Label
func _on_timeout():
	messageLabel.hide()

func _on_button_pressed():
#	get_tree().set_pause(false)
	messageLabel.hide()
	startbutton.hide()
	Event.emit_signal("start_game")