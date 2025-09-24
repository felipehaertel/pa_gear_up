extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _draw() -> void:
	if Global.selected != null:
		draw_circle(Global.selected.global_position, 61, Color.BLACK, true, -1, true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	queue_redraw()
