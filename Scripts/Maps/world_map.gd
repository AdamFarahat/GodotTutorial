extends Map2D

class_name WorldMap

func playerCanMoveTo(position:Vector2) -> bool:
	var tilesize = tile_set.tile_size.x
	var cast_cell_1
	var cast_cell_2
	
	player.updateRayCasts(position)
	
	cast_cell_1 = local_to_map(position + player.raycast_1.position)
	cast_cell_2 = local_to_map(position + player.raycast_2.position)
	
	if(getTerrainDataForTile(0,TerrainDataTypes.TerrainType,cast_cell_1.x,cast_cell_1.y) != "Water"and
		getTerrainDataForTile(0,TerrainDataTypes.TerrainType,cast_cell_2.x,cast_cell_2.y) != "Water"):
		return true
	else:
		CommandDispatcher.DISPLAY_MESSAGE.emit("Your path is blocked!")
		return false
