extends Node3D

@onready var tree_1: PackedScene = preload("res://pine_3.tscn")
@onready var tree_2: PackedScene = preload("res://pine_4.tscn")
@onready var tree_3: PackedScene = preload("res://pine_5.tscn")
@onready var tree_4: PackedScene = preload("res://commontree_4.tscn")
@onready var tree_5: PackedScene = preload("res://commontree_5.tscn")

@export var tree_scenes: Array[PackedScene] = []
@export var number_of_trees: int = 200
@export var area_size: Vector3 = Vector3(100, 0, 100)
@export var forbidden_x_min: float = -9.0
@export var forbidden_x_max: float = 5.8
@export var y_offset: float = 0.0

@export var min_distance: float = 5.0       # minimum spacing between trees
@export var max_attempts: int = 15          # attempts to find a non-overlapping spot
@export var min_scale: float = 0.8          # random scale min
@export var max_scale: float = 2.5          # random scale max

var placed_positions: Array[Vector3] = []


func _ready():
	tree_scenes = [tree_1, tree_2, tree_3, tree_4, tree_5]
	spawn_trees()


func spawn_trees():
	if tree_scenes.is_empty():
		push_warning("No tree scenes assigned!")
		return

	for i in range(number_of_trees):
		var scene : PackedScene = tree_scenes.pick_random()
		var tree: Node3D = scene.instantiate()

		var point: Vector3
		while true:
			var x = randf_range(-area_size.x / 2, area_size.x / 2)
			var z = randf_range(-area_size.z / 2, area_size.z / 2)

			if x < forbidden_x_min or x > forbidden_x_max:
				point = Vector3(x, y_offset, z)
				break

		tree.position = point + global_transform.origin
		tree.rotation.y = randf() * TAU
		tree.scale *= randf_range(0.8, 1.3)
		add_child(tree)


func _is_far_enough(candidate: Vector3) -> bool:
	for pos in placed_positions:
		if pos.distance_to(candidate) < min_distance:
			return false
	return true
