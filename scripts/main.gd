extends Node2D

func _ready() -> void:
	var first_area = load("res://scenes/area_1.tscn")
	var instance = first_area.instantiate()
	add_child(instance)
