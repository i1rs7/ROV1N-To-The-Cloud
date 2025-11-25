extends Node3D

@onready var player_cam = $Camera3D
@onready var digicam_cam = $Camera/SubViewport/Camera3D
@onready var lens = $Camera/Marker3D

func _process(_delta: float) -> void:
	#digicam_cam.global_rotation = lens.global_rotation + Vector3(0, 0, 0)
	#digicam_cam.global_position = lens.global_position + Vector3(0, 180 ,0)
	pass

func _on_button_pressed() -> void:
	if player_cam.is_current():
		digicam_cam.make_current()
		$Button.text = "Change Cam to Player Cam"
	else:
		player_cam.make_current()
		$Button.text = "Change Cam to Digi Cam"
