extends Node

signal fruit_changed(value)
var fruits = 0
var level = 1
var single_player: bool = false
var has_lost = false

var max_pineapples = 0
var max_kiwis = 0
var max_cherries = 0

func reset_fruits() -> void:
	fruits = 0
	fruit_changed.emit(fruits)

func collect_fruit() -> void:
	fruits+=1
	fruit_changed.emit(fruits)

func game_over() -> void:
	if not has_lost:
		has_lost = true
		Engine.time_scale = 0.3

		
		await get_tree().create_timer(2.0, true, false, true).timeout 
		
		await Transition.fade_in(0.5)
		Engine.time_scale = 1.0
		
		reset_fruits()
		get_tree().reload_current_scene()
		await Transition.fade_out(0.5)
		has_lost = false
		
func next_level() -> void:
	await get_tree().create_timer(1.5, true, false, true).timeout
	await Transition.fade_in(0.5)
	
	if level == 1:
		if fruits > max_pineapples:
			max_pineapples = fruits
		level = 2
		get_tree().change_scene_to_file("res://Levels/level2.tscn")
	
	elif level == 2:
		if get_tree().current_scene.name == "Level1":
			if fruits > max_pineapples:
				max_pineapples = fruits
			get_tree().change_scene_to_file("res://Levels/level2.tscn")
		elif get_tree().current_scene.name == "Level2":
			if fruits > max_kiwis:
				max_kiwis = fruits
				level = 3
			get_tree().change_scene_to_file("res://Levels/level3.tscn")
	
	elif level == 3:
		if get_tree().current_scene.name == "Level1":
			if fruits > max_pineapples:
				max_pineapples = fruits
			get_tree().change_scene_to_file("res://Levels/level2.tscn")
		elif get_tree().current_scene.name == "Level2":
			if fruits > max_kiwis:
				max_kiwis = fruits
			get_tree().change_scene_to_file("res://Levels/level3.tscn")
		elif get_tree().current_scene.name == "Level3":
			if fruits > max_cherries:
				max_cherries = fruits
			get_tree().change_scene_to_file("res://UI/level_select.tscn")
	reset_fruits()
	await Transition.fade_out(0.5)
	
	 
