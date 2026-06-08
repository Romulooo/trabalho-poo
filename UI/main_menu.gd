extends Control



func _ready() -> void:
	Hud.get_visibility()
	
func _on_button_play_pressed() -> void:
	get_tree().change_scene_to_file("res://UI/level_select.tscn")


func _on_button_quit_pressed() -> void:
	get_tree().quit()
