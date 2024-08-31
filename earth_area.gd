extends Area2D
signal ammo_up

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("green_alien"):
		area.queue_free()
	elif area.is_in_group("blue_alien"):
		area.queue_free()
		Global.ammo += 1
		ammo_up.emit()
