extends CanvasLayer

@onready var black = $ColorRect

func _ready() -> void:
	black.modulate.a = 0.0

func fade_in(tempo: float = 1.0) -> void:
	var tween = create_tween()
	
	tween.tween_property(black, "modulate:a", 1.0, tempo)

	await tween.finished

func fade_out(tempo: float = 1.0) -> void:
	var tween = create_tween()
	tween.tween_property(black, "modulate:a", 0.0, tempo)
	
	await tween.finished
