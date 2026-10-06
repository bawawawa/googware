extends Node2D

@onready var themed_timer: Node2D = $Node2D
@onready var audio_player: AudioStreamPlayer = $AudioStreamPlayer

var button_pressed := 0
var timer_end = false
var finished = false

func _ready() -> void:
	audio_player.play()
	await themed_timer.Timer(7.0)
	timer_end = true

func _process(delta: float) -> void:
	if finished:
		return

	if button_pressed == 4:
		finish(false)
		return

	if timer_end:
		finish(true)

func finish(timed_out: bool) -> void:
	finished = true

	if timed_out:
		Global.minigames_done -= 1
		Global.lives -= 1

	get_tree().change_scene_to_file("res://level_scene.tscn")
