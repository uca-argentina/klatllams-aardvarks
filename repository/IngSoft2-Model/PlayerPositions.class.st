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
	playersAndPositions:		<Object>


    Implementation Points
"
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
	self sortThePlayersInDescendingOrder.
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

{ #category : #sorting }
PlayerPositions >> sortThePlayersInDescendingOrder [
     playersAndPositions sort: [ :a :b | a lap > b lap | (a position > b position & (a lap = b lap)) ]
]

{ #category : #accesing }
PlayerPositions >> topPlayer [
	self sortThePlayersInDescendingOrder.
	^ playersAndPositions first player
]

{ #category : #updating }
PlayerPositions >> updateAllPlayersToInitialPosition [
	playersAndPositions do: [ :each | each updateToInitialPosition ]
]

{ #category : #updating }
PlayerPositions >> updatePositionAndLapsOf: aPlayer to: aPosition adding: laps [
	| player |
	player := playersAndPositions detect: [ :each | each player = aPlayer ].
	player updateThePositionTo: aPosition.
	player updateLapBy: laps
]
