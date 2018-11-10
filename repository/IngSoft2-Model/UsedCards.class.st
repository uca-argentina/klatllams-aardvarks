Class {
	#name : #UsedCards,
	#superclass : #CardStack,
	#instVars : [
		'cards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
UsedCards >> initialize [
	cards := OrderedCollection new.
]
