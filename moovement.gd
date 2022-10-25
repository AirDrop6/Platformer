extends KinematicBody2D

var SPEED = 25
var JUMP = 300
var GRAVITY = 600
var countJump = 0

var vel = Vector2()

func _physics_process(delta):
	
	vel.y += GRAVITY * delta
	
	if Input.is_action_pressed("left"):
		vel.x -= SPEED 
	elif Input.is_action_pressed("right"):
		vel.x += SPEED
	
	
	if Input.is_action_just_pressed("up"):
		vel.y -= JUMP
		countJump += 1
		if countJump >= 2:
			vel.y += JUMP
			
	if is_on_floor():
			countJump = 0
	
	vel = move_and_slide(vel, Vector2.UP)
	
