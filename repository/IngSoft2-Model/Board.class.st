Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'playerPositions',
		'spaces'
	],
	#category : #'IngSoft2-Model'
}

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
	space affect: aPlayer
]

{ #category : #accessing }
Board >> playerPositions [
	^ playerPositions
]
