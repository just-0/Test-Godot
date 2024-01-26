extends Area2D

#signal touchSpike

func _ready():
	pass

func _on_body_entered(body):
	if(body.get_name() == "Player"):
		body.touchSpikes()
		#emit_signal("touchSpike")
		print("SEÑAL EMITIDA")

