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
		'hasTheTurn'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Game class >> players: aPlayersCollection dices: aDicesCollection [
	aPlayersCollection size < 2
		ifTrue: [ AssertionFailure signal: 'Players quantity must be 2 or more' ].
	aDicesCollection size < 1
		ifTrue: [ AssertionFailure signal: 'Dices quantity must be 1 or more' ].
	^ self new initializeWithPlayers: aPlayersCollection initializeWithDices: aDicesCollection
]

{ #category : #actions }
Game >> aPlayerHaveWinnedTheGame [
	hasFinished := true
]

{ #category : #accesing }
Game >> hasFinished [
	^ hasFinished
]

{ #category : #accesing }
Game >> hasTheTurn [
	^ hasTheTurn
]

{ #category : #'instance initialization' }
Game >> initializeWithPlayers: aPlayersCollection initializeWithDices: aDicesCollection [
	players := aPlayersCollection.
	dices := aDicesCollection.
	hasFinished := false.
	hasTheTurn := players first
]

{ #category : #actions }
Game >> moveIfHasTheTurn: aPlayer board: aBoard positions: positionsQuantity [
	aPlayer == self hasTheTurn
		ifTrue: [ self hasFinished
				ifFalse: [ aBoard moveIfPossible: aPlayer positions: positionsQuantity ] ]
]

{ #category : #actions }
Game >> updateNextPlayer [
	(players indexOf: hasTheTurn) < players size
		ifTrue: [ hasTheTurn := players at: (players indexOf: hasTheTurn) + 1 ]
		ifFalse: [ hasTheTurn := players first ]
]
