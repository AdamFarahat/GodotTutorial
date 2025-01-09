extends Map

class_name Map2D

enum TerrainDataTypes {TerrainType}

func _ready():
	print(getTerrainDataForTile(0,0,0, TerrainDataTypes.TerrainType))

func getTerrainDataForTile(layer,data,x,y):
	var tile:TileData = get_cell_tile_data(layer,Vector2i(x,y))
	
	if(tile!=null):
		return tile.get_custom_data(TerrainDataTypes.keys()[data])
	else:
		return null


func spawnPlayerAtPosition(position, facing):
	player = load("res://Scenes/Game/Maps/Entities/player.tscn").instantiate()
	
	super.spawnPlayerAtPosition(position, facing)
	
	return player
