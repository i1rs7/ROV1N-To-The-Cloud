extends ColorRect

@onready var grid_container: GridContainer = $GridContainer
@onready var photo_1: TextureRect = $GridContainer/Photo1
@onready var photo_2: TextureRect = $GridContainer/Photo2
@onready var photo_3: TextureRect = $GridContainer/Photo3

var photo_album : Array = [photo_1, photo_2, photo_3]

const PHOTO_FRAME = preload("uid://bf8e1x8j4k2h2")

func _ready():
	#for photo in Globals.photo_album:
	#for photo in photo_album:
	var image := Image.new()
	image.load("user://1.png")
	var tex := ImageTexture.new()
	tex = ImageTexture.create_from_image(image)
	photo_1.texture = tex
	#var tex = ImageTexture.create_from_image(load("res://archive/wakatime/godotwaka.png"))
	#var tex = ImageTexture.create_from_image(load("res://in_game_pics/1.png"))
		#Globals.photo_album[photo]
	 # Update the empty TextureRect

func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("debug")):
		get_tree().change_scene_to_file("res://scenes/main.tscn")
	#var tex = load("res://in_game_pics/1.png")
	#photo_1.texture = tex
