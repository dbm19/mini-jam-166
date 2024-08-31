extends PathFollow2D

var speed = 20
var bullet_scene = preload("res://blue_bullet.tscn")
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
	if Input.is_action_just_pressed("change_direction"):
		bullet_instance = bullet_scene.instantiate()
		bullet_instance.global_position = position
		get_node("../").add_child(bullet_instance)
		
		get_node("BulletSound").playing = true
