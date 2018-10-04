"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	board:		<Object>
	dices:		<Object>
	players:		<Object>


    Implementation Points
"
Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'players',
		'dices',
		'hasFinished',
		'spaces',
		'currentPlayer',
		'playerPositions'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
Game class >> assertMinimumDiceQuantity:aDicesCollection [
	aDicesCollection size < 1
		ifTrue: [ AssertionFailure signal: 'Dices quantity must be 1 or more' ].
]

{ #category : #asserting }
Game class >> assertMinimumPlayersQuantity:aPlayersCollection [
	aPlayersCollection size < 2
		ifTrue: [ AssertionFailure signal: 'Players quantity must be 2 or more' ].
]

{ #category : #asserting }
Game class >> assertMinimumSpacesQuantity: aQuantity [
	aQuantity < 50
		ifTrue: [ AssertionFailure signal: 'Must have more than 49 spaces' ]
]

{ #category : #'instance creation' }
Game class >> playedBy: aPlayersCollection throwing: aDicesCollection spaces: aQuantity [
	self assertMinimumDiceQuantity: aDicesCollection.
	self assertMinimumPlayersQuantity: aPlayersCollection.
	self assertMinimumSpacesQuantity: aQuantity.
	^ self new
		initializePlayedBy: aPlayersCollection
		initializeThrowing: aDicesCollection
		initializeWithSpaces: aQuantity
]

{ #category : #asserting }
Game >> assertGameHasNotFinished [
	self hasFinished
		ifTrue: [ AssertionFailure signal: 'The game has finished' ]
]

{ #category : #asserting }
Game >> assertPlayersTurn: aPlayer [
	(self hasTheTurn: aPlayer)
		ifFalse: [ AssertionFailure signal: 'You cannot play now!' ]
]

{ #category : #actions }
Game >> finishGame [
	hasFinished := true
]

{ #category : #accesing }
Game >> hasFinished [
	| theTopPlayer |
	theTopPlayer:= playerPositions topPlayer.
	hasFinished := (playerPositions positionOf: theTopPlayer)  >= spaces.
	^ hasFinished
]

{ #category : #accesing }
Game >> hasTheTurn: aPlayer [
	^ currentPlayer = aPlayer
]

{ #category : #'instance initialization' }
Game >> initializePlayedBy: aPlayersCollection initializeThrowing: aDicesCollection initializeWithSpaces: aQuantity [
	players := CircularCollection contains:aPlayersCollection.
	dices := CircularCollection contains:aDicesCollection.
	spaces := aQuantity.
	hasFinished := false.
	playerPositions := PlayerPositions players: aPlayersCollection.
	currentPlayer := players next.
]

{ #category : #actions }
Game >> move: aPlayer by: positionsQuantity [
	self assertPlayersTurn: aPlayer;
	     assertGameHasNotFinished.
	playerPositions updatePositionOf: aPlayer by: positionsQuantity.
	currentPlayer := players next.
	self hasFinished ifTrue: [ self finishGame ]
]

{ #category : #accesing }
Game >> playerPositions [
	^playerPositions 
]
