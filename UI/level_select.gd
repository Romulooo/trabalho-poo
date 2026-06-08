extends Control



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Hud.get_visibility()
	if GameManager.level == 1:
		$GridContainer/ButtonLevel2.modulate = Color(0.507, 0.507, 0.507, 1.0)
		$GridContainer/ButtonLevel3.modulate = Color(0.507, 0.507, 0.507, 1.0)
	elif GameManager.level == 2:
		$GridContainer/ButtonLevel3.modulate = Color(0.507, 0.507, 0.507, 1.0)
	

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://UI/main_menu.tscn")



func _on_button_level_1_pressed() -> void:
	await Transition.fade_in(0.5)
	get_tree().change_scene_to_file("res://levels/level1.tscn")
	await Transition.fade_out(0.5)


func _on_button_level_2_pressed() -> void:
	if GameManager.level >= 2:
		await Transition.fade_in(0.5)
		get_tree().change_scene_to_file("res://levels/level2.tscn")
		await Transition.fade_out(0.5)
		

func _on_button_level_3_pressed() -> void:
	if GameManager.level >= 3:
		await Transition.fade_in(0.5)
		get_tree().change_scene_to_file("res://levels/level3.tscn")
		await Transition.fade_out(0.5)

		
func _on_button_level_1_mouse_entered() -> void:
	$GridContainer/ButtonLevel1.modulate = Color(1.2, 1.2, 1.2)


func _on_button_level_1_mouse_exited() -> void:
	$GridContainer/ButtonLevel1.modulate = Color(1.0, 1.0, 1.0)


func _on_button_level_2_mouse_entered() -> void:
	if GameManager.level >= 2:
		$GridContainer/ButtonLevel2.modulate = Color(1.2, 1.2, 1.2)

func _on_button_level_2_mouse_exited() -> void:
	if GameManager.level >= 2:
		$GridContainer/ButtonLevel2.modulate = Color(1.0, 1.0, 1.0)

func _on_button_level_3_mouse_entered() -> void:
	if GameManager.level >= 3:
		$GridContainer/ButtonLevel3.modulate = Color(1.2, 1.2, 1.2)

func _on_button_level_3_mouse_exited() -> void:
	if GameManager.level >= 3:
		$GridContainer/ButtonLevel2.modulate = Color(1.0, 1.0, 1.0)
