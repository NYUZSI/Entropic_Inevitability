extends Node2D

# 0 = birds for tp1; 1 = wind for tp2; 2 = rune frequency for tp3
var sound: int
var playing: bool

func _ready() -> void:
	sound = 0
	playing = false


func reset():
	sound = 0
	playing = false


func _on_play_button_pressed() -> void:
	if playing == false:
		playing = true
	else:
		playing = false
	print(playing)


func _on_back_button_pressed() -> void:
	sound -= 1
	if sound == -1:
		sound = 2
	print(sound)


func _on_forw_button_pressed() -> void:
	sound += 1
	if sound == 3:
		sound = 0
	print(sound)
