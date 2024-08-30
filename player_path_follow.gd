extends PathFollow2D

var speed = 10
var bullet_scene = preload("res://blue_bullet.tscn")
var bullet_instance

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress += speed
	
	if Input.is_action_just_pressed("change_direction"):
		speed = speed * -1
		bullet_instance = bullet_scene.instantiate()
		bullet_instance.global_position = position
		get_node("../").add_child(bullet_instance)
