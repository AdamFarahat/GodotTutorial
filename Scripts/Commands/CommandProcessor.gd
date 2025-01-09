extends Timer

class_name CommandProcessor

signal BROADCAST_COMMAND(label)

var resumeWaiting:bool = true

func _ready():
	CommandDispatcher.PROCESS_COMMAND.connect(processCommand)
	CommandDispatcher.WAIT_FOR_COMMAND.connect(waitForCommand)
	CommandDispatcher.PAUSE_PROCESSING.connect(pauseProcessing)


func processCommand(command:Command):
	if(is_stopped()):
		return
	
	stop()
	
	command.COMMAND_PROCESSED.connect(onCommandProcessed)
	BROADCAST_COMMAND.emit(command.command_label)
	
	command.execute()
	
func waitForCommand():
	resumeWaiting = true
	start()
	CommandDispatcher.DISPLAY_COMMAND_PROMPT.emit()

func pauseProcessing():
	stop()
	resumeWaiting = false

func onCommandProcessed(_result):
	if(_result!=null):
		print(_result)
	
	if (resumeWaiting):
		waitForCommand()


func _on_timeout() -> void:
	processCommand(PassCommand.new())
