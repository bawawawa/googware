extends Node2D
@onready var themed_timer: Node2D = $ThemedTimer 

var derp_collected = 0
var timer_end = false
var finished = false

func _ready() -> void:
	await themed_timer.Timer(10.0)
	timer_end = true
	
func _process(delta: float) -> void:
	if finished:
		return

	if derp_collected == 3:
		finish(false)
		return

	if timer_end:
		finish(true)
			
			
func finish(timed_out: bool) -> void:
	finished = true

	if timed_out:
		Global.minigames_done -= 1
		Global.lives -= 1

	if Global.minigames_done > 3:
		get_tree().change_scene_to_file("res://winner.tscn")
	else:
		get_tree().change_scene_to_file("res://level_scene.tscn")


func derp_collect() -> void:
	derp_collected = derp_collected +1
	return
