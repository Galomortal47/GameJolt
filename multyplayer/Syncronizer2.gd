extends HTTPRequest

var myData = "savefile"
var data = Vector2(0,0)
export var game_id = "377255"
export var key_private = "791eef1ab8afcd2c70248a8a6e4cbe4a"
var signature
var url

func _ready():
#	fetch()
	pass

func fetch():
	fetch_generate_signature()
	fetch_data()
	request(url)
#	pass

func fetch_generate_signature():
	signature = ("http://gamejolt.com/api/game/v1/data-store/?format=json&game_id=" +  game_id + "&key=" + myData + key_private).md5_text()
#	print(signature)
func fetch_data():
	url = "http://gamejolt.com/api/game/v1/data-store/?format=json&game_id=" +  game_id + "&key=" + myData + "&signature=" + signature
	print(url)

func _on_Syncronizer_request_completed(result, response_code, headers, body):
	var json = parse_json(body.get_string_from_ascii())
#	print(body.get_string_from_utf8())
	print(json.response.data)
	get_parent().get_parent().get_node("Player").set_position(Vector2(json.response.data[0],json.response.data[1]))
	fetch()
	pass # Replace with function body.
