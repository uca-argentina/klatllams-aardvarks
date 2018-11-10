Class {
	#name : #InactiveCards,
	#superclass : #CardStack,
	#instVars : [
		'cards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #adding }
InactiveCards >> add: aCard [
	cards add: aCard.
]

{ #category : #accessing }
InactiveCards >> cards [
	^ cards
]

{ #category : #initialization }
InactiveCards >> initialize [
	cards := OrderedCollection new
]
