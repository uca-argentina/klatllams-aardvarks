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
Board >> move: aPlayer by: aQuantity [
	| newPosition |
	newPosition := playerPositions positionOf: aPlayer + aQuantity.
	"spaces at:newPosition effect:aPlayer"
	
]
