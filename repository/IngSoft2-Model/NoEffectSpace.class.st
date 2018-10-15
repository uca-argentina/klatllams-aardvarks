Class {
	#name : #NoEffectSpace,
	#superclass : #Space,
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
NoEffectSpace class >> with: aBoardPosition [
	^self new initializeAtABoardPosition: aBoardPosition.
]

{ #category : #action }
NoEffectSpace >> affect: aPlayer [
	board move: aPlayer by: 0
]
