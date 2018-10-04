Class {
	#name : #PlayerPositions,
	#superclass : #Object,
	#instVars : [
		'playersAndPositions'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
PlayerPositions class >> players: playersCollection [
	^ self new initializeWithPlayers: playersCollection
]

{ #category : #asserting }
PlayerPositions >> assertIsValid: aQuantity [
	aQuantity < 1
		ifTrue: [ AssertionFailure signal: 'You cannot move a player a negative quantity' ]
]

{ #category : #'instance initialization' }
PlayerPositions >> initializeWithPlayers: playersCollection [
	playersAndPositions := (playersCollection collect: [ :each | PlayerPosition player:each ])
		asOrderedCollection.
]

{ #category : #accesing }
PlayerPositions >> positionOf: aPlayer [
	^ (playersAndPositions detect: [ :each | each player = aPlayer ]) position
]

{ #category : #accesing }
PlayerPositions >> topPlayer [
	playersAndPositions sort:[:a :b | a position > b position].
	^ playersAndPositions first player
]

{ #category : #updating }
PlayerPositions >> updatePositionOf: aPlayer by: aQuantity [
	self assertIsValid: aQuantity.
	(playersAndPositions detect: [ :each | each player = aPlayer]) updateThePositionBy:aQuantity
]
