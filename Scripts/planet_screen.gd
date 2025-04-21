extends AnimatedSprite2D


@onready var boulder: Node2D = $"../Boulder"



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if boulder.gravity == 0:
		play("EARTH")
	if boulder.gravity == 1:
		play("VENUS")
	if boulder.gravity == 2:
		play("MOON")
