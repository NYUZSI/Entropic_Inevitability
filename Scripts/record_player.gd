extends Node2D


@onready var chirp: AudioStreamPlayer = $Chirp
@onready var wind: AudioStreamPlayer = $Wind
@onready var rune_hum: AudioStreamPlayer = $RuneHum

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
