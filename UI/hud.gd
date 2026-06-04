extends CanvasLayer


func fruit_text(new_value):
	$Fruits.text = "x%d" % new_value
	
func _ready() -> void:
	if get_tree().current_scene.name == "Level1":
		$AnimatedSprite2D.play("idlePineapple")
	elif get_tree().current_scene.name == "Level2":
		$AnimatedSprite2D.play("idleKiwi")
		
		
	GameManager.pineapple_changed.connect(fruit_text)
	
	fruit_text(GameManager.pineapples)
