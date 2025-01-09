class_name Command

signal COMMAND_PROCESSED(label)

var command_label

func execute():
	COMMAND_PROCESSED.emit(command_label)
