extends Control


var rng = RandomNumberGenerator.new()
var quotes = [
	"Blue Eggs and Ham",
	"Bluesleeves",
	"Blue Day",
	"Anne of Blue Gables",
	"Blue Lantern",
	"Blue Tea",
	"The Blue Mile",
	"Blueland",
	"Bluewich",
	"Bluehouse Effect",
	"Blue Bay Packers",
]
var score 
var blue_quote
var back_button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.explosion_sound.playing = true
	score = get_node("ScoreScreenBackground/VBoxContainer/ScoreCard/Score")
	blue_quote = get_node("ScoreScreenBackground/VBoxContainer/ScoreCard/BlueQuote")
	
	score.text = str(Global.score)
	blue_quote.text = quotes[rng.randi_range(0, 10)]
	back_button = get_node("BackButton")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_back_button_pressed() -> void:
	Global.menu_sound.playing = true
	back_button.icon = load("res://art_assets/back_button_pressed.png")
	get_tree().change_scene_to_file("res://main_menu.tscn")

func _on_back_button_mouse_entered() -> void:
	back_button.icon = load("res://art_assets/back_button_hovered.png")

func _on_back_button_mouse_exited() -> void:
	back_button.icon = load("res://art_assets/back_button.png")
	
func _on_back_button_button_down() -> void:
	back_button.icon = load("res://art_assets/back_button_pressed.png")
