extends Command

class_name PassCommand

func _init():
	command_label = "Pass"

func execute():
	print("Player passed.")
	COMMAND_PROCESSED.emit(command_label)
