extends Area2D
signal hit_points_down
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
		Global.hit_points -= 1
		hit_points_down.emit()
		explosion_sound.playing = true

	if Global.hit_points == 0:
		get_tree().change_scene_to_file("res://score_screen.tscn")
