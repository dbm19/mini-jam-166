extends Area2D

var center_of_map
var speed = 70
var direction
var green_alien_sprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(self)
	green_alien_sprite = get_node("GreenAlienSprite")
	center_of_map = Vector2(573, 323)
	direction = (center_of_map - position).normalized()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position += direction * speed * delta

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("normal_bullet") && is_in_group("normal_alien"):
		green_alien_sprite.texture = load("res://art_assets/blue_alien.png")
		remove_from_group("normal_alien")
		remove_from_group("green_alien")
		add_to_group("blue_alien")
		area.queue_free()
	elif area.is_in_group("peg_bullet") && is_in_group("peg_alien"):
		green_alien_sprite.texture = load("res://art_assets/blue_alien.png")
		remove_from_group("peg_alien")
		remove_from_group("green_alien")
		add_to_group("blue_alien")
		print(get_groups())
		area.queue_free()
