extends Node2D

var ammo_label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ammo_label = get_node("AmmoLabel")
	ammo_label.text = str(Global.ammo)
	Global.score = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("select_normal_bullet"):
		Global.ammo_type = Global.ammo_set[0]
		get_node("WeaponSwitchSound").playing = true
		get_node("AmmoSelection").texture = load("res://art_assets/normal_select.png")

	if Input.is_action_just_pressed("select_peg_bullet"):
			Global.ammo_type = Global.ammo_set[1]
			get_node("WeaponSwitchSound").playing = true
			get_node("AmmoSelection").texture = load("res://art_assets/peg_select.png")

	if Input.is_action_just_pressed("select_bubble_bullet"):
			Global.ammo_type = Global.ammo_set[2]
			get_node("WeaponSwitchSound").playing = true
			get_node("AmmoSelection").texture = load("res://art_assets/bubble_selectrion.png")

func _on_player_path_follow_ammo_down() -> void:
	ammo_label.text = str(Global.ammo)

func _on_earth_area_ammo_up() -> void:
	ammo_label.text = str(Global.ammo)

func _on_earth_area_ammo_down() -> void:
	ammo_label.text = str(Global.ammo)
