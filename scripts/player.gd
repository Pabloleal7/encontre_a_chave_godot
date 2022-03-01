extends KinematicBody2D

export var vel = 100
var key = false
var pertoDaChave = false
var pertoDaPorta1 = false
var pertoDaPorta2 = false
onready var chave = get_parent().get_node("chave")
onready var porta = get_parent().get_node("porta2")
onready var porta2 = get_parent().get_node("porta")

func _ready():
	pass 
	
func _process(_delta):
	
	var dir = Vector2(0,0)
	
	if Input.is_action_pressed("up"):
		dir.y = -1
		
	if Input.is_action_pressed("down"):
		dir.y = +1
		
	if Input.is_action_pressed("left"):
		dir.x = -1
		
	if Input.is_action_pressed("right"):
		dir.x = +1
		
		


	var _move = move_and_slide(dir * vel)
	
func _input(_event):
	if pertoDaChave and Input.is_key_pressed(KEY_X):
		print("pegou a chave")
		key = true
		chave.queue_free()
		
	if key and pertoDaPorta1 and Input.is_key_pressed(KEY_X):
		print("perto da porta")
		porta.queue_free()
		pertoDaPorta1 = false
		
	if key and pertoDaPorta2 and Input.is_key_pressed(KEY_X):
		print("perto da porta")
		porta2.queue_free()
		pertoDaPorta2 = false


func _on_area_body_entered(body):
	if body.name == "chave":
		pertoDaChave = true
		
	if body.name == "porta2":
		print("entrou porta")
		pertoDaPorta1 = true
		
	if body.name == "porta":
		print("entrou porta")
		pertoDaPorta2 = true
	
		


func _on_area_body_exited(body):
	if body.name == "chave":
		pertoDaChave = false
		
	if body.name == "porta2":
		print("saiur porta")
		pertoDaPorta1= false
		
	if body.name == "porta":
		print("entrou porta")
		pertoDaPorta2 = false
		
