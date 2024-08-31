extends Node
var ammo
var ammo_set = ["normal", "peg", "bubble"]
var ammo_type


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ammo = 5
	ammo_type = ammo_set[0]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
