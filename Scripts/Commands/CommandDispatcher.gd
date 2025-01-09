extends Node

#Command Processor Signals
signal PROCESS_COMMAND(command)
signal WAIT_FOR_COMMAND
signal PAUSE_PROCESSING

#Game Signals
signal PLAYER_MOVE(direction)

#Message Console Signals
signal DISPLAY_MESSAGE(message)
signal DISPLAY_COMMAND_PROMPT
signal DISPLAY_CLEAR

signal LOAD_MAP(currentMap, newMapPath, spawnpoint, facing)
