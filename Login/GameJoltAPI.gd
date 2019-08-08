extends HTTPRequest
var myData = "savefile"
var data = 3500
export var game_id = "377255"
export var key_private = "791eef1ab8afcd2c70248a8a6e4cbe4a"
var signature
var url

func _ready():
#	set_generate_signature()
#	set_data()
#	request(url)
#	get_generate_signature()
#	get_data()
	fetch_generate_signature()
	fetch_data()
	request(url)
#	request("http://gamejolt.com/api/game/v1/data-store/set/?key=myData&data=100&format=json&game_id=377255&signature=6187cf6a77eaf8316643b3a720306658")

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
	var json = body.get_string_from_utf8()
	print(body.get_string_from_utf8())
	pass # Replace with function body.