extends Control

@export var loadingBar:TextureProgressBar
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Loader.LOADING_PROGRESS_UPDATED.connect(_on_progress_updated)
	pass # Replace with function body.

func _on_progress_updated(percentage):
	loadingBar.value = percentage * 100


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
