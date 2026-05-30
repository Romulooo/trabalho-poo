extends Area2D

@export var forca_impulso: float = -1000.0

func _on_body_entered(body: Node2D) -> void:
	if "velocity" in body:
		body.velocity.y = forca_impulso
		$AnimatedSprite2D.play("jump")
	


func _on_body_exited(body: Node2D) -> void:
	await get_tree().create_timer(0.5).timeout
	$AnimatedSprite2D.play("idle")
