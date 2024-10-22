extends Node
var hit_points
var ammo_set = ["normal", "peg", "bubble"]
var ammo_type
var score = 0
var menu_sound
var explosion_sound
var player_won
var im_blue_sound
var clapping_sound
var shots_fired
var shots_landed
var background_music
var uhh_sound
var music_off

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_won = false
	hit_points = 3
	ammo_type = ammo_set[0]
	shots_fired = 0
	shots_landed = 0
	music_off = false
	
	menu_sound = get_node("MenuSound")
	explosion_sound = get_node("ExplosionSound")
	im_blue_sound = get_node("ImBlueSound")
	clapping_sound = get_node("ClappingSound")
	background_music = get_node("BackgroundMusic")
	uhh_sound = get_node("UhhSound")

	background_music.playing = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("exit"):
		get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_background_music_finished() -> void:
	background_music.playing = true
