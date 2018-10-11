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

{ #category : #accesing }
PlayerPositions >> gamePositionOf: aPlayer [
	| requestedPlayer |
	self sortAllThePlayers.
	requestedPlayer := playersAndPositions detect: [ :each | each player = aPlayer ].
	^ playersAndPositions indexOf: requestedPlayer
]

{ #category : #initialization }
PlayerPositions >> initializeWithPlayers: playersCollection [
	playersAndPositions := (playersCollection collect: [ :each | PlayerPositionLap player:each ])
		asOrderedCollection.
]

{ #category : #accesing }
PlayerPositions >> lapsOf: aPlayer [
	^ (playersAndPositions detect: [ :each | each player = aPlayer ]) lap
]

{ #category : #accesing }
PlayerPositions >> positionOf: aPlayer [
	^ (playersAndPositions detect: [ :each | each player = aPlayer ]) position
]

{ #category : #accesing }
PlayerPositions >> sortAllThePlayers [
     playersAndPositions sort: [ :a :b | a lap > b lap | (a position > b position & (a lap = b lap)) ]
]

{ #category : #accesing }
PlayerPositions >> topPlayer [
	self sortAllThePlayers.
	^ playersAndPositions first player
]

{ #category : #updating }
PlayerPositions >> updateAllPlayersBy: aQuantity [
	playersAndPositions do: [ :each | each updateThePositionTo:aQuantity  ]
]

{ #category : #updating }
PlayerPositions >> updateAllPlayersToInitialPosition [
	playersAndPositions do: [ :each | each updateToInitialPosition ]
]

{ #category : #updating }
PlayerPositions >> updatePositionOf: aPlayer to: aValue [
	(playersAndPositions detect: [ :each | each player = aPlayer]) updateThePositionTo:aValue
]
