extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()

func get_input():
	$Sprite.rotation_degrees = 90
	look_at(get_global_mouse_position())


func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
