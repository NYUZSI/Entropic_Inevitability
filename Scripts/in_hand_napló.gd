extends Node2D

@onready var pages: AnimatedSprite2D = $"InHandNapló/Pages"

var page: int
var pagesarr: Array = ["page1", "page2", "page3"]


func _ready() -> void:
	page = 0


func _process(delta: float) -> void:
	pages.play(pagesarr[page])


func _on_left_button_pressed() -> void:
	if page != 0:
		page -= 1


func _on_right_button_pressed() -> void:
	if page != 2:
		page += 1


func _on_close_button_pressed() -> void:
	visible = false
