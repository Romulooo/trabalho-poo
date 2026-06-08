extends CanvasLayer


func fruit_text(new_value):
	$Fruits.text = "x%d" % new_value
	
func _ready() -> void:
	GameManager.pineapple_changed.connect(fruit_text)
	fruit_text(GameManager.pineapples)

func get_visibility() -> void:
	await get_tree().process_frame 
	
	var scene = get_tree().current_scene.name
	
	if scene == "Level1":
		visible = true
		$AnimatedSprite2D.play("idlePineapple")
		fruit_text(GameManager.pineapples)
	elif scene == "Level2":
		visible = true
		$AnimatedSprite2D.play("idleKiwi")
	elif scene == "Level3":
		visible = false
		$AnimatedSprite2D.play("idleKiwi")
	else:
		visible = false
