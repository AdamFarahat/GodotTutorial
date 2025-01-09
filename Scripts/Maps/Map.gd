extends TileMap


class_name Map


enum Direction{North,South,East,West}

@export var defaultPlayerStartPosition:Vector2i

var player

func spawnPlayerAtPosition(position, facing):
	var spawnPosition:Vector2i
	if(position == null):
		spawnPosition = defaultPlayerStartPosition
	else:
		spawnPosition = position
	
	player.position = Vector2(spawnPosition.x * 16,spawnPosition.y * 16)
