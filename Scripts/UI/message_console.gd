extends MarginContainer

@export var scrollContainer:ScrollContainer
@export var messages:VBoxContainer
@export var messageHistory := 10

var messageLinePrefab = preload("res://Scenes/UI/MessageLine.tscn")

func _ready():
	CommandDispatcher.DISPLAY_MESSAGE.connect(_onMessageReceived)
	CommandDispatcher.DISPLAY_COMMAND_PROMPT.connect(_displayCommandPrompt)
	CommandDispatcher.DISPLAY_CLEAR.connect(_clearWindow)

func _on_command_broadcast(label: Variant) -> void:
	displayCommand(label)

func _onMessageReceived(message):
	displayMessage(message)

func _displayCommandPrompt():
	messages.add_child(messageLinePrefab.instantiate())

func _clearWindow():
	for item in messages.get_children():
		messages.remove_child(item)
		item.queue_free()


func scrollToEnd():
	await scrollContainer.get_v_scroll_bar().changed
	
	if(messages.get_child_count() > messageHistory):
		messages.get_child(0).queue_free()
	
	scrollContainer.scroll_vertical = scrollContainer.get_v_scroll_bar().max_value


func displayMessage(message):
	var messageLine = messageLinePrefab.instantiate()
	
	messageLine.text = "%s\n" % message
	
	messages.add_child(messageLine)
	
	scrollToEnd()

func displayCommand(message):
	var currentMessageLine:RichTextLabel
	
	if(messages.get_child_count() == 0):
		_displayCommandPrompt()
	
	currentMessageLine = messages.get_children()[messages.get_children().size() - 1]
	
	currentMessageLine.text = currentMessageLine.text.insert(currentMessageLine.text.length() - 2, message)
	scrollToEnd()
