extends KinematicBody2D

# VARIÁVEIS DE MOVIMENTAÇÃO
export (int) var speed = 200
export (int) var jumpForce = 400

var velocity = Vector2.ZERO

var timerDash = false


# VARIÁVEL DE ANIMAÇÃO
onready var animator = $AnimatedSprite


# VARIÁVEL DE CLICK
onready var target = position


# WALK FUNCTION
func walk():
	velocity = Vector2()
	
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		animator.play("Walk")
	elif Input.is_action_pressed("ui_down"):
		velocity.y += 1
		animator.play("Walk")
	elif Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		animator.play("Walk")
		animator.flip_h = true
	elif Input.is_action_pressed("ui_right"):
		velocity.x += 1
		animator.play("Walk")
		animator.flip_h = false
	else: 
		animator.play("Idle")
		
	velocity = velocity.normalized() * speed
	
	

# FUNÇÃO DE AÇÃO COM MOUSE
func dash():
	if Input.is_action_pressed("dash") && timerDash == false:
		timerDash = true
		target = get_global_mouse_position()
		velocity = position.direction_to(target) * (speed * 4)
		animator.play("Hit")
	elif timerDash == true:
		for i in range(0, 20, 1):
			print(timerDash)
			velocity = move_and_slide(velocity)
			
		timerDash = false
			
	else:
		velocity = move_and_slide(velocity)
		
func _physics_process(delta):
	walk()
	dash()
	print(timerDash)
	
	
	if position.distance_to(target) > 5:
		velocity = move_and_slide(velocity)


