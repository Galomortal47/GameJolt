extends KinematicBody2D

var motion = Vector2(0,0)
var speed = 50
var max_speed = 500
var drag = 0.85
var jump = 75
var air_time = 0.125
var air_time_aux = air_time
var gravity = 25

func _process(delta):
	if Input.is_action_pressed("ui_right"):
		if motion.x < max_speed:
			motion.x += speed
	elif Input.is_action_pressed("ui_left"):
		if motion.x > -max_speed:
			motion.x -= speed
	else:
		motion.x *= drag
	if Input.is_action_pressed("ui_accept"):
		if air_time > 0:
			motion.y -= jump
		air_time -= delta
	if $floor_detect.is_colliding():
		air_time = air_time_aux
	else:
		motion.y += gravity	
	motion = move_and_slide(motion)
#	pass