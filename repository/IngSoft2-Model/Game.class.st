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
		'currentPlayer',
		'board',
		'laps',
		'cardsHistory'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
Game class >> assertMinimumDiceQuantity: aDicesCollection [
	aDicesCollection size < 1
		ifTrue: [ AssertionFailure signal: 'Dices quantity must be 1 or more' ]
]

{ #category : #asserting }
Game class >> assertMinimumLapsQuantity: aLapsQuantity. [ 
	aLapsQuantity < 1
		ifTrue: [ AssertionFailure signal: 'Laps must be 1 or more' ].
]

{ #category : #asserting }
Game class >> assertMinimumPlayersQuantity: aPlayersCollection [
	aPlayersCollection size < 2
		ifTrue: [ AssertionFailure signal: 'Players quantity must be 2 or more' ]
]

{ #category : #'instance creation' }
Game class >> playedBy: aPlayersCollection throwing: aDicesCollection boardComposedBy: aSpacesCollection totalLaps: aLapsQuantity [
	| board |
	board := Board playedBy: aPlayersCollection composedBy: aSpacesCollection.
	^ self
		playedBy: aPlayersCollection
		throwing: aDicesCollection
		playedOn: board
		totalLaps: aLapsQuantity
]

{ #category : #'instance creation' }
Game class >> playedBy: aPlayersCollection throwing: aDicesCollection playedOn: aBoard totalLaps: aLapsQuantity [
	self assertMinimumDiceQuantity: aDicesCollection.
	self assertMinimumPlayersQuantity: aPlayersCollection.
	self assertMinimumLapsQuantity: aLapsQuantity.
	^ self new
		initializePlayedBy: aPlayersCollection
		initializeThrowing: aDicesCollection
		initializePlayedOn: aBoard
		initializeWithTotalLaps: aLapsQuantity
]

{ #category : #'instance creation' }
Game class >> playedBy: aPlayersCollection throwing: aDicesCollection spaces: aSpacesQuantity totalLaps: aLapsQuantity [
	| board |
	board := Board playedBy: aPlayersCollection spaces: aSpacesQuantity.
	^ self
		playedBy: aPlayersCollection
		throwing: aDicesCollection
		playedOn: board
		totalLaps: aLapsQuantity
]

{ #category : #accessing }
Game >> activeCardsInfo [
	^ board activeCardsInfo
]

{ #category : #adding }
Game >> add: aCard [
	self assertPlayerCanUseA: aCard.
	aCard assertCardNeedsLastCard & cardsHistory notEmpty
		ifTrue: [ aCard lastCardPlayed: cardsHistory first ].
	aCard assertIsCardATransientCard
		ifTrue: [ ^ self ].
	cardsHistory add: aCard.
	board addAnActive: (CardInfo withCard: aCard affecting: players elements)
]

{ #category : #adding }
Game >> add: aCard affecting: aPlayer [
	self assertPlayerCanUseA: aCard.
	aCard assertCardNeedsLastCard & cardsHistory notEmpty
		ifTrue: [ aCard lastCardPlayed: cardsHistory first ].
	cardsHistory addFirst: aCard.
	board addAnActive: (CardInfo withCard: aCard affecting: {aPlayer} asOrderedCollection).
	aCard assertIsCardATransientCard
		ifTrue: [ aCard affect: aPlayer on: board ]
]

{ #category : #adding }
Game >> add: aCard cancelling: anotherCard [
	self assertCancellingCanBeDoneBy: aCard.
	aCard assertCardNeedsLastCard & cardsHistory notEmpty
		ifTrue: [ aCard lastCardPlayed: cardsHistory first ].
	aCard assertCanCancelAnotherCard.
	cardsHistory addFirst: aCard.
	aCard affect: anotherCard on: board
]

{ #category : #adding }
Game >> assertCancellingCanBeDoneBy: aCard [
	board activeCardsInfo isEmpty
		ifTrue: [ aCard owner addNewCard: aCard.
			AssertionFailure signal: 'You cannot play a canceling card when there are no active cards.' ]
]

{ #category : #asserting }
Game >> assertGameHasNotFinished [
	self hasFinished
		ifTrue: [ AssertionFailure signal: 'The game has finished' ]
]

{ #category : #asserting }
Game >> assertPlayerCanUseA: aCard [
	aCard assertCardIsAPermanentCard & (self hasTheTurn: aCard owner) | aCard assertIsCardATransientCard
		ifTrue: [ ^ self ].
	aCard owner addNewCard: aCard.
	AssertionFailure signal: 'You cannot play a permanent card right now'
]

{ #category : #asserting }
Game >> assertPlayersTurn: aPlayer [
	(self hasTheTurn: aPlayer)
		ifFalse: [ AssertionFailure signal: 'You cannot play now!' ]
]

{ #category : #accessing }
Game >> gameStatus [
	^ board gameStatus.
]

{ #category : #accessing }
Game >> hasFinished [
	| theTopPlayer |
	theTopPlayer := board gameStatus topPlayer.
	^ (board gameStatus lapsOf: theTopPlayer) >= laps
]

{ #category : #accessing }
Game >> hasTheTurn: aPlayer [
	^ currentPlayer = aPlayer
]

{ #category : #initialization }
Game >> initializePlayedBy: aPlayersCollection initializeThrowing: aDicesCollection initializePlayedOn: aBoard initializeWithTotalLaps: aQuantity [
	players := CircularIterator contains: aPlayersCollection.
	dices := aDicesCollection.
	board := aBoard.
	currentPlayer := players nextBy: 1.
	laps := aQuantity.
	cardsHistory := OrderedCollection new.
	aPlayersCollection
		do: [ :player | 
			2
				timesRepeat: [ player
						addNewCard:
							({AccelerationCard.
							CancellationCard.
							OverloadCard.
							RedoCard.
							RepeatCard.
							SpeedCard} atRandom ownedBy: player) ] ]
]

{ #category : #actions }
Game >> move: aPlayer [
	self assertPlayersTurn: aPlayer;
		  assertGameHasNotFinished.
	board moveAndAffect: aPlayer by: (aPlayer roll: dices).
	currentPlayer := players nextBy: 1
]
