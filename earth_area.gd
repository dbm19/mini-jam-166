extends Area2D
signal ammo_up
signal ammo_down
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
		Global.ammo -= 1
		ammo_down.emit()
		explosion_sound.playing = true
	elif area.is_in_group("blue_alien"):
		area.queue_free()
		Global.ammo += 1
		reload_sound.playing = true
		ammo_up.emit()

	if Global.ammo < 0:
		get_tree().change_scene_to_file("res://score_screen.tscn")
