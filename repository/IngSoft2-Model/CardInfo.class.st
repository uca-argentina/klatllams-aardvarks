Class {
	#name : #CardInfo,
	#superclass : #Object,
	#instVars : [
		'card',
		'affectedPlayer'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
CardInfo class >> with: aCard affecting: aPlayer [
	^ self new initializeWith: aCard affecting: aPlayer
]

{ #category : #initialization }
CardInfo >> affect [
	card affect: affectedPlayer .
]

{ #category : #accessing }
CardInfo >> affectedPlayer [
	^affectedPlayer 
]

{ #category : #accessing }
CardInfo >> card [
	^card.
]

{ #category : #initialization }
CardInfo >> initializeWith: aCard affecting: aPlayer [
	card := aCard.
	affectedPlayer := aPlayer
]
