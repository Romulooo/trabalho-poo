extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Hud.get_visibility()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Menu"):
		get_tree().paused = false 
		
		await Transition.fade_in(0.3)
		get_tree().change_scene_to_file("res://level_select.tscn")
		await Transition.fade_out(0.3)
