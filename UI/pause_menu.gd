extends CanvasLayer

func _ready() -> void:
	visible = false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Menu"):
		alternar_pause()
		
func alternar_pause() -> void:
	var jogo_pausado: bool = get_tree().paused
	get_tree().paused = not jogo_pausado
	visible = get_tree().paused


func _on_button_continue_pressed() -> void:
	alternar_pause()


func _on_button_menu_pressed() -> void:
	get_tree().paused = false
	await Transition.fade_in(0.5)
	get_tree().change_scene_to_file("res://UI/level_select.tscn")
	GameManager.reset_fruits()
	await Transition.fade_out(0.5)
