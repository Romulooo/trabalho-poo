extends RigidBody2D

func _ready() -> void:
	gravity_scale = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_detection_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player" or body.name == "Player2":
		gravity_scale = 0.3
		$AnimatedSprite2D.play("off")
