extends Node2D

var hit_points_label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hit_points_label = get_node("HitPointsLabel")
	hit_points_label.text = str(Global.hit_points)
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

func _on_earth_area_hit_points_down() -> void:
	hit_points_label.text = str(Global.hit_points)
