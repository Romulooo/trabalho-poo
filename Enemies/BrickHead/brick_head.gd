extends CharacterBody2D

var start_position
enum states {waiting, falling, rising}
var state = states.waiting

func _ready() -> void:
	start_position = global_position.y

func _on_detection_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player" or body.name =="Player2":
		if state == states.waiting:
			state = states.falling


func _physics_process(delta: float) -> void:
	if state == states.waiting:
		global_position.y = start_position
		velocity.y = 0
	elif state == states.falling:
		velocity.y = 1000
		move_and_slide()
		if is_on_floor():
			$AnimatedSprite2D.play("hit")
			await get_tree().create_timer(0.4, true, false, true).timeout 
			$AnimatedSprite2D.play("idle")
			state = states.rising
	elif state == states.rising:
		velocity.y = -150
		move_and_slide()
		if global_position.y <= start_position:
			state = states.waiting	
	
	


func _on_damage_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.p1_damage()
	elif body.name == "Player2":
		body.p2_damage()
