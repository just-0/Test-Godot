extends CanvasLayer

var numMonedas = 0

func _ready():
	#print("-> xddd -> " + str()
	$ContadorMonedasLabel.text = str(numMonedas)
	
func handleCoinCollected():
	print("Moneda Recogida")
	numMonedas += 1
	$ContadorMonedasLabel.text = str(numMonedas)
		
	if(numMonedas == 2 && get_tree().current_scene.name == "Mundo" ):
		print("UWUW")
		get_tree().change_scene_to_file("res://Scenes/mundo2.tscn")
		
	elif(numMonedas == 3 && get_tree().current_scene.name == "Mundo2" ):
		print("UWUW")
		get_tree().change_scene_to_file("res://Scenes/mundo3.tscn")
	elif(numMonedas == 4 && get_tree().current_scene.name == "Mundo3" ):
		get_tree().change_scene_to_file("res://Scenes/mundo.tscn")
	

