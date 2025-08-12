extends CharacterBody2D

class_name Player

@onready var _animated_sprite = $AnimatedSprite2D

@export var walk_speed: float = 128

var animation_direction_dict = {
	Vector2(1,0): "moving_right",
	Vector2(-1,0): "moving_left",
	Vector2(0,1): "moving_down",
	Vector2(0,-1): "moving_up",
}

func _physics_process(_delta: float) -> void:
	var input_vector = Input.get_vector("left", "right", "up", "down")
	velocity = input_vector * walk_speed
	handle_animation()
	move_and_slide()

func handle_animation() -> void:
	var left_active = Input.is_action_pressed("left")
	var right_active = Input.is_action_pressed("right")
	var down_active = Input.is_action_pressed("down")
	var up_active = Input.is_action_pressed("up")
	var movement_input_active = left_active or right_active or down_active or up_active
	
	if Input.is_action_just_pressed("left") or left_active and not (right_active or down_active or up_active):
		_animated_sprite.play("moving_left")
	
	elif Input.is_action_just_pressed("right") or right_active and not (left_active or down_active or up_active):
		_animated_sprite.play("moving_right")
	
	elif Input.is_action_just_pressed("down") or down_active and not (right_active or left_active or up_active):
		_animated_sprite.play("moving_down")
	
	elif Input.is_action_just_pressed("up") or up_active and not (right_active or down_active or left_active):
		_animated_sprite.play("moving_up")
	
	elif Input.is_action_just_released("left") and not movement_input_active:
		_animated_sprite.play("static_left")
	
	elif Input.is_action_just_released("right") and not movement_input_active:
		_animated_sprite.play("static_right")
	
	elif Input.is_action_just_released("down") and not movement_input_active:
		_animated_sprite.play("static_down")
	
	elif Input.is_action_just_released("up") and not movement_input_active:
		_animated_sprite.play("static_up")
