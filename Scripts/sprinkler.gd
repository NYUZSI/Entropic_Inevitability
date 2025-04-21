extends AnimatedSprite2D

@onready var watering: AudioStreamPlayer = $watering

var rightpos: Vector2 = Vector2(-3158, -530)
var leftpos: Vector2 = Vector2(-5432, -178)
var desiredpos: int = 1
var active = false
var speed = 1000

func _ready() -> void:
	position = rightpos
	active = false


func _process(delta: float) -> void:
	if desiredpos == 1 and position != rightpos:
		if position.y > rightpos.y:
			position.y -= speed * delta
			if position.y < rightpos.y:
				position.y = rightpos.y
		elif position.x < rightpos.x:
			position.x += speed * delta
			if position.x > rightpos.x:
				position.x = rightpos.x
	if desiredpos == 0 and position != leftpos:
		if position.x > leftpos.x:
			position.x -= speed * delta
			if position.x < leftpos.x:
				position.x = leftpos.x
		elif position.y < leftpos.y:
			position.y += speed * delta
			if position.y > leftpos.y:
				position.y = leftpos.y
	if active == true:
		play("On")
		if not watering.playing:
			watering.play()
	else:
		play("Off")
		if watering.playing:
			watering.stop()
