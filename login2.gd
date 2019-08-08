extends Node2D

var data = {}
var array = {}
var i = 1
var y = 1

func _on_Button_button_down():
	$Save.loader()
	array = $Save.data
	i = data.size()
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
	y = 1
	while(y <= array.size()): 
#		print(array[str(y)].Username)
		if array[str(y)].Username == [$Username.get_text()]:
			print(array[str(y)].Username)
		y += 1
	pass # Replace with function body.
