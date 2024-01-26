extends CharacterBody2D



const SPEED = 100.0
const JUMP_VELOCITY = -200.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var sprite = $Sprite2D
@onready var animationPlayer = $AnimationPlayer
func _ready():
	pass
		
	
	#print("->" + get_tree().root.get_child(0).get_child(3).name)


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	# Get the input direction and ha
	#ndle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		animationPlayer.play("Walk") 
		if(direction == 1):
			sprite.flip_h = true	
		else:
			sprite.flip_h = false
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()


func addCoin():	
	var canvasLayer = get_tree().root.get_child(0).get_child(3)
	canvasLayer.handleCoinCollected()

func touchSpikes():
	get_tree().reload_current_scene()
	print("LIKE")
	
