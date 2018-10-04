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
		add: (Player named: 'hector');
		add: (Player named: 'ignacio').
	playersPosition := PlayersPosition players: playerList
]

{ #category : #tests }
ResultsTableTests >> testIsNotPosibleToChangeAPlayerPositionIfQuantityIsLessThanOne [
	| playerOne playerList playersPosition |
	playerOne := Player named: 'hector'.
	playerList := CircularCollection new.
	playerList
		add: playerOne;
		add: (Player named: 'ignacio').
	playersPosition := PlayersPosition players: playerList.
	self should: [ playersPosition updatePositionOf: playerOne to: 0 ] raise: AssertionFailure
]

{ #category : #tests }
ResultsTableTests >> testIsPosibleToChangeAPlayerPositionAndTheTableUpdatesAutomatically [
	| playerOne playerTwo playerList playersPosition |
	playerOne := Player named: 'hector'.
	playerTwo := Player named: 'ignacio'.
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
	playerOne := Player named: 'hector'.
	playerTwo := Player named: 'ignacio'.
	playerList := CircularCollection new.
	playerList
		add: playerTwo;
		add: playerOne.
	playersPosition := PlayersPosition players: playerList.
	playersPosition playersAndPositions do: [ :each | self assert: (each at: 2) equals: 0 ]
	
]
