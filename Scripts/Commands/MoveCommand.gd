extends Command

class_name MoveCommand

var direction

func _init(dir):
	command_label = "Move"
	direction = dir

func execute():
	CommandDispatcher.PLAYER_MOVE.emit(direction)
	COMMAND_PROCESSED.emit(getCommand_Label())

func getDirectionString() -> String:
	return Map.Direction.keys()[direction]


func getCommand_Label():
	return "%s %s" % [command_label,getDirectionString()]
