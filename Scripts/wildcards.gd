extends Node2D

var startup: bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = true
	modulate.a = 0.0
	startup = true


func _process(delta: float) -> void:
	if startup:
		await get_tree().create_timer(1).timeout
		if modulate.a < 0.99:
			modulate.a += 1 * delta
		if modulate.a >= 0.99:
			await get_tree().create_timer(1.5).timeout
			startup = false
	if not startup:
		if modulate.a > 0.01:
			modulate.a -= 1 * delta
		else:
			visible = false
			get_tree().change_scene_to_file("res://Scenes/main.tscn")
