extends Node2D


@onready var chirp: AudioStreamPlayer = $Chirp
@onready var wind: AudioStreamPlayer = $Wind
@onready var rune_hum: AudioStreamPlayer = $RuneHum
@onready var play: Sprite2D = $play
@onready var forw: Sprite2D = $forw
@onready var back: Sprite2D = $back
@onready var button_press: AudioStreamPlayer = $ButtonPress

# 0 = birds for tp1; 1 = wind for tp2; 2 = rune frequency for tp3
var sound: int
var playing: bool

func _ready() -> void:
	sound = 0
	playing = false
	play.modulate.r8 = 200
	play.modulate.g8 = 200
	play.modulate.b8 = 200
	forw.modulate.r8 = 200
	forw.modulate.g8 = 200
	forw.modulate.b8 = 200
	back.modulate.r8 = 200
	back.modulate.g8 = 200
	back.modulate.b8 = 200


func reset():
	sound = 0
	playing = false


func _on_play_button_pressed() -> void:
	if playing == false:
		playing = true
	else:
		playing = false
	if not button_press.playing:
		button_press.play()


func _on_back_button_pressed() -> void:
	sound -= 1
	if sound == -1:
		sound = 2
	if not button_press.playing:
		button_press.play()


func _on_forw_button_pressed() -> void:
	sound += 1
	if sound == 3:
		sound = 0
	if not button_press.playing:
		button_press.play()


func _process(delta: float) -> void:
	if playing == true:
		match sound:
			0:
				if not chirp.playing:
					wind.stop()
					rune_hum.stop()
					chirp.play()
			1:
				if not wind.playing:
					chirp.stop()
					rune_hum.stop()
					wind.play()
			2:
				if not rune_hum.playing:
					chirp.stop()
					wind.stop()
					rune_hum.play()
	if playing == false:
		if chirp.playing:
			chirp.stop()
		if wind.playing:
			wind.stop()
		if rune_hum.playing:
			rune_hum.stop()


func _on_back_button_mouse_entered() -> void:
	back.modulate.r8 = 255
	back.modulate.g8 = 255
	back.modulate.b8 = 255


func _on_back_button_mouse_exited() -> void:
	back.modulate.r8 = 200
	back.modulate.g8 = 200
	back.modulate.b8 = 200


func _on_forw_button_mouse_entered() -> void:
	forw.modulate.r8 = 255
	forw.modulate.g8 = 255
	forw.modulate.b8 = 255


func _on_forw_button_mouse_exited() -> void:
	forw.modulate.r8 = 200
	forw.modulate.g8 = 200
	forw.modulate.b8 = 200


func _on_play_button_mouse_entered() -> void:
	play.modulate.r8 = 255
	play.modulate.g8 = 255
	play.modulate.b8 = 255


func _on_play_button_mouse_exited() -> void:
	play.modulate.r8 = 200
	play.modulate.g8 = 200
	play.modulate.b8 = 200
