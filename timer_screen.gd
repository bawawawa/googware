extends Node

@onready var DerpContainer: HBoxContainer = $DerpContainer
@onready var Derp: TextureRect = $DerpContainer/Derp
@onready var Derp2: TextureRect = $DerpContainer/Derp2
@onready var Derp3: TextureRect = $DerpContainer/Derp3
@onready var Derp4: TextureRect = $DerpContainer/Derp4
@onready var Derp5: TextureRect = $DerpContainer/Derp5
@onready var level: RichTextLabel = $Level
@onready var timer: RichTextLabel = $Timer

var time

func _ready() -> void:
			await get_tree().create_timer(5.0).timeout
	
			if Global.minigames_done < 3:
				Global.minigames_done = Global.minigames_done +1
				get_tree().change_scene_to_file("res://TBA" + str(Global.minigames_done) + ".tscn")
				
			else:
				get_tree().change_scene_to_file("res://title_screen.tscn")


func _process(delta: float) -> void:
			match Global.lives:
				4:
					Derp.hide()
				3:
					Derp.hide()
					Derp2.hide()
				2:
					Derp.hide()
					Derp2.hide()
					Derp3.hide()
				1:
					Derp.hide()
					Derp2.hide()
					Derp3.hide()
					Derp4.hide()
				0:
					DerpContainer.hide()
					
			timer.text = str(time)
			level.text = "Level" + str(Global.minigames_done)
			
func Timer(start_time: float):
	time = start_time
	
	while time > 0.0:
			await wait(0.1)
			time -= 0.1
			
	return

func wait(seconds: float) -> void:
			await get_tree().create_timer(seconds).timeout
