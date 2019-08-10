extends Node2D

var data = {}
var array = {}
var i = 1
var y = 1
var account = false

func _on_Button_button_down():
	account = false
	$HTTPRequest.fetched = false
#	$HTTPRequest.data = [$Save.data]
	$HTTPRequest.data = [$Password.get_text()]
	$HTTPRequest.myData = str($Username.get_text() + str($Password.get_text()))
	$HTTPRequest.set_generate_signature()
	$HTTPRequest.set_data()
	$HTTPRequest.request($HTTPRequest.url)
	$Label3.set_text("account created")
	pass # Replace with function body.

# + str($Password.get_text())
func _on_Button2_button_down():
	account = true
	$HTTPRequest.fetched = true
	$HTTPRequest.myData = str($Username.get_text() + str($Password.get_text()))
	$HTTPRequest.fetch_generate_signature()
	$HTTPRequest.fetch_data()
	$HTTPRequest.request($HTTPRequest.url)
#	print($HTTPRequest.json)
	pass # Replace with function body.


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	if str($HTTPRequest.fetch) == str([$Password.get_text()]):
		$Label3.set_text("login succesfull")
	elif account:
		$Label3.set_text("password doesen't match")
	pass # Replace with function body.
