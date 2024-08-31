extends PathFollow2D

var speed = 10
var bullet_scene = preload("res://bullet.tscn")
var bullet_instance
signal ammo_down

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("go_clockwise"):
		progress += speed
	elif Input.is_action_pressed("go_counter_clockwise"):
		progress += -speed
		
	if Input.is_action_just_pressed("fire_bullet") && Global.ammo > 0:
		Global.ammo -= 1
		bullet_instance = bullet_scene.instantiate()
		bullet_instance.global_position = position
		if Global.ammo_type == "normal":
			bullet_instance.get_node("BulletSprite").texture = load("res://art_assets/normal_bullet.png")
			bullet_instance.add_to_group("normal_bullet")
		else:
			bullet_instance.get_node("BulletSprite").texture = load("res://art_assets/peg_bullet.png")
			bullet_instance.add_to_group("peg_bullet")
		get_node("../").add_child(bullet_instance)
		get_node("BulletSound").playing = true
		ammo_down.emit()
		
	if Input.is_action_just_pressed("select_normal_bullet"):
		Global.ammo_type = Global.ammo_set[0]
		get_node("../../../WeaponSwitchSound").playing = true

	if Input.is_action_just_pressed("select_peg_bullet"):
		Global.ammo_type = Global.ammo_set[1]
		get_node("../../../WeaponSwitchSound").playing = true
