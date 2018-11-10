Class {
	#name : #CardSpace,
	#superclass : #Space,
	#instVars : [
		'cards'
	],
	#classInstVars : [
		'cards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #action }
CardSpace >> affect: aPlayer on: aBoard [
	aBoard inactiveCards add:( cards atRandom ownedBy: aPlayer)
	
]

{ #category : #initialization }
CardSpace >> initialize [
	cards := {AccelerationCard.
	CancellationCard.
	OverloadCard.
	RedoCard.
	RepeatCard.
	SpeedCard} asOrderedCollection
]
