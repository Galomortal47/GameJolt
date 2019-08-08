extends HTTPRequest
var myData = "key"
var data = 150
export var game_id = "377255"
export var key_private = "791eef1ab8afcd2c70248a8a6e4cbe4a"
var signature
var url

func _ready():
	generate_signature()
	set_data()
	request(url)
#	request("http://gamejolt.com/api/game/v1/data-store/set/?key=myData&data=100&format=json&game_id=377255&signature=6187cf6a77eaf8316643b3a720306658")

func generate_signature():
	signature = ("http://gamejolt.com/api/game/v1/data-store/set/?key=" + myData + "&&data=" + str(data) + "&format=json&game_id=" +  game_id + key_private).md5_text()
	print(signature)

func set_data():
	url = "http://gamejolt.com/api/game/v1/data-store/set/?key=" + myData + "&&data=" + str(data) + "&format=json&game_id=" +  game_id + "&signature=" + signature
	print(url)