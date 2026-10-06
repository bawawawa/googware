extends Node2D

@onready var audio_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var timer: Timer = $Timer

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://title_screen.tscn")
	
