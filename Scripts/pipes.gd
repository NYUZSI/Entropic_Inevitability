extends AnimatedSprite2D

var pipecolor = 0

func _ready() -> void:
	play("green")
	pipecolor = 0


func _process(delta: float) -> void:
	if pipecolor == 0:
		play("green")
	if pipecolor == 1:
		play("red")
