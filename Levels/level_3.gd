extends Node2D

func _ready() -> void:
	Hud.get_visibility()
	
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Menu"):
		get_tree().paused = false 
		
		await Transition.fade_in(0.3)
		get_tree().change_scene_to_file("res://UI/level_select.tscn")
		await Transition.fade_out(0.3)
		
		
