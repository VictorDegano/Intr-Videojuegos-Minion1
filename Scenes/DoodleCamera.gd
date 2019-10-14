extends Camera2D

export(NodePath) var player_path # El export es utilizado para obtener la ruta del nodo
var player

func _ready():
	set_process(true)
	player = get_node(player_path) # Se asigna el nodo del player

func _process(delta):
	var playerPositionY = player.position.y
	
	# Revisa si si la posicion y de 
	# la camara es mayor a la del player para mantenerla fixeada
	if playerPositionY < self.position.y:
		self.position = Vector2(0,playerPositionY)
