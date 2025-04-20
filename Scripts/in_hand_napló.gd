extends Node2D

@onready var left_page: AnimatedSprite2D = $"InHandNapló/LeftPage"
@onready var right_page: AnimatedSprite2D = $"InHandNapló/RightPage"

var page: int
var pages: Array = ["page1", "page2", "page3"]


func _ready() -> void:
	page = 0


func _process(delta: float) -> void:
	left_page.play(pages[page])
	right_page.play(pages[page])


func _on_left_button_pressed() -> void:
	if page != 0:
		page -= 1


func _on_right_button_pressed() -> void:
	if page != 2:
		page += 1


func _on_close_button_pressed() -> void:
	visible = false
