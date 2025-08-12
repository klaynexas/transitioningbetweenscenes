extends Node2D

@onready var scene_transition = $SceneTransition

func _ready() -> void:
	scene_transition.fade_out()
	
