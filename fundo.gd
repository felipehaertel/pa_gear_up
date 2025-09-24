extends Node2D

@export var circulo: PackedScene  = preload("res://Circulo.tscn")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("SALVAR"):
		var json_string = JSON.stringify(Global.arquivo_log, "  ") # O segundo argumento "  " serve para formatar a saída com indentação, tornando-a mais legível.

		# Abre o arquivo para escrita.
		var file = FileAccess.open("./log.json", FileAccess.WRITE)
		if file != null:
			# Escreve a string JSON no arquivo.
			file.store_string(json_string)
			file.close()
			print("Array salvo com sucesso em: ")
		else:
			print("Erro ao abrir o arquivo para escrita.")
		
	if event is InputEventMouseButton and event.pressed:
		match event.button_index:
			MOUSE_BUTTON_LEFT:
				# criar colision shape2d
				var query = PhysicsPointQueryParameters2D.new()
				query.position = event.position
				query.collide_with_areas = true
				query.collide_with_bodies = true
				
				var result = get_world_2d().direct_space_state.intersect_point(query)
				# verificar se houve colisão
				if result.is_empty():
					var new_logo:Node2D = circulo.instantiate()
					new_logo.position = event.position;
					add_child(new_logo)
					get_viewport().set_input_as_handled()
					var logline = Logline.new(get_viewport().get_mouse_position(),true)
					Global.arquivo_log.append(logline.dict())
					
func _process(_delta: float) -> void:
	var logline = Logline.new(get_viewport().get_mouse_position())
	Global.arquivo_log.append(logline.dict())
	
