extends Node2D

var ammo_label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ammo_label = get_node("AmmoLabel")
	ammo_label.text = str(Global.ammo)
	Global.score = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_player_path_follow_ammo_down() -> void:
	ammo_label.text = str(Global.ammo)

func _on_earth_area_ammo_up() -> void:
	ammo_label.text = str(Global.ammo)

func _on_earth_area_ammo_down() -> void:
	ammo_label.text = str(Global.ammo)
