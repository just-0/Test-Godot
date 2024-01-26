extends CharacterBody2D


const SPEED = 50.0
const JUMP_VELOCITY = -200.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var movingLeft = false
func _ready():
	print("SAPOOO")
	velocity.x = 0
	velocity.y = 0
	$AnimationPlayer.play("Walk")

func _physics_process(delta):
	move_character(delta)
	turn()
	
func move_character(delta):
	if(movingLeft):
		velocity.x = -SPEED 
	else:
		velocity.x = SPEED
	move_and_slide()
	
func _on_area_2d_body_entered(body):
	
	if(body.get_name() == "Player"):
		body.touchSpikes()

func turn():
	if(not $RayCast2D.is_colliding()):
		movingLeft = !movingLeft
		scale.x = -scale.x
