extends Button

@export var circulo: PackedScene  = preload("res://Circulo.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(_button_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _button_pressed():
	var new_circulo = circulo.instantiate()
	add_child(new_circulo)
