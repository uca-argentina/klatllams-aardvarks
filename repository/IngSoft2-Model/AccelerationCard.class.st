Class {
	#name : #AccelerationCard,
	#superclass : #Card,
	#instVars : [
		'ownedBy'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
AccelerationCard class >> ownedBy: aPlayer [
	^self new initializeOwnedBy: aPlayer
]

{ #category : #affecting }
AccelerationCard >> affect [
	^ 1
]

{ #category : #asserting }
AccelerationCard >> assertAffectsSinglePlayer [
	AssertionFailure signal:'This card affects all the players'
	
]

{ #category : #asserting }
AccelerationCard >> assertCardAffectAllThePlayers [
	
]

{ #category : #initialization }
AccelerationCard >> initializeOwnedBy: aPlayer [ 
	ownedBy := aPlayer.
	
]

{ #category : #accessing }
AccelerationCard >> ownedBy [
	^ ownedBy
]
