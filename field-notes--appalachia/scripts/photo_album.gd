extends ColorRect

@onready var grid_container: GridContainer = $GridContainer
@onready var photo_1: TextureRect = $GridContainer/PhotoFrame/TextureRect
@onready var photo_2: TextureRect = $GridContainer/PhotoFrame2/TextureRect
@onready var photo_3: TextureRect = $GridContainer/PhotoFrame3/TextureRect
@onready var photo_4: TextureRect = $GridContainer/PhotoFrame4/TextureRect
@onready var photo_5: TextureRect = $GridContainer/PhotoFrame5/TextureRect
@onready var photo_6: TextureRect = $GridContainer/PhotoFrame6/TextureRect

var idx = 0
var photo_for_texture_change

func _ready():
	var frames_in_cont = grid_container.get_children()

	for photo in Globals.photo_album:
		var image := Image.new()
		var photo_path = Globals.photo_album[idx]
		image.load(str(photo_path))
		var tex := ImageTexture.new()
		tex = ImageTexture.create_from_image(image)
		photo_for_texture_change = frames_in_cont[idx]
		var texture_rect = photo_for_texture_change.get_child(1)
		texture_rect.texture = tex
		idx += 1 
		print('success ' + str(idx))


func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("debug")):
		get_tree().change_scene_to_file("res://scenes/main.tscn")
	#var tex = load("res://in_game_pics/1.png")
	#photo_1.texture = tex
