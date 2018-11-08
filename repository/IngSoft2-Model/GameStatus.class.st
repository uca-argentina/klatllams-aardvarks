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
		'playersAndPositions'
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
	^ playersAndPositions detectIndex: [ :each | each player = aPlayer ]
]

{ #category : #initialization }
GameStatus >> initializeWithPlayers: playersCollection [
	| playerStory |
	playersAndPositions := playersCollection
		collect: [ :each | 
			playerStory := PlayerStory player: each.
			playerStory add: (PlayerPosition player: each position: 1 laps: 0) ]
]

{ #category : #accesing }
GameStatus >> lapsOf: aPlayer [
	^ (playersAndPositions detect: [ :each | each player = aPlayer ]) playerPositions first lap
]

{ #category : #accesing }
GameStatus >> players [
	^ playersAndPositions collect: [ :each | each player ]
]

{ #category : #accesing }
GameStatus >> positionOf: aPlayer [
	^ (playersAndPositions detect: [ :each | each player = aPlayer ])playerPositions first position 
]

{ #category : #sorting }
GameStatus >> sortThePlayersInDescendingOrder [
	^(playersAndPositions collect: [ :each | each playerPositions first ])
		sort: #lap descending , #position descending
]

{ #category : #accesing }
GameStatus >> topPlayer [
	^ self sortThePlayersInDescendingOrder first player
]

{ #category : #updating }
GameStatus >> updatePositionAndLapsOf: aPlayer to: aPosition adding: laps [
	playersAndPositions
		detect: [ :each | each player = aPlayer ]
		ifFound: [ :playerStory | 
			playerStory add:(PlayerPosition player:aPlayer position:aPosition laps:laps).
			 ]
		ifNone: [ Exception signal: 'Player not found' ].
]
