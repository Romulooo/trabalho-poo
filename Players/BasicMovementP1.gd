extends CharacterBody2D

var health = 1
const SPEED = 600.0
const JUMP_VELOCITY = -660.0

func p1_damage() -> void:
	health = 0
	$AnimatedSprite2D.play("hurt")
	
	GameManager.game_over()

func _physics_process(delta: float) -> void:
	if not is_on_floor():	
		velocity += get_gravity() * delta * 1.4
	
	if health > 0:
		if Input.is_action_just_pressed("p1jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		var direction := Input.get_axis("p1left", "p1right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			
		if is_on_floor():
			if direction == 0:
				$AnimatedSprite2D.play("idle")
			else:
				$AnimatedSprite2D.play("run")
		else:
			$AnimatedSprite2D.play("run")
			
		if direction > 0:
			$AnimatedSprite2D.flip_h = false
		if direction < 0:
			$AnimatedSprite2D.flip_h = true
			
	move_and_slide()
