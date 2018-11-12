Class {
	#name : #Card,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
Card >> assertAffectsSinglePlayer [
	
]

{ #category : #asserting }
Card >> assertCancellingProperty [
	AssertionFailure signal:'This card cannot cancel another card'
]

{ #category : #asserting }
Card >> assertCardAffectAllThePlayers [
	AssertionFailure signal: 'This card affects only 1 player'
]
