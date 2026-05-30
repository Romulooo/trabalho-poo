extends Area2D

@export var efeito: PackedScene

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" or body.name == "Player2":
		spawn_efeito()
		queue_free()

func spawn_efeito() -> void:
	if efeito != null:
		var novo_efeito = efeito.instantiate()
		
		get_tree().current_scene.call_deferred("add_child", novo_efeito)
		
		novo_efeito.global_position = global_position
