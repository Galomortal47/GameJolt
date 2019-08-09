extends Node2D

var data = {}
var array = {}
var i = 1
var y = 1

func _on_Button_button_down():
	$HTTPRequest.data = [$Username.get_text()]
	$HTTPRequest.set_generate_signature()
	$HTTPRequest.set_data()
	var url = $HTTPRequest.url
	$HTTPRequest.request(url)
	pass # Replace with function body.


func _on_Button2_button_down():
	$HTTPRequest.fetch_generate_signature()
	$HTTPRequest.fetch_data()
	var url = $HTTPRequest.url
	$HTTPRequest.request(url)
#	print($HTTPRequest.json)
	if str($HTTPRequest.json.response.data) == str([$Username.get_text()]):
		print("succes")
	pass # Replace with function body.
