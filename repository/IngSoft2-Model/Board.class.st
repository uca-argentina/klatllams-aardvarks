"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	playerPositions:		<Object>
	spaces:		<Object>


    Implementation Points
"
Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'spaces',
		'gameStatus',
		'landingPlayerPositions',
		'activeCards',
		'playersInJail'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Board class >> assertMinimumQuantityOf: aSpacesCollection [
	aSpacesCollection size < 6
		ifTrue:[AssertionFailure signal:'Add more spaces!']
]

{ #category : #'instance creation' }
Board class >> assertValidSpacesQuantity: aQuantity [
	aQuantity < 10
		ifTrue: [ AssertionFailure signal: 'You need more spaces' ]
]

{ #category : #generators }
Board class >> generateDistribution [
	| distribution |
	distribution := OrderedCollection new.
	distribution add: AtomicBombSpace new withOccurrences: 2 asFloat floor.
	distribution
		addAll: ((1 to: 10) collect: [ :n | MoonWalkSpace backwardsRandom ]).
	distribution add: NoEffectSpace new withOccurrences: 38.
	distribution add: SpeedUpSpace new withOccurrences: 20.
	distribution add: WormHoleSpace new withOccurrences: 20.
	distribution add: CardSpace new withOccurrences: 10.
	distribution shuffled.
	^ distribution
]

{ #category : #generators }
Board class >> generateRandomSpaceDistributionWith: aQuantity [
	| distribution randomDistribution randomSpace |
	distribution := self generateDistribution.
	randomDistribution := OrderedCollection new.
	aQuantity
		timesRepeat: [ randomSpace := distribution at: 100 atRandom.
			randomDistribution add: randomSpace ].
	^ randomDistribution
]

{ #category : #'instance creation' }
Board class >> playedBy: aPlayersCollection composedBy: aSpacesCollection [
	self assertMinimumQuantityOf: aSpacesCollection .
	^ self new initializePlayedBy: aPlayersCollection initializeComposedBy: aSpacesCollection
]

{ #category : #'instance creation' }
Board class >> playedBy: aPlayersCollection spaces: aQuantity [
	| spacesCollection |
	self assertValidSpacesQuantity: aQuantity.
	spacesCollection := self generateRandomSpaceDistributionWith: aQuantity.
	^ self new initializePlayedBy: aPlayersCollection initializeComposedBy: spacesCollection
]

{ #category : #accessing }
Board >> activeCardsInfo [
	^ activeCards
]

{ #category : #updating }
Board >> add: anActiveCard [
	activeCards add: anActiveCard 
]

{ #category : #updating }
Board >> assertPlayerInJail: aPlayer [
	(self playerIsInJail: aPlayer)
	ifFalse: [ ^self ].
]

{ #category : #accessing }
Board >> gameStatus [
	^ gameStatus
]

{ #category : #initialization }
Board >> initializePlayedBy: aPlayersCollection initializeComposedBy: aSpacesCollection [
	spaces := aSpacesCollection.
	gameStatus := GameStatus players: aPlayersCollection.
	landingPlayerPositions := OrderedCollection new.
	activeCards := OrderedCollection new.
	playersInJail := OrderedCollection new.
]

{ #category : #accessing }
Board >> lastLandingPositionOf: aPlayer [
	landingPlayerPositions
		detect: [ :landingPosition | landingPosition player = aPlayer ]
		ifFound: [ :landingPosition | ^ landingPosition position ]
		ifNone: [ ^0 ]
]

{ #category : #action }
Board >> move: aPlayer by: aQuantity [
	| positionsCircularIterator |
	positionsCircularIterator := CircularIterator
		contains: (1 to: spaces size) asOrderedCollection
		startingAt: (gameStatus positionOf: aPlayer).
	gameStatus
		updatePositionAndLapsOf: aPlayer
		to: (positionsCircularIterator nextBy: aQuantity)
		adding: positionsCircularIterator turns + (gameStatus lapsOf: aPlayer)
]

{ #category : #action }
Board >> moveAndAffect: aPlayer by: aValue [
	(self playerIsInJail: aPlayer)
		ifTrue: [ ^ self ].
	activeCards
		select: [ :activeCard | activeCard affects: aPlayer ]
		thenDo: [ :activeCard | activeCard card affect: aPlayer on: self ].
	self move: aPlayer by: aValue.
	self
		updateLastLandingTo: (gameStatus positionOf: aPlayer)
		of: aPlayer.
	(spaces at: (gameStatus positionOf: aPlayer))
		affect: aPlayer
		on: self
]

{ #category : #accessing }
Board >> playerIsInJail: aPlayer [ 
	^ playersInJail includes: aPlayer.

]

{ #category : #accessing }
Board >> players [
	^ gameStatus players.
]

{ #category : #updating }
Board >> putInJail: aPlayer [
	playersInJail add: aPlayer.
]

{ #category : #updating }
Board >> releaseFromJail: aPlayer [ 
	self assertPlayerInJail: aPlayer.
	playersInJail remove: aPlayer.
]

{ #category : #updating }
Board >> removeAnActive: card [
	activeCards
		detect: [ :cardInfo | cardInfo card = card ]
		ifFound: [ :cardInfo | activeCards remove: cardInfo ]
]

{ #category : #accessing }
Board >> spaces [
	^ spaces
]

{ #category : #updating }
Board >> updateLastLandingTo: aPosition of: aPlayer [
	landingPlayerPositions addFirst: (LandingPosition player: aPlayer on: aPosition)
]
