extends Node2D

var ammo_label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ammo_label = get_node("AmmoLabel")
	ammo_label.text = str(Global.ammo)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("exit"):
		get_tree().change_scene_to_file("res://main_menu.tscn")

func _on_player_path_follow_ammo_down() -> void:
	ammo_label.text = str(Global.ammo)

func _on_earth_area_ammo_up() -> void:
	ammo_label.text = str(Global.ammo)
