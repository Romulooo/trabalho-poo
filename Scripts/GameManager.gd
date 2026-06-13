extends Node

signal pineapple_changed(value)
var pineapples = 0
var level = 1
var single_player: bool = false
var has_lost = false

func reset_pineapples() -> void:
	pineapples = 0
	pineapple_changed.emit(pineapples)

func collect_pineapple() -> void:
	pineapples+=1
	pineapple_changed.emit(pineapples)

func game_over() -> void:
	if not has_lost:
		has_lost = true
		Engine.time_scale = 0.3

		
		await get_tree().create_timer(2.0, true, false, true).timeout 
		
		await Transition.fade_in(0.5)
		Engine.time_scale = 1.0
		
		reset_pineapples()
		get_tree().reload_current_scene()
		await Transition.fade_out(0.5)
		has_lost = false
		
func next_level() -> void:
	await get_tree().create_timer(2.0, true, false, true).timeout
	await Transition.fade_in(0.5)
	reset_pineapples()
	if level == 1:
		level = 2
		get_tree().change_scene_to_file("res://Levels/level2.tscn")
	
	elif level == 2:
		level = 3
		get_tree().change_scene_to_file("res://Levels/level3.tscn")
	
	elif level == 3:
		get_tree().change_scene_to_file("res://UI/level_select.tscn")
	
	await Transition.fade_out(0.5)
	
	 
