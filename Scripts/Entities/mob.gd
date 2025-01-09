extends Node2D

class_name Mob

@export var collisionRay_1:RayCast2D
@export var collisionRay_2:RayCast2D

@export var animator:AnimatedSprite2D

func updateRaycasts(destination):
	var direction = destination - position
	
	if(direction.x != 0):
		collisionRay_1.position = Vector2(8,1)
		collisionRay_2.position = Vector2(8,15)
	
	if(direction.y != 0):
		collisionRay_1.position = Vector2(1,8)
		collisionRay_2.position = Vector2(15,8)
	
	if(direction.x < 0):
		collisionRay_1.position.x -= 1
		collisionRay_2.position.x -= 1
	
	if(direction.y < 0):
		collisionRay_1.position.y -= 1
		collisionRay_2.position.y -= 1
	
	collisionRay_1.target_position = Vector2(direction)
	collisionRay_1.force_raycast_update()
	
	collisionRay_2.target_position = Vector2(direction)
	collisionRay_2.force_raycast_update()
	

func updateAnimation(direction):
	var sequence
	
	match(direction):
		Map.Direction.East:
			sequence = "Walk Right"
		Map.Direction.West:
			sequence = "Walk Left"
		Map.Direction.North:
			sequence = "Walk Up"
		Map.Direction.South:
			sequence = "Walk Down"
	
	if(animator.animation != sequence):
		animator.animation = sequence
		animator.frame = 0
	else:
		if(animator.frame == animator.sprite_frames.get_frame_count(animator.animation)-1):
			animator.frame = 0
			
		else:
			animator.frame += 1
