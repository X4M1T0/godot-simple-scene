extends KinematicBody2D


# VÁRIAVEL DE PONTO CLICK
onready var target = position

func _input(event):
	if event.is_action_pressed("click"):
		target = get_global_mouse_position()
		
