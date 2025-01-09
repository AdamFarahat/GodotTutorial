extends Node

class_name GameScreen

@export var map:Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	CommandDispatcher.LOAD_MAP.emit(null, GameManager.defaultMapPath, null, Map.Direction.North)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pass_button_pressed() -> void:
	CommandDispatcher.PROCESS_COMMAND.emit(PassCommand.new())
