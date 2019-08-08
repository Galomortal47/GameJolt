extends Node2D

var data = {}
var array = {}
var i = 1
var y = 0

func _on_Button_button_down():
	data = {
		Username = [$Username.get_text()]
#		,password = [$Password.get_text()]
	}
	array[i] = data
	i += 1
	$Save.data = array
	$Save.save()
	pass # Replace with function body.


func _on_Button2_button_down():
	$Save.loader()
	array = $Save.data
	y = array.size()
	while y > 0:
		print(array[str(y)].Username)
		if str(array[str(y)].Username) == $Username.get_text():
			print(array[y]).Username
		y -= 1
	pass # Replace with function body.
