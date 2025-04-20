extends Button

func _ready():
	visible = true


func reset():
	visible = true


func _on_pressed() -> void:
	visible = false
