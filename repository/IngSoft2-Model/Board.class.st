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
		'activeCardsInfo'
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

{ #category : #asserting }
Board >> assertNotEmptyActiveCards [
	^ activeCardsInfo notEmpty
]

{ #category : #initialization }
Board >> initializePlayedBy: aPlayersCollection initializeComposedBy: aSpacesCollection [
	spaces := aSpacesCollection.
	gameStatus := GameStatus players: aPlayersCollection.
	activeCardsInfo := OrderedCollection new.
	landingPlayerPositions := OrderedCollection new.
]

{ #category : #action }
Board >> lastLandingPosition: aPosition playedBy: aPlayer [
	landingPlayerPositions add: (LandingPosition player: aPlayer position: aPosition)
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
	| cardsAffecting afterCardsResult |
	cardsAffecting := activeCardsInfo select: [ :cardInfo | cardInfo playerAffected: aPlayer ].
	afterCardsResult := aValue	+ (cardsAffecting sumNumbers: [ :cardInfo | cardInfo card affect ]).
	self move: aPlayer by: afterCardsResult.
	self lastLandingPosition: (gameStatus positionOf: aPlayer) playedBy: aPlayer.
	(spaces at: (gameStatus positionOf: aPlayer)) affect: aPlayer on: self
]

{ #category : #removing }
Board >> remove: aCard [
	activeCardsInfo
		detect: [ :cardInfo | cardInfo card = aCard ]
		ifFound: [ :cardInfo | activeCardsInfo remove: cardInfo ]
]

{ #category : #accessing }
Board >> storyElements [
	^ gameStatus
]
