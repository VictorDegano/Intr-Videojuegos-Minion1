extends Node

class_name Utils

const PLAYER_MARGIN = 30

#chequea que el objeto no se pase del margen lateral, y si sucede lo tranca al limite del margen.
static func checkLimit(object, rectangleViewPort):
	if object.global_position.x < 0+PLAYER_MARGIN:
		object.global_position.x = PLAYER_MARGIN
	if object.global_position.x > rectangleViewPort.size.x-PLAYER_MARGIN:
		object.global_position.x = rectangleViewPort.size.x-PLAYER_MARGIN


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
