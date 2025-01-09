extends Control


func _on_new_game_pressed() -> void:
	GameManager.startNewGame()
	Loader.load_Scene(self,"res://Scenes/UI/game_scene.tscn")
