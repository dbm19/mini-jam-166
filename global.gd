extends Node
var hit_points
var ammo_set = ["normal", "peg", "bubble"]
var ammo_type
var score = 0
var menu_sound
var explosion_sound


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hit_points = 3
	ammo_type = ammo_set[0]
	
	menu_sound = get_node("MenuSound")
	explosion_sound = get_node("ExplosionSound")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("exit"):
		get_tree().change_scene_to_file("res://main_menu.tscn")
