extends Control

func _ready():
	
	pass # Replace with function body.

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var html = body.get_string_from_utf8()
	$RichTextLabel.text = html
	OS.set_window_title(innerHTML("title", html))
	pass # Replace with function body.

func _on_Button_button_down():
	$HTTPRequest.request($LineEdit.get_text())
	pass # Replace with function body.

func innerHTML(tag, html, default=""):
	var regex = RegEx.new()
	regex.compile("<" + tag + ">(.|\n)*?</" + tag + ">")
	var result = regex.search(html)
	if result:
		return result.get_string().replace("<" + tag + ">", '').replace("</" + tag + ">", '')
	return default
	pass