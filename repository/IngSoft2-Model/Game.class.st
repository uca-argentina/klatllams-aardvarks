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
		'currentPlayer',
		'board',
		'laps'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
Game class >> assertMinimumDiceQuantity:aDicesCollection [
	aDicesCollection size < 1
		ifTrue: [ AssertionFailure signal: 'Dices quantity must be 1 or more' ].
]

{ #category : #asserting }
Game class >> assertMinimumLapsQuantity: aLapsQuantity. [ 
	aLapsQuantity < 1
		ifTrue: [ AssertionFailure signal: 'Laps must be 1 or more' ].
]

{ #category : #asserting }
Game class >> assertMinimumPlayersQuantity:aPlayersCollection [
	aPlayersCollection size < 2
		ifTrue: [ AssertionFailure signal: 'Players quantity must be 2 or more' ].
]

{ #category : #asserting }
Game class >> assertMinimumSpacesQuantity: aSpacesQuantity [
	(aSpacesQuantity rem: 100) = 0
		ifFalse: [ AssertionFailure signal: 'Spaces Quantity must be a multiple of 100 ' ]
]

{ #category : #'instance creation' }
Game class >> playedBy: aPlayersCollection throwing: aDicesCollection spaces: aSpacesQuantity totalLaps: aLapsQuantity [
	self assertMinimumDiceQuantity: aDicesCollection.
	self assertMinimumPlayersQuantity: aPlayersCollection.
	self assertMinimumSpacesQuantity: aSpacesQuantity.
	self assertMinimumLapsQuantity: aLapsQuantity. 
	^ self new
		initializePlayedBy: aPlayersCollection
		initializeThrowing: aDicesCollection
		initializeWithSpaces: aSpacesQuantity
		initializeWithTotalLaps: aLapsQuantity
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

{ #category : #accessing }
Game >> hasFinished [
	| theTopPlayer |
	theTopPlayer:= board playerPositions topPlayer.
	hasFinished := (board playerPositions lapsOf: theTopPlayer)  >= laps.
	^ hasFinished
]

{ #category : #accessing }
Game >> hasTheTurn: aPlayer [
	^ currentPlayer = aPlayer
]

{ #category : #initialization }
Game >> initializePlayedBy: aPlayersCollection initializeThrowing: aDicesCollection initializeWithSpaces: aQuantity initializeWithTotalLaps: aLapsQuantity [
	players := CircularCollection contains: aPlayersCollection.
	dices := aDicesCollection.
	board := Board spaces: aQuantity.
	hasFinished := false.
	currentPlayer := players next.
	laps := aLapsQuantity
]

{ #category : #actions }
Game >> move: aPlayer [
	self
		assertPlayersTurn: aPlayer;
		assertGameHasNotFinished.
	board moveAndAffect: aPlayer by: (aPlayer roll: dices).
	currentPlayer := players next.
	self hasFinished
		ifTrue: [ self finishGame ]
]
