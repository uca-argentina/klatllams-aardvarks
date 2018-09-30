Class {
	#name : #ResultsTableTests,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
ResultsTableTests >> testATableExistsAndHasSomePlayers [
	| playerList playersPosition |
	playerList := CircularCollection  new.
	playerList
		add: (Player name: 'hector');
		add: (Player name: 'ignacio').
	playersPosition := PlayersPosition players: playerList
]

{ #category : #tests }
ResultsTableTests >> testIsNotPosibleToChangeAPlayerPositionIfQuantityIsLessThanOne [
	| playerOne playerList playersPosition |
	playerOne := Player name: 'hector'.
	playerList := CircularCollection new.
	playerList
		add: playerOne;
		add: (Player name: 'ignacio').
	playersPosition := PlayersPosition players: playerList.
	self should: [ playersPosition updatePositionOf: playerOne to: 0 ] raise: AssertionFailure
]

{ #category : #tests }
ResultsTableTests >> testIsPosibleToChangeAPlayerPositionAndTheTableUpdatesAutomatically [
	| playerOne playerTwo playerList playersPosition |
	playerOne := Player name: 'hector'.
	playerTwo := Player name: 'ignacio'.
	playerList := CircularCollection new.
	playerList
		add: playerTwo;
		add: playerOne.
	playersPosition := PlayersPosition players: playerList.
	playersPosition updatePositionOf: playerOne to: 5.
	self deny: (playersPosition topPlayer )  == playerTwo 
]

{ #category : #tests }
ResultsTableTests >> testWhenCreatedAllPlayersMustHavePositionEqualsToZero [
	| playerOne playerTwo playerList playersPosition |
	playerOne := Player name: 'hector'.
	playerTwo := Player name: 'ignacio'.
	playerList := CircularCollection new.
	playerList
		add: playerTwo;
		add: playerOne.
	playersPosition := PlayersPosition players: playerList.
	playersPosition playersAndPositions do: [ :each | self assert: (each at: 2) equals: 0 ]
	
]
