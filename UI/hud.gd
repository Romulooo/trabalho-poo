extends CanvasLayer


func fruit_text(new_value):
	$Fruits.text = "x%d" % new_value
	
func _ready() -> void:

	GameManager.pineapple_changed.connect(fruit_text)
	
	fruit_text(GameManager.pineapples)
