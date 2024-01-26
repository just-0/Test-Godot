extends Area2D

@onready var sprite = $Sprite2D


func _on_body_entered(body):
	if(body.get_name() == "Player"):
		$AudioStreamPlayer2D.playing = true
		
		body.addCoin()
		
		queue_free()
		pass # Replace with function body.
