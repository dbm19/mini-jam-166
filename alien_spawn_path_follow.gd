extends PathFollow2D

var position_rng = RandomNumberGenerator.new()
var spawn_rng = RandomNumberGenerator.new()
var alien_type
var alien_spawn_timer 
var alien_scene
var alien_instance
var center_of_map = Vector2(DisplayServer.window_get_size() / 2)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	alien_scene = preload("res://green_alien.tscn")
	alien_spawn_timer = get_node("../AlienSpawnTimer")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_alien_spawn_timer_timeout() -> void:
	progress_ratio = position_rng.randf_range(0.0, 1.0)
	alien_instance = alien_scene.instantiate()
	alien_type = spawn_rng.randi_range(0, 1)
	if alien_type == 0:
		alien_instance.get_node("GreenAlienSprite").texture = load("res://art_assets/alien.png")
		alien_instance.add_to_group("normal_alien")
	else:
		alien_instance.get_node("GreenAlienSprite").texture = load("res://art_assets/peg_alien.png")
		alien_instance.add_to_group("peg_alien")
	alien_instance.position = position
	get_node("../../").add_child(alien_instance)
