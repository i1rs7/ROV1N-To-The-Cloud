extends ColorRect

@onready var grid_container: GridContainer = $GridContainer
@onready var photo_1: TextureRect = $GridContainer/Photo1

func _ready():
	var tex = ImageTexture.new()
	tex.create_from_image(load("res://in_game_pics/1.png"))
	photo_1.texture = tex # Update the empty TextureRect

func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("debug")):
		get_tree().change_scene_to_file("res://scenes/main.tscn")
