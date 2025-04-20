extends Camera2D

@onready var naplo: Node2D = $"InHandNapló"


var alignment: int = 1
var leftpos: int = -3696
var basepos: int = -147
var rightpos: int = 3695

func _ready():
	position.x = basepos
	naplo.visible = false

func _input(event):
	if event.is_action_pressed("Camera Left"):
		alignment -= 1
		if alignment == -1:
			alignment = 0
	if event.is_action_pressed("Camera Right"):
		alignment += 1
		if alignment == 3:
			alignment = 2


func _process(delta):
	if alignment == 0 and position.x > leftpos:
		position.x -= 3000 * delta
		if position.x < leftpos:
			position.x = leftpos
	if alignment == 1 and position.x != basepos:
		if position.x < basepos:
			position.x += 3000 * delta
			if position.x > basepos:
				position.x = basepos
		if position.x > basepos:
			position.x -= 3000 * delta
			if position.x < basepos:
				position.x = basepos
	if alignment == 2 and position.x < rightpos:
		position.x += 3000 * delta
		if position.x > rightpos:
			position.x = rightpos


func _on_napló_click_pressed() -> void:
	naplo.visible = true
