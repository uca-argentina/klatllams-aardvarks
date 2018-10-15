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

{ #category : #generators }
Board class >> generateRandomSpaceDistributionWithSpaces:aQuantity [
	| generator |
	generator := SpacesGenerator spaces: aQuantity.
	^ generator generateSpaceDistribution
]

{ #category : #'instance creation' }
Board class >> playedBy: aPlayersCollection composedBy: aSpacesCollection [
	^ self new initializePlayedBy: aPlayersCollection initializeComposedBy: aSpacesCollection
]

{ #category : #'instance creation' }
Board class >> playedBy: aPlayersCollection spaces: aQuantity [
	| spacesCollection |
	spacesCollection := self generateRandomSpaceDistributionWithSpaces: aQuantity.
	^ self new initializePlayedBy: aPlayersCollection initializeComposedBy: spacesCollection
]

{ #category : #determine }
Board >> determineLapsOf: aPlayer withARollOf: aQuantity [
	| apparentPosition lapsCount |
	apparentPosition := playerPositions positionOf: aPlayer + aQuantity.
	lapsCount := (apparentPosition / spaces elements size) abs.
	apparentPosition > spaces elements size
		ifTrue: [ ^ lapsCount ].
	apparentPosition < 1
		ifTrue: [ ^ lapsCount negated - 1 ].
	(apparentPosition < spaces elements size & apparentPosition) >= 1
		ifTrue: [ ^ 0 ]
]

{ #category : #determine }
Board >> determinePositionOf: aPlayer withARollOf: aQuantity [
	| apparentPosition |
	apparentPosition := playerPositions positionOf: aPlayer + aQuantity.
	apparentPosition > spaces elements size
		ifTrue: [ ^ apparentPosition rem: spaces elements size ].
	apparentPosition < 1
		ifTrue: [ ^ spaces elements size + apparentPosition ].
	(apparentPosition < spaces elements size & apparentPosition) >= 1
		ifTrue: [ ^apparentPosition ].
	
]

{ #category : #initialization }
Board >> initializePlayedBy: aPlayersCollection initializeComposedBy: aSpacesCollection [
	spaces := aSpacesCollection.
	playerPositions := PlayerPositions players: aPlayersCollection
]

{ #category : #action }
Board >> move: aPlayer by: aQuantity [
	| lapsToAdd newPosition |
	newPosition := self determinePositionOf: aPlayer withARollOf: aQuantity.
	lapsToAdd := self determineLapsOf: aPlayer withARollOf: aQuantity.
	
	playerPositions updatePositionAndLapsOf: aPlayer to: newPosition adding: lapsToAdd.
	
]

{ #category : #action }
Board >> moveAllExcept: aPlayer by: aValue [
	| otherPlayers |
	otherPlayers := playerPositions collect: [ :each | (each player ~= aPlayer) player ].
	otherPlayers do: [ :each | self move: each by: aValue ]
]

{ #category : #action }
Board >> moveAllToInitialPosition [
	playerPositions updateAllPlayersToInitialPosition.
]

{ #category : #action }
Board >> moveAndAffect: aPlayer by: aValue [
	| space |
	self move: aPlayer by: aValue.
	space := spaces at: (playerPositions positionOf: aPlayer).
	space affect: aPlayer on: self
]

{ #category : #accessing }
Board >> playerPositions [
	^ playerPositions
]
