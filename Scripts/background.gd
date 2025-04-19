extends Node2D

@onready var darkleft: ColorRect = $Darkness/darkleft
@onready var darkcenter: ColorRect = $Darkness/darkcenter
@onready var darkright: ColorRect = $Darkness/darkright

var darkness

func _ready() -> void:
	darkness = [darkleft, darkcenter, darkright]
	for dark in darkness:
		dark.visible = true
		dark.z_index = 4


func _on_light_switch_pressed() -> void:
	for dark in darkness:
		dark.z_index = -10
		await get_tree().create_timer(1.0).timeout
