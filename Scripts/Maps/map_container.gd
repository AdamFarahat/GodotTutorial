extends Node

@export var entities:Node2D

var map

func _ready():
	CommandDispatcher.LOAD_MAP.connect(LoadMap)

func LoadMap(newMapPath, spawnpoint, facing):
	var newmap:Map
	
	CommandDispatcher.PAUSE_PROCESSING.emit()
	
	if(map != null):
		map.queue_free()
	
	map = load(newMapPath).instantiate()
	
	add_child(map)
	
	entities.add_child(map.spawnPlayerAtPosition(spawnpoint,facing))
	
	GameManager.currentMapPath = newMapPath
	
	CommandDispatcher.WAIT_FOR_COMMAND.emit()

func _unhandled_key_input(event):
		var direction
		
		if(Input.is_action_pressed("ui_right")):
			direction = Map.Direction.East
			
		if(Input.is_action_pressed("ui_left")):
			direction = Map.Direction.West
		
		if(Input.is_action_pressed("ui_up")):
			direction = Map.Direction.North
		
		if(Input.is_action_pressed("ui_down")):
			direction = Map.Direction.South
		
		if(direction != null):
			CommandDispatcher.PROCESS_COMMAND.emit(MoveCommand.new(direction))
