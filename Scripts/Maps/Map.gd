extends TileMap


class_name Map


enum Direction{North,South,East,West}

@export var defaultPlayerStartPosition:Vector2i

@export var stepIncrement:float = 1

var player

func _ready():
	CommandDispatcher.PLAYER_MOVE.connect(onPlayerMove)

func spawnPlayerAtPosition(position, facing):
	var spawnPosition:Vector2i
	if(position == null):
		spawnPosition = defaultPlayerStartPosition
	else:
		spawnPosition = position
	
	player.position = Vector2(spawnPosition.x * 16,spawnPosition.y * 16)

func onPlayerMove(direction):
	var newPos = Vector2(player.position)
	var moveIncrement = tile_set.tile_size.x * stepIncrement
	
	match(direction):
		Direction.North:
			newPos.y += moveIncrement
		Direction.South:
			newPos.y -= moveIncrement
		Direction.West:
			newPos.x -= moveIncrement
		Direction.East:
			newPos.x += moveIncrement
	
	if(playerCanMoveTo(newPos)):
		player.position = newPos
		player.updateAnimation(direction)

func playerCanMoveTo(position) -> bool:
	return false
