Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'playerPositions',
		'spaces'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #updating }
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

{ #category : #updating }
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

{ #category : #updating }
Board >> move: aPlayer by: aQuantity [
	| lapsToAdd newPosition |
	newPosition := self determinePositionOf: aPlayer withARollOf: aQuantity.
	lapsToAdd := self determineLapsOf: aPlayer withARollOf: aQuantity.
	
	playerPositions updatePositionAndLapsOf: aPlayer to: newPosition adding: lapsToAdd.
	
]

{ #category : #updating }
Board >> moveAndAffect: aPlayer by: aValue [
	| space |
	self move: aPlayer by: aValue.
	space := spaces at: (playerPositions positionOf: aPlayer).
	space affect: aPlayer
]
