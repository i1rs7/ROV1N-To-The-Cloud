extends Node3D

@onready var player_cam = $Camera3D
@onready var digicam_cam = $Camera/SubViewport/Camera3D



func _on_button_pressed() -> void:
	if player_cam.is_current():
		digicam_cam.make_current()
		$Button.text = "Change Cam to Player Cam"
	elif digicam_cam.is_current():
		player_cam.make_current()
		$Button.text = "Change Cam to Digi Cam"
