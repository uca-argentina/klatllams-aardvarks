Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'spaces',
		'game',
		'table'
	],
	#classInstVars : [
		'lockers'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance initialization' }
Board class >> spacesQuantity: aSpacesQuantity players: aPlayersList game: aGame [
	aSpacesQuantity < 50
		ifTrue: [ AssertionFailure signal: 'Cannot have less than 50 lockers' ].
	aPlayersList size < 2
		ifTrue: [ AssertionFailure signal: 'Cannot haver less than 2 players' ].
	^ self new
		initializeWithSpacesQuantity: aSpacesQuantity
		initializeWithPlayers: aPlayersList
		initializeWithGame: aGame
]

{ #category : #'instance initialization' }
Board >> initializeWithSpacesQuantity: aSpacesQuantity initializeWithPlayers: aPlayersCollection initializeWithGame: aGame [
	game := aGame.
	table := ResultsTable players: aPlayersCollection.
	spaces := aSpacesQuantity
]

{ #category : #updating }
Board >> moveIfPossible: aPlayer positions: positionsQuantity [
	table updatePositionPlayer: aPlayer name to: positionsQuantity.
	((table playersAndPositions at: 1) at: 2) >= self spaces
		ifTrue: [ game aPlayerHaveWinnedTheGame ]
		ifFalse: [ game updateNextPlayer ]
]

{ #category : #updating }
Board >> movePlayer: aPlayer positions: positionsQuantity [
	positionsQuantity < 1
		ifTrue: [ AssertionFailure signal: 'A movement Cannot be Negative or Zero' ].
	game moveIfHasTheTurn: aPlayer board: self positions: positionsQuantity
]

{ #category : #accesing }
Board >> playerPosition: aPlayer [
	^ table aPlayerPosition: aPlayer
]

{ #category : #accesing }
Board >> spaces [
	^ spaces
]
