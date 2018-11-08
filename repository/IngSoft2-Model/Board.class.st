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
		'playerPositions',
		'spaces'
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
	(aQuantity rem: 100) = 0
		ifFalse: [ AssertionFailure signal: 'Spaces Quantity must be a multiple of 100' ]
]

{ #category : #generators }
Board class >> generateRandomSpaceDistributionWithSpacesQuantity:aQuantity [
	| generator |
	generator := SpacesGenerator spacesQuantity: aQuantity.
	^ generator generateSpaceDistribution
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
	spacesCollection := self generateRandomSpaceDistributionWithSpacesQuantity: aQuantity.
	^ self new initializePlayedBy: aPlayersCollection initializeComposedBy: spacesCollection
]

{ #category : #determine }
Board >> determinePositionAndLapsToAddOf: aPlayer withARollOf: aQuantity [
	| positionsCircularCollection newPosition newLap |
	
	positionsCircularCollection := CircularIterator
		contains: (1 to: spaces size) asOrderedCollection
		startingAt: (playerPositions positionOf: aPlayer).
	
	newPosition := positionsCircularCollection nextBy: aQuantity.
	newLap := positionsCircularCollection turns.

	^ PlayerPosition player: aPlayer position: newPosition laps: newLap
]

{ #category : #initialization }
Board >> initializePlayedBy: aPlayersCollection initializeComposedBy: aSpacesCollection [
	spaces := aSpacesCollection.
	playerPositions := GameStatus players: aPlayersCollection
]

{ #category : #action }
Board >> move: aPlayer by: aQuantity [
	| playerPositionLapToAdd |
	playerPositionLapToAdd := self determinePositionAndLapsToAddOf: aPlayer withARollOf: aQuantity.
	playerPositions
		updatePositionAndLapsOf: aPlayer
		to: playerPositionLapToAdd position
		adding: (playerPositionLapToAdd lap + (playerPositions lapsOf: aPlayer) )
]

{ #category : #action }
Board >> moveAndAffect: aPlayer by: aValue [
	self move: aPlayer by: aValue.
	(spaces at: (playerPositions positionOf: aPlayer))
		affect: aPlayer
		on: self
]

{ #category : #accessing }
Board >> storyElements [
	^ playerPositions
]
