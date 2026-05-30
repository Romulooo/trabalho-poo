extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.p1_damage()
	elif body.name == "Player2":
		body.p2_damage()
