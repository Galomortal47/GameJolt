extends KinematicBody2D

var motion = Vector2(0,0)
var speed = 50
var max_speed = 500
var drag = 0.75
var jump = 65
var air_drag = 0.9
var air_time = 0.125
var air_time_aux = air_time
var speed_air = 13
var gravity = 20
var speed_jump = 0.01

func _process(delta):
	if Input.is_action_pressed("ui_right"):
		if motion.x < max_speed:
			if floor_detection():
				motion.x += speed_air
			else:
				motion.x += speed
	elif Input.is_action_pressed("ui_left"):
		if motion.x > -max_speed:
			if floor_detection():
				motion.x -= speed
			else:
				motion.x -= speed_air
	else:
		if floor_detection():
			motion.x *= drag
		else:
			motion.x *= air_drag
	if Input.is_action_pressed("ui_accept"):
		if air_time > 0:
			if motion.x > 0:
				motion.y -= jump + (motion.x * speed_jump)
			else:
				motion.y -= jump + (-motion.x * speed_jump)
		air_time -= delta
	if floor_detection():
		air_time = air_time_aux
	else:
		motion.y += gravity
	motion = move_and_slide(motion)
#	pass

func floor_detection():
	if $floor_detect.is_colliding() or $floor_detect2.is_colliding() or $floor_detect3.is_colliding(): 
		return true