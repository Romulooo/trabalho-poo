extends CharacterBody2D

var target
var is_dead = false
const SPEED = 250.0

func _on_detection_area_body_entered(body: Node2D) -> void:
	target = body

func _on_detection_area_body_exited(body: Node2D) -> void:
	target = null
	


func _physics_process(delta: float) -> void:
	if target != null and not is_dead:
		$AnimatedSprite2D.play("follow")
		var direction = target.global_position - global_position
		
		direction = direction.normalized()
		
		velocity = direction * SPEED
		
		if direction.x > 0:
			$AnimatedSprite2D.flip_h = false
		if direction.x < 0:
			$AnimatedSprite2D.flip_h = true
		
		move_and_slide()
	
	elif not is_dead:
		$AnimatedSprite2D.play("idle")
	
	


func _on_sting_area_2d_body_entered(body: Node2D) -> void:
	if not is_dead:
		if body.name == "Player":
			body.p1_damage()
		elif body.name == "Player2":
			body.p2_damage()
			


func _on_head_body_entered(body: Node2D) -> void:
	if body.name == "Player" or body.name == "Player2":
		if body.velocity.y >= 0:
			if not is_dead:
				body.velocity.y = -400
			is_dead = true
			$AnimatedSprite2D.play("death")
			velocity.x = 0
			velocity.y = 0
			await get_tree().create_timer(0.6, true, false, true).timeout 
			queue_free()
