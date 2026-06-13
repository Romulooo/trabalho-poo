extends Area2D

var win = false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" and not win or body.name == "Player2" and not win:
		$AnimatedSprite2D.play("complete")
		$WinSound.play()
		win = true
		
		GameManager.next_level()
		await get_tree().create_timer(5.0, true, false, true).timeout
		win = false
