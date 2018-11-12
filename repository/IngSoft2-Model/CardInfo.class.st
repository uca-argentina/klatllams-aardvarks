Class {
	#name : #CardInfo,
	#superclass : #Object,
	#instVars : [
		'card',
		'affectedPlayer'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
CardInfo class >> with: aCard affecting: aPlayerCollection [
	^ self new initializeWith: aCard affecting: aPlayerCollection
]

{ #category : #accessing }
CardInfo >> affectedPlayer: aPlayer [
	^ affectedPlayer contains: aPlayer
]

{ #category : #accessing }
CardInfo >> card [
	^ card
]

{ #category : #initialization }
CardInfo >> initializeWith: aCard affecting: aPlayerCollection [
	card := aCard.
	affectedPlayer := aPlayerCollection
]
