extends PathFollow2D

var rng = RandomNumberGenerator.new()
var alien_spawn_timer 
var alien_scene
var alien_instance
var center_of_map = Vector2(DisplayServer.window_get_size() / 2)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	alien_spawn_timer = get_node("../AlienSpawnTimer")
	alien_scene = preload("res://green_alien.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_alien_spawn_timer_timeout() -> void:
	progress_ratio = rng.randf_range(0.0, 1.0)
	var alien_instance = alien_scene.instantiate()
	alien_instance.position = position
	get_node("../../").add_child(alien_instance)
