extends KinematicBody2D

export (int) var speed = 600

onready var target = position
var velocity = Vector2()


func _input(event):
	if Input.is_action_pressed("click"):
		$AnimatedSprite.play("Shine")
		target = get_global_mouse_position()
		

func _physics_process(delta):
	velocity = position.direction_to(target) * speed
	
	if position.distance_to(target) > 5:
		velocity = move_and_slide(velocity)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
