extends Node3D

@onready var anim_tree = $AnimationTree
@export var blend_speed = 15

enum {IDLE, RUN, JUMP}
var curAnim = IDLE
var run_val = 0
var jump_val = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	handle_animations(delta)
	curAnim = RUN

func update_tree():
	anim_tree["parameters/Run/blend_amount"] = run_val
	anim_tree["parameters/Jump/blend_amount"] = jump_val
	
func handle_animations(delta):
	match curAnim:
		IDLE:
			run_val = lerpf(run_val, 0, blend_speed*delta)
			jump_val = lerpf(jump_val, 0, blend_speed*delta)
		RUN:
			run_val = lerpf(run_val, 1, blend_speed*delta)
			jump_val = lerpf(jump_val, 0, blend_speed*delta)
		JUMP:
			run_val = lerpf(run_val, 0, blend_speed*delta)
			jump_val = lerpf(jump_val, 1, blend_speed*delta)
