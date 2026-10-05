extends Node2D
@onready var DerpContainer: HBoxContainer = $DerpContainer
@onready var derp: TextureRect = $DerpContainer/Derp
@onready var derp2: TextureRect = $DerpContainer/Derp2
@onready var derp3: TextureRect = $DerpContainer/Derp3
@onready var derp4: TextureRect = $DerpContainer/Derp4
@onready var derp5: TextureRect = $DerpContainer/Derp5
@onready var level: RichTextLabel = $Level
@onready var timer: RichTextLabel = $Timer

var time

func _ready() -> void:
	await Timer(5.0) 
	
	if Global.minigames_done < 3:
		Global.minigames_done = Global.minigames_done +1
		get_tree().change_scene_to_file("res://node_2d.tscn")

	else:
		get_tree().change_scene_to_file("res://title_screen.tscn") 
	

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

func Timer(start_time: float): 
	
	time = start_time 
	
	while time > 0.0: 
		await wait(0.1)
		time -= 0.1 
		
	
	return

func wait(seconds: float) -> void: 
	await get_tree().create_timer(seconds).timeout
