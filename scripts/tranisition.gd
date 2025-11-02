extends Node2D

@onready var transition_color: Node = $CanvasLayer/TransitionColor
@onready var animation_player: Node = $AnimationPlayer

const FADE_IN_ANIMATION: StringName = "fade_in"
const FADE_OUT_ANIMATION: StringName = "fade_out"
const MIN_ALPHA: int = 0
const MAX_ALPHA: int = 255

signal fade_in_animation_finished

func fade_in() -> void:
	transition_color.color.a = MIN_ALPHA
	animation_player.play(FADE_IN_ANIMATION)

func fade_out() -> void:
	transition_color.color.a = MAX_ALPHA
	animation_player.play(FADE_OUT_ANIMATION)

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == FADE_IN_ANIMATION:
		fade_in_animation_finished.emit()
