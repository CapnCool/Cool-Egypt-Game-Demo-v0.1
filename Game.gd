extends Control

var rng = RandomNumberGenerator.new()

onready var PlayerHP = 21
onready var BadGuyHP = 14
onready var PlayerShield = 0

onready var ColorCards = 8

onready var Card1Type = 1 # 1 = Hearts
onready var Card2Type = 2 # 2 = Shields
onready var Card3Type = 3 # 3 = Skulls

onready var Card1Value = 2
onready var Card2Value = 4
onready var Card3Value = 3

const paths = ['red', 'blue', 'black']

#func _process(_delta):card.set_texture(load(str()))
#	pass

func _on_Card1_pressed() -> void:
	if Card1Type == 1:
		BadGuyHP -= Card1Value
		ColorCards -= 1
	elif Card1Type == 2:
		PlayerShield += Card1Value
		ColorCards -= 1
	else:
		if Card1Value < PlayerShield:
			PlayerShield -= Card1Value
		elif Card1Value >= PlayerShield:
			PlayerHP -= Card1Value - PlayerShield
			PlayerShield = 0
		else:
			PlayerHP -= Card1Value
			
	$Label2.text = str("HP: ", PlayerHP, "\nDef: ", PlayerShield)
	$Label3.text = str("Cactus\nHP: ", BadGuyHP)
	
	randomize()
	
	if ColorCards == 0:
		Card1Type = 3
	else:
		Card1Type = rng.randi_range(1, 3)
	Card1Value = rng.randi_range(1, 6)
	
	set_card_texture($"Card-1", paths[Card1Type - 1], Card1Value)
	
	if Card1Type == 3 and Card2Type == 3 and Card3Type == 3:
		yield(get_tree().create_timer(1.0), "timeout")
		get_tree().change_scene("res://YouLost.tscn")
	if PlayerHP <= 0:
		yield(get_tree().create_timer(1.0), "timeout")
		get_tree().change_scene("res://YouLost.tscn")
	if BadGuyHP <= 0:
		yield(get_tree().create_timer(1.0), "timeout")
		get_tree().change_scene("res://YouWin.tscn")
	


func _on_Card2_pressed() -> void:
	if Card2Type == 1:
		BadGuyHP -= Card2Value
		ColorCards -= 1
	elif Card2Type == 2:
		PlayerShield += Card2Value
		ColorCards -= 1
	else:
		if Card2Value < PlayerShield:
			PlayerShield -= Card2Value
		elif Card2Value >= PlayerShield:
			PlayerHP -= Card2Value - PlayerShield
			PlayerShield = 0
		else:
			PlayerHP -= Card2Value
	
	$Label2.text = str("HP: ", PlayerHP, "\nDef: ", PlayerShield)
	$Label3.text = str("Cactus\nHP: ", BadGuyHP)
	
	randomize()
	
	if ColorCards == 0:
		Card2Type = 3
	else:
		Card2Type = rng.randi_range(1, 3)
	Card2Value = rng.randi_range(1, 6)
	
	set_card_texture($"Card-2", paths[Card2Type - 1], Card2Value)
	
	if Card1Type == 3 and Card2Type == 3 and Card3Type == 3:
		yield(get_tree().create_timer(1.0), "timeout")
		get_tree().change_scene("res://YouLost.tscn")
	if PlayerHP <= 0:
		yield(get_tree().create_timer(1.0), "timeout")
		get_tree().change_scene("res://YouLost.tscn")
	if BadGuyHP <= 0:
		yield(get_tree().create_timer(1.0), "timeout")
		get_tree().change_scene("res://YouWin.tscn")


func _on_Card3_pressed() -> void:
	if Card3Type == 1:
		BadGuyHP -= Card3Value
		ColorCards -= 1
	elif Card3Type == 2:
		PlayerShield += Card3Value
		ColorCards -= 1
	else:
		if Card3Value < PlayerShield:
			PlayerShield -= Card3Value
		elif Card3Value >= PlayerShield:
			PlayerHP -= Card3Value - PlayerShield
			PlayerShield = 0
		else:
			PlayerHP -= Card3Value
	
	$Label2.text = str("HP: ", PlayerHP, "\nDef: ", PlayerShield)
	$Label3.text = str("Cactus\nHP: ", BadGuyHP)
	
	randomize()
	
	if ColorCards == 0:
		Card3Type = 3
	else:
		Card3Type = rng.randi_range(1, 3)
	Card3Value = rng.randi_range(1, 6)
	
	set_card_texture($"Card-3", paths[Card3Type - 1], Card3Value)
	
	if Card1Type == 3 and Card2Type == 3 and Card3Type == 3:
		yield(get_tree().create_timer(1.0), "timeout")
		get_tree().change_scene("res://YouLost.tscn")
	if PlayerHP <= 0:
		yield(get_tree().create_timer(1.0), "timeout")
		get_tree().change_scene("res://YouLost.tscn")
	if BadGuyHP <= 0:
		yield(get_tree().create_timer(1.0), "timeout")
		get_tree().change_scene("res://YouWin.tscn")

func set_card_texture(card, color, value) -> void:
	card.set_normal_texture(load(str("res://sprites/", color, "/", value, ".png")))
