extends PathFollow2D

var speed = 15
var bullet_scene = preload("res://bullet.tscn")
var bullet_instance

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("go_clockwise"):
		progress += speed
	elif Input.is_action_pressed("go_counter_clockwise"):
		progress += -speed
		
	if Input.is_action_just_pressed("fire_bullet") && Global.hit_points > 0:
		bullet_instance = bullet_scene.instantiate()
		bullet_instance.global_position = position
		if Global.ammo_type == "normal":
			bullet_instance.get_node("BulletSprite").texture = load("res://art_assets/normal_bullet.png")
			bullet_instance.add_to_group("normal_bullet")
		elif Global.ammo_type == "peg":
			bullet_instance.get_node("BulletSprite").texture = load("res://art_assets/peg_bullet.png")
			bullet_instance.add_to_group("peg_bullet")
		else:
			bullet_instance.get_node("BulletSprite").texture = load("res://art_assets/bubble_bullet.png")
			bullet_instance.add_to_group("bubble_bullet")
		get_node("../").add_child(bullet_instance)
		get_node("BulletSound").playing = true		
