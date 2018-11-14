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
	#name : #GameStatus,
	#superclass : #Object,
	#instVars : [
		'playersHistories'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
GameStatus class >> players: playersCollection [
	^ self new initializeWithPlayers: playersCollection
]

{ #category : #accesing }
GameStatus >> gamePositionOf: aPlayer [
	self sortThePlayersInDescendingOrder.
	^ playersHistories detectIndex: [ :each | each player = aPlayer ]
]

{ #category : #initialization }
GameStatus >> initializeWithPlayers: playersCollection [
	| playerHistory |
	playersHistories := playersCollection
		collect: [ :each | playerHistory := PlayerHistory player: each.
								playerHistory updatePlayerTo:1 withLaps: 0 ]
]

{ #category : #accesing }
GameStatus >> lapsOf: aPlayer [
	^ (playersHistories detect: [ :playerStory | playerStory player = aPlayer ]) gameStatus first lap
]

{ #category : #accesing }
GameStatus >> players [
	^ playersHistories collect: [ :playerStory | playerStory player ]
]

{ #category : #accesing }
GameStatus >> positionOf: aPlayer [
 ^ (playersHistories detect: [ :playerStory | playerStory player = aPlayer ])gameStatus first position
]

{ #category : #sorting }
GameStatus >> sortThePlayersInDescendingOrder [
	^ (playersHistories collect: [ :playerStory | playerStory gameStatus first ])
		sort: #lap descending , #position descending
]

{ #category : #accesing }
GameStatus >> topPlayer [
	^ self sortThePlayersInDescendingOrder first player
]

{ #category : #updating }
GameStatus >> updatePositionAndLapsOf: aPlayer to: aPosition adding: laps [
	playersHistories
		detect: [ :playerStory | playerStory player = aPlayer ]
		ifFound: [ :playerStory | playerStory updatePlayerTo: aPosition withLaps: laps ]
		ifNone: [ Exception signal: 'Player not found' ]
]
