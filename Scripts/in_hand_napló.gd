extends Node2D

@onready var pages: AnimatedSprite2D = $"InHandNapló/Pages"
@onready var left: Sprite2D = $"InHandNapló/Left"
@onready var right: Sprite2D = $"InHandNapló/Right"
@onready var close: Sprite2D = $"InHandNapló/Close"

var page: int
var pagesarr: Array = ["page1", "page2", "page3"]


func _ready() -> void:
	page = 0
	left.modulate.r8 = 200
	left.modulate.g8 = 200
	left.modulate.b8 = 200
	right.modulate.r8 = 200
	right.modulate.g8 = 200
	right.modulate.b8 = 200
	close.modulate.r8 = 200
	close.modulate.g8 = 200
	close.modulate.b8 = 200


func _process(_delta: float) -> void:
	pages.play(pagesarr[page])


func _on_left_button_pressed() -> void:
	if page != 0:
		page -= 1


func _on_right_button_pressed() -> void:
	if page != 2:
		page += 1


func _on_close_button_pressed() -> void:
	visible = false


func _on_left_button_mouse_entered() -> void:
	left.modulate.r8 = 255
	left.modulate.g8 = 255
	left.modulate.b8 = 255


func _on_left_button_mouse_exited() -> void:
	left.modulate.r8 = 200
	left.modulate.g8 = 200
	left.modulate.b8 = 200


func _on_right_button_mouse_entered() -> void:
	right.modulate.r8 = 255
	right.modulate.g8 = 255
	right.modulate.b8 = 255


func _on_right_button_mouse_exited() -> void:
	right.modulate.r8 = 200
	right.modulate.g8 = 200
	right.modulate.b8 = 200


func _on_close_button_mouse_entered() -> void:
	close.modulate.r8 = 255
	close.modulate.g8 = 255
	close.modulate.b8 = 255


func _on_close_button_mouse_exited() -> void:
	close.modulate.r8 = 200
	close.modulate.g8 = 200
	close.modulate.b8 = 200
