extends Node

@onready var halu: Node2D = $Halu
@onready var halu_2: Node2D = $Halu2
@onready var halu_3: Node2D = $Halu3
@onready var halu_4: Node2D = $Halu4
var halus
var selected_halu

func _ready():
	halus = [halu, halu_2, halu_3, halu_4]
	halus.shuffle()
	while true:
		await get_tree().create_timer(5.0).timeout
		selected_halu = halus.pick_random()
		if selected_halu.present == true:
			selected_halu = halus.pick_random()
		selected_halu.present = true


func _on_light_button_pressed() -> void:
	for halu in halus:
		halu.present = false
