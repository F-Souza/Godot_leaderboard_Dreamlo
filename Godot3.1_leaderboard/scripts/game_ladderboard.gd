extends Node2D

var score_text = ""

func _ready():
	add_Score()
	pass

func add_Score():
	$HTTP_add.request("http://dreamlo.com/lb/2JMMzw41REy3gVqmnm8TnQUWCb_O8wxU-H2Qs9B_tleA/add/"+game.player_name+"/"+str(game.player_pont))

func get_score():
	$HTTP_get.request("http://dreamlo.com/lb/5cb8af3b3eba5e041c18eddf/json")

func _on_HTTP_add_request_completed(result, response_code, headers, body):
	get_score()

func _on_HTTP_get_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	var dict = json.result
	dict = dict["dreamlo"]
	dict = dict["leaderboard"]
	dict = dict["entry"]
	var size = len(dict)
	for i in range(size):
		var page = dict[i]
		score_text += "Player: "+page["name"] + " Score: " + str(page["score"]) + "\n"
	$score.text = score_text