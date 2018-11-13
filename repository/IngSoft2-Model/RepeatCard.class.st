Class {
	#name : #RepeatCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #affecting }
RepeatCard >> affect: aPlayer on: aBoard [
	| aPosition |
	aPosition := aBoard lastLandingPositionOf: aPlayer.
	aPosition ~= 0
		ifTrue: [ (aBoard spaces at: aPosition) affect: aPlayer on: aBoard ]
]

{ #category : #asserting }
RepeatCard >> assertIsATransientCard [
	^ true
]
