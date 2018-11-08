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
		'playersStories'
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
	^ playersStories detectIndex: [ :each | each player = aPlayer ]
]

{ #category : #initialization }
GameStatus >> initializeWithPlayers: playersCollection [
	| playerStory |
	playersStories := playersCollection
		collect: [ :each | playerStory := PlayerStory player: each.
								playerStory add:1 withLaps: 0 ]
]

{ #category : #accesing }
GameStatus >> lapsOf: aPlayer [
	^ (playersStories detect: [ :playerStory | playerStory player = aPlayer ]) storyElements first lap
]

{ #category : #accesing }
GameStatus >> players [
	^ playersStories collect: [ :playerStory | playerStory player ]
]

{ #category : #accesing }
GameStatus >> positionOf: aPlayer [
 ^ (playersStories detect: [ :playerStory | playerStory player = aPlayer ])storyElements first position
]

{ #category : #sorting }
GameStatus >> sortThePlayersInDescendingOrder [
	^ (playersStories collect: [ :playerStory | playerStory storyElements first ])
		sort: #lap descending , #position descending
]

{ #category : #accesing }
GameStatus >> topPlayer [
	^ self sortThePlayersInDescendingOrder first player
]

{ #category : #updating }
GameStatus >> updatePositionAndLapsOf: aPlayer to: aPosition adding: laps [
	playersStories
		detect: [ :playerStory | playerStory player = aPlayer ]
		ifFound: [ :playerStory | playerStory add: aPosition withLaps: laps ]
		ifNone: [ Exception signal: 'Player not found' ]
]
