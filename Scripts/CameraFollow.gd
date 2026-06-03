extends Camera2D

@export var player1: Node2D
@export var player2: Node2D

func _process(delta: float) -> void:
	if player1 and player2:
		var medio = (player1.global_position + player2.global_position) / 2
		
		global_position = medio
		
		
		var zoom_mod = player1.global_position.distance_to(player2.global_position) / 20000
		
		if zoom_mod < 0.12:
			zoom.x = 0.35 - zoom_mod
			zoom.y = 0.35 - zoom_mod
		
	else:
		global_position = player1.global_position
		
