extends Node2D
@onready var DerpContainer: HBoxContainer = $DerpContainer
@onready var derp: TextureRect = $DerpContainer/Derp
@onready var derp2: TextureRect = $DerpContainer/Derp2
@onready var derp3: TextureRect = $DerpContainer/Derp3
@onready var derp4: TextureRect = $DerpContainer/Derp4
@onready var derp5: TextureRect = $DerpContainer/Derp5
@onready var level: RichTextLabel = $Level
@onready var timer: RichTextLabel = $Timer
@onready var audio_player: AudioStreamPlayer = $AudioStreamPlayer
var time
var advancing := false

func _ready() -> void:
	audio_player.play()
	await countdown(5.0)
	advance()

func advance() -> void:
	if advancing:
		return
	advancing = true

	if Global.lives <= 0:
		get_tree().change_scene_to_file("res://death.tscn")
		return

	if Global.minigames_done < 3:
		Global.minigames_done = Global.minigames_done + 1
		get_tree().change_scene_to_file(next_level())
	else:
		get_tree().change_scene_to_file("res://winner.tscn")

func next_level() -> String:
	return "res://minigame_" + str(Global.minigames_done) + ".tscn"

func complete_level() -> void:
	advance()
	

func _process(delta: float) -> void:
	match Global.lives: 

		4:
			derp.hide()
		3:
			derp.hide()
			derp2.hide()
		2:
			derp.hide()
			derp2.hide()
			derp3.hide()
		1:
			derp.hide()
			derp2.hide()
			derp3.hide()
			derp4.hide()
		0:
			DerpContainer.hide()
	
	timer.text = str(time) 
	level.text = "Level " + str(Global.minigames_done) 

func countdown(start_time: float):
	time = start_time
	while time > 0.0:
		await wait(0.1)
		time -= 0.1
	return

func wait(seconds: float) -> void:
	if not is_inside_tree():
		return
	await get_tree().create_timer(seconds).timeout
