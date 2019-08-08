extends Node2D

func _on_GameJoltAPI_api_session_opened(success):
	var data = {
		username =[ $Username.get_text()]
		,password = [$Password.get_text()]
	}
	$GameJoltAPI.set_data("myData", data)
	pass # Replace with function body.

func _on_Button_button_down():
	$GameJoltAPI.open_session()
	pass # Replace with function body.
