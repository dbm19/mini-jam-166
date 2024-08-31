extends Area2D
signal ammo_up
var reload_sound
var explosion_sound

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reload_sound = get_node("ReloadSound")
	explosion_sound = get_node("ExplosionSound")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("green_alien"):
		area.queue_free()
		explosion_sound.playing = true
	elif area.is_in_group("blue_alien"):
		area.queue_free()
		Global.ammo += 1
		reload_sound.playing = true
		ammo_up.emit()
