Class {
	#name : #RedoCard,
	#superclass : #Card,
	#instVars : [
		'lastCard'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #affecting }
RedoCard >> affect: aPlayer on: aBoard [
	lastCard affect: aPlayer on: aBoard
]

{ #category : #asserting }
RedoCard >> assertIsATransientCard [
	^ true
]

{ #category : #updating }
RedoCard >> lastCardPlayed: aCard [
	lastCard := aCard 
]
