extends Node2D

onready var collision = $KinematicBody2D/CollisionPolygon2D
onready var platform = $KinematicBody2D
onready var tween = $Tween

const MARGIN_PLATFORM = 35
const IDLE_DURATION = 0.25
export var move_to = Vector2.RIGHT
export var speed = 100.0

func _ready():
	position.x = get_viewport_rect().position.x #Posiciona a la plataforma al margen izquierdo
	move_to = move_to * (get_viewport_rect().size.x - MARGIN_PLATFORM) #Vector que indica hasta que posicion se va a mover
	_init_tween()

func _init_tween():
	var startPosition = Vector2(MARGIN_PLATFORM,0) # Posicion inicial del movimiento
	var duration = move_to.length() / speed

	tween.interpolate_property(platform, "position", startPosition, move_to, duration, Tween.TRANS_LINEAR,Tween.EASE_IN_OUT, IDLE_DURATION)
	tween.interpolate_property(platform, "position", move_to, startPosition, duration, Tween.TRANS_LINEAR,Tween.EASE_IN_OUT, (duration + IDLE_DURATION * 2))
	tween.start()
	
func _on_screen_exited():
	print("FREE")
	$KinematicBody2D/CollisionPolygon2D.disabled = true
	queue_free()
	hide()