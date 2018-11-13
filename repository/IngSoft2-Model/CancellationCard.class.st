Class {
	#name : #CancellationCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #affecting }
CancellationCard >> affect: card on: aBoard [
	aBoard removeAnActive: card
]

{ #category : #asserting }
CancellationCard >> assertIsATransientCard [
	^ true
]
