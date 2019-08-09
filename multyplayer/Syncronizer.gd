extends HTTPRequest

var myData = "savefile"
var data = Vector2(0,0)
export var game_id = "377255"
export var key_private = "791eef1ab8afcd2c70248a8a6e4cbe4a"
var signature
var url

func _ready():
	seter()

func _process(delta):
	data = get_parent().get_parent().get_node("Player").get_position()
	
func seter():
	set_generate_signature()
	set_data()
	request(url)

func set_generate_signature():
	signature = ("http://gamejolt.com/api/game/v1/data-store/set/?key=" + myData + "&&data=" + str(data) + "&format=json&game_id=" +  game_id + key_private).md5_text()
#	print(signature)

func set_data():
	url = "http://gamejolt.com/api/game/v1/data-store/set/?key=" + myData + "&&data=" + str(data) + "&format=json&game_id=" +  game_id + "&signature=" + signature
	print(url)

func _on_Syncronizer_request_completed(result, response_code, headers, body):
	seter()
	pass # Replace with function body.
