extends CharacterBody2D

var target

const SPEED = 300.0

func _on_detection_area_body_entered(body: Node2D) -> void:
	target = body

func _on_detection_area_body_exited(body: Node2D) -> void:
	target = null


func _physics_process(delta: float) -> void:
	if target != null:
		$AnimatedSprite2D.play("follow")
		var direction = target.global_position - global_position
		
		direction = direction.normalized()
		
		velocity = direction * SPEED
		
		if direction.x > 0:
			$AnimatedSprite2D.flip_h = false
		if direction.x < 0:
			$AnimatedSprite2D.flip_h = true
	
	else:
		$AnimatedSprite2D.play("idle")
	move_and_slide()


func _on_sting_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.p1_damage()
	elif body.name == "Player2":
		body.p2_damage()
		
