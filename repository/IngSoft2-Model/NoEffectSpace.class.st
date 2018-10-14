Class {
	#name : #NoEffectSpace,
	#superclass : #Object,
	#instVars : [
		'boardPosition',
		'board'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
NoEffectSpace class >> with: aBoardPosition [
	^self new initializeAtABoardPosition: aBoardPosition.
]

{ #category : #'as yet unclassified' }
NoEffectSpace >> affect: aPlayer [
	board move: aPlayer by: 0.
]

{ #category : #initialization }
NoEffectSpace >> initializeAt: aPosition in: aBoard [
	boardPosition := aPosition.
	board := aBoard.

]
