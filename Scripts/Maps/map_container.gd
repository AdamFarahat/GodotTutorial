extends Node

@export var entities:Node

func _ready():
	CommandDispatcher.LOAD_MAP.connect(LoadMap)

func LoadMap(currentMap, newMapPath, spawnpoint, facing):
	var newMap:Map
	
	CommandDispatcher.PAUSE_PROCESSING.emit()
	
	newMap = load(newMapPath).instantiate()
	
	if(currentMap != null):
		currentMap.queue_free()
	
	add_child(newMap)
	
	entities.add_child(newMap.spawnPlayerAtPosition(spawnpoint,facing))
	
	CommandDispatcher.WAIT_FOR_COMMAND.emit()
