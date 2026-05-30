extends Node

func game_over() -> void:
	Engine.time_scale = 0.3
	
	await get_tree().create_timer(2.0, true, false, true).timeout 
	
	await Transition.fade_in(0.5)
	Engine.time_scale = 1.0
	
	
	get_tree().reload_current_scene()
	await Transition.fade_out(0.5)
