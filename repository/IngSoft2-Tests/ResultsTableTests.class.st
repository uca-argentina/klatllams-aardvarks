Class {
	#name : #ResultsTableTests,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
ResultsTableTests >> testATableCannotBeInitializedWithZeroPlayers [
	| table |
	self should: [ table := ResultsTable players: LinkedList new ] raise: AssertionFailure
]

{ #category : #tests }
ResultsTableTests >> testATableExistsAndHasSomePlayers [
	| playerList table |
	playerList := LinkedList new.
	playerList
		add: (Player name: 'hector');
		add: (Player name: 'ignacio').
	table := ResultsTable players: playerList
]

{ #category : #tests }
ResultsTableTests >> testIsNotPosibleToChangeAPlayerPositionIfQuantityIsLessThanOne [
	| playerOne playerList table |
	playerOne := Player name: 'hector'.
	playerList := LinkedList new.
	playerList
		add: playerOne;
		add: (Player name: 'ignacio').
	table := ResultsTable players: playerList.
	self should: [ table updatePositionPlayer: playerOne name to: 0 ] raise: AssertionFailure
]

{ #category : #tests }
ResultsTableTests >> testIsPosibleToChangeAPlayerPositionAndTheTableUpdatesAutomatically [
	| playerOne playerTwo playerList table |
	playerOne := Player name: 'hector'.
	playerTwo := Player name: 'ignacio'.
	playerList := LinkedList new.
	playerList
		add: playerTwo;
		add: playerOne.
	table := ResultsTable players: playerList.
	table updatePositionPlayer: playerOne name to: 5.
	self assert: ((table playersAndPositions at: 1) at: 1) name == 'hector'
]

{ #category : #tests }
ResultsTableTests >> testWhenCreatedAllPlayersMustHaveTheSamePosition [
	| playerOne playerTwo playerList table |
	playerOne := Player name: 'hector'.
	playerTwo := Player name: 'ignacio'.
	playerList := LinkedList new.
	playerList
		add: playerTwo;
		add: playerOne.
	table := ResultsTable players: playerList.
	table sortByBoardPosition.
	table sortByPlayerName
]
