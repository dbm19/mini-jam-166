extends Control

var new_game_button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_game_button = get_node("VBoxContainer/NewGameButton")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_new_game_button_button_down() -> void:
	new_game_button.icon = load("res://art_assets/new_game_button_pressed.png")


func _on_new_game_button_button_up() -> void:
	new_game_button.icon = load("res://art_assets/new_game_button.png")

func _on_new_game_button_pressed() -> void:
	get_tree().change_scene_to_file("res://game.tscn")
	Global.ammo = 5 

func _on_tutorial_button_pressed() -> void:
	get_tree().change_scene_to_file("res://tutorial_screen.tscn")
