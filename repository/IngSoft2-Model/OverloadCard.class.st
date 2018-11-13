Class {
	#name : #OverloadCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #affecting }
OverloadCard >> affect: aPlayer on: aBoard [
	aBoard move: aPlayer by: 2 negated
]

{ #category : #asserting }
OverloadCard >> assertIsATransientCard [
	^ false
]
