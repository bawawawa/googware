extends Node2D
@onready var audio_player: AudioStreamPlayer = $AudioStreamPlayer

func _ready() -> void:
	audio_player.play()



func _on_start_pressed() -> void:
	Global.minigames_done = 1
	Global.lives = 5
	get_tree().change_scene_to_file("res://level_scene.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
