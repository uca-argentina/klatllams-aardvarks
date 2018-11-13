Class {
	#name : #AccelerationCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #affecting }
AccelerationCard >> affect: aPlayer on: aBoard [
	aBoard move: aPlayer by: 1
]

{ #category : #asserting }
AccelerationCard >> assertIsATransientCard [
	^ false
]
