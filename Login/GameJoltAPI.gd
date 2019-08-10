extends HTTPRequest
var myData = "savefile"
var data = 3500
export var game_id = "377255"
export var key_private = "791eef1ab8afcd2c70248a8a6e4cbe4a"
var signature
var url
var json
var fetch
var fetched = false

func set_generate_signature():
	signature = ("http://gamejolt.com/api/game/v1/data-store/set/?key=" + myData + "&&data=" + str(data) + "&format=json&game_id=" +  game_id + key_private).md5_text()
#	print(signature)
	
func get_generate_signature():
	signature = ("http://gamejolt.com/api/game/v1/data-store/get-keys/?key="+ myData + "&format=json&game_id=" +  game_id + key_private).md5_text()
#	print(signature)

func fetch_generate_signature():
	signature = ("http://gamejolt.com/api/game/v1/data-store/?format=json&game_id=" +  game_id + "&key=" + myData + key_private).md5_text()
#	print(signature)

func set_data():
	url = "http://gamejolt.com/api/game/v1/data-store/set/?key=" + myData + "&&data=" + str(data) + "&format=json&game_id=" +  game_id + "&signature=" + signature
	print(url)

func get_data():
	url = "http://gamejolt.com/api/game/v1/data-store/get-keys/?key="+ myData + "&format=json&game_id=" +  game_id + "&signature=" + signature
	print(url)
	
func fetch_data():
	url = "http://gamejolt.com/api/game/v1/data-store/?format=json&game_id=" +  game_id + "&key=" + myData + "&signature=" + signature
	print(url)

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	json  = parse_json(body.get_string_from_ascii())
	print(json)
	if fetched:
		if not json.response.success == "false":
			fetch = json.response.data
#	print(json)
	pass # Replace with function body.