extends Label

var lastPlayerDistance:int = 0
var firstJump = true

var actualScore:int = 0
var newScore = actualScore

const TEXT_PATTERN = "SCORE: %d"

func _ready():
	text = TEXT_PATTERN % 0
	Event.connect("update_score", self,"_on_update_score")

func _process(delta):
#
	if actualScore < newScore:
		actualScore += 10 # se podria usar un Min para asegurar el q el actual sea igual al new score.
#		actualScore = lerp(actualScore, newScore, 0.17) # Solo prueba
		text =  TEXT_PATTERN % actualScore

func _on_update_score(scoreToUpdate, playerPositionY):
	var roundedPlayerPosY = ceil(playerPositionY)
	
	if firstJump:
		lastPlayerDistance = roundedPlayerPosY + 1
		firstJump = false
	
	if lastPlayerDistance > roundedPlayerPosY:
		lastPlayerDistance = roundedPlayerPosY
		newScore += scoreToUpdate