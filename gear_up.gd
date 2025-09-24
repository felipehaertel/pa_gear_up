extends CharacterBody2D

const SPEED = 300.0

func _ready() -> void:
	var rng = RandomNumberGenerator.new()

	var vector = rng.randf_range(0.0, 360.0)
	var direction = Vector2(cos(deg_to_rad(vector)), sin(deg_to_rad(vector)))
	velocity = direction * SPEED

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())

func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		Global.selected = self;
		var logline = Logline.new(get_viewport().get_mouse_position(),true,self.name)
		Global.arquivo_log.append(logline.dict())
