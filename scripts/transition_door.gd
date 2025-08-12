extends Node2D

@export var next_area: PackedScene
@onready var scene_transition = $SceneTransition


func _on_scene_transition_fade_in_animation_finished() -> void:
	transition_to_next_area()

func transition_to_next_area() -> void:
	get_tree().change_scene_to_packed(next_area)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		scene_transition.fade_in()
