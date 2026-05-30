extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" or body.name == "Player2":
		GameManager.game_over()
