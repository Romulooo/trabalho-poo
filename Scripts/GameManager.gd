extends Node

signal pineapple_changed(value)
var pineapples = 0

func reset_pineapples() -> void:
	pineapples = 0
	pineapple_changed.emit(pineapples)

func collect_pineapple() -> void:
	pineapples+=1
	pineapple_changed.emit(pineapples)


func game_over() -> void:
	Engine.time_scale = 0.3
	reset_pineapples()
	
	await get_tree().create_timer(2.0, true, false, true).timeout 
	
	await Transition.fade_in(0.5)
	Engine.time_scale = 1.0
	
	
	get_tree().reload_current_scene()
	await Transition.fade_out(0.5)
