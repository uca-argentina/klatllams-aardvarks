Class {
	#name : #BoardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
BoardTest >> testAPlayerCanMoveItsPositionOnBoardBy10Lockers [
	"move a player by 10 spaces in the board"

	| game playersList board playerOne dicesList |
	playerOne := Player name: 'Hector'.
	playersList := LinkedList new.
	dicesList := LinkedList new.
	dicesList
		add: (Dice facesQuantity: 10);
		add: (Dice facesQuantity: 12).
	playersList
		add: playerOne;
		add: (Player name: 'Ignacio').
	game := Game players: playersList dices: dicesList.
	board := Board spacesQuantity: 50 players: playersList game: game.
	board movePlayer: playerOne positions: 10.
	self assert: (board playerPosition: playerOne) equals: 10
]

{ #category : #tests }
BoardTest >> testAPlayerCannotMoveLessThan1Position [
	"move a player by 10 spaces in the board"

	| playersList board playerOne |
	playerOne := Player name: 'Hector'.
	playersList := LinkedList new.
	playersList
		add: playerOne;
		add: (Player name: 'Ignacio').
	board := Board spacesQuantity: 50 players: playersList game: Game new.
	self should: [ board movePlayer: playerOne positions: 0 ] raise: AssertionFailure
]

{ #category : #tests }
BoardTest >> testAllThePlayersStartInPositionZeroWhenTheGameStarts [
	"all the players must start in position 0 when a new board is created."

	| playersList board playerOne playerTwo |
	playerOne := Player name: 'Hector'.
	playerTwo := Player name: 'Ignacio'.
	playersList := LinkedList new.
	playersList
		add: playerOne;
		add: playerTwo.
	board := Board spacesQuantity: 50 players: playersList game: Game new.
	self assert: (board playerPosition: playerOne) equals: 0.
	self assert: (board playerPosition: playerTwo) equals: 0
]

{ #category : #tests }
BoardTest >> testBoardCannotHaveLessThan50LockersAndMoreThan2Players [
	"test for the minimum quantity of spaces"

	| playersList board |
	playersList := LinkedList new.
	playersList
		add: (Player name: 'Hector');
		add: (Player name: 'Ignacio').
	self
		should: [ board := Board spacesQuantity: 49 players: playersList game: Game new ]
		raise: AssertionFailure.
	playersList removeLast.
	self
		should: [ board := Board spacesQuantity: 50 players: playersList game: Game new ]
		raise: AssertionFailure
]

{ #category : #tests }
BoardTest >> testBoardExistsAndHas50LockersAnd2Players [
	"just a test for Board class creation with 2 players"

	| playersList board |
	playersList := LinkedList new.
	playersList
		add: (Player name: 'Hector');
		add: (Player name: 'Ignacio').
	board := Board spacesQuantity: 50 players: playersList game: Game new.
	self assert: board spaces equals: 50
]
