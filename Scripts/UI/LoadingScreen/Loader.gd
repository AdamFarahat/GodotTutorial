extends Node

signal LOADING_PROGRESS_UPDATED(percentage)

@export var loadingScene = preload("res://Scenes/UI/loading_screen.tscn").instantiate()

var scenePath

func load_Scene (callingScene,path) -> void:
	scenePath = path
	
	get_tree().root.add_child(loadingScene)
	
	ResourceLoader.load_threaded_request(scenePath)
	
	callingScene.queue_free()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(scenePath!=null):	
		var progress = []
		var loaderStatus = ResourceLoader.load_threaded_get_status(scenePath, progress)
	
		if(loaderStatus == ResourceLoader.THREAD_LOAD_LOADED):
			var loadedScene = ResourceLoader.load_threaded_get(scenePath).instantiate()
		
			get_tree().root.remove_child(loadingScene)
			get_tree().root.add_child(loadedScene)
		
			scenePath = null
