Class {
	#name : #ActiveCards,
	#superclass : #CardStack,
	#instVars : [
		'cards',
		'usedCards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #adding }
ActiveCards >> add: aCard [
	cards add: aCard.
]

{ #category : #initialization }
ActiveCards >> initialize [
	cards := OrderedCollection new.
	usedCards := UsedCards new.
]

{ #category : #adding }
ActiveCards >> remove: aCard [
	usedCards add: aCard.
	cards remove: aCard
]
