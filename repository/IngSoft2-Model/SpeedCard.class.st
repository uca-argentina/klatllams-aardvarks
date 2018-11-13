Class {
	#name : #SpeedCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #affecting }
SpeedCard >> affect: aPlayer on: aBoard [
	aBoard move: aPlayer by: 1
]

{ #category : #asserting }
SpeedCard >> assertIsATransientCard [
	^ false
]
