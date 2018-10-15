Class {
	#name : #Space,
	#superclass : #Object,
	#instVars : [
		'boardPosition',
		'board'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #action }
Space >> affect: aPlayer [
 	^self subclassResponsibility
]

{ #category : #initialization }
Space >> initializeAt: aPosition in: aBoard [
	boardPosition := aPosition.
	board := aBoard.

]
