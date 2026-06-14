extends Area2D

@export var efeito: PackedScene

func _ready() -> void:
	if get_tree().current_scene.name == "Level1":
		$AnimatedSprite2D.play("idlePineapple")
	elif get_tree().current_scene.name == "Level2":
		$AnimatedSprite2D.play("idleKiwi")
	elif get_tree().current_scene.name == "Level3":
		$AnimatedSprite2D.play("idleCherry")


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" or body.name == "Player2":
		
		GameManager.collect_fruit()
		spawn_efeito()
		queue_free()

func spawn_efeito() -> void:
	if efeito != null:
		var novo_efeito = efeito.instantiate()
		
		get_tree().current_scene.call_deferred("add_child", novo_efeito)
		
		novo_efeito.global_position = global_position
