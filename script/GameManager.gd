extends Node

var gameManager = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gameManager = GameManagerPOO.GetInstance()
	gameManager.StartGame(3, 5)
	gameManager.Print()
	gameManager = GameManagerPOO.GetInstance()
	gameManager.Print()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


var GameManager = func():
	var _instance = null

	var GetInstance = func():
		if _instance == null:
			_instance = GameManager.new()
		return _instance

	var StartGame = func(numberOfPlayers, numberOfEnemies):
		var players = []
		var enemies = []
		for i in range(numberOfPlayers):
			players.append(Player.new())
		for i in range(numberOfEnemies):
			enemies.append(Enemy.new())
		print("Game Started")

	return {
		GetInstance: GetInstance,
		StartGame: StartGame
	}

class Player:
	var health
	var damage

	func _init():
		health = 100
		damage = 10

class Enemy:
	var health
	var damage

	func _init():
		health = 50
		damage = 5
	
class GameManagerPOO:
	static var _instance = null
	var players = null
	var enemies = null
	
	func _init():
		players = []
		enemies = []

	static func GetInstance():
		if _instance == null:
			_instance = GameManagerPOO.new()
		return _instance
		
	func StartGame(numberOfPlayers, numberOfEnemies):
		for i in range(numberOfPlayers):
			players.append(Player.new())
		for i in range(numberOfEnemies):
			enemies.append(Enemy.new())
		print("Game Started")
		
	func Print():
		print(players)
		print(enemies)
