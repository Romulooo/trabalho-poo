extends StaticBody2D

func _ready() -> void:
	if not GameManager.single_player:
		queue_free()

func _process(delta: float) -> void:
	pass
