extends AnimatedSprite2D

func _ready() -> void:
	$CollectSound.play()

func _on_animation_finished() -> void:
	
	queue_free()
