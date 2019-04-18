extends Node

var currentScene = null

func _ready():
	currentScene = get_tree().get_root().get_child(get_tree().get_root().get_child_count() -1 )

func setScene(scene):
	currentScene.queue_free()
	var ins = ResourceLoader.load(scene)
	currentScene = ins.instance()
	get_tree().get_root().add_child(currentScene)