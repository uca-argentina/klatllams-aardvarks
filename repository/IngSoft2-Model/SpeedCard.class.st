Class {
	#name : #SpeedCard,
	#superclass : #Card,
	#instVars : [
		'ownedBy'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
SpeedCard class >> ownedBy: aPlayer [
	^self new initializeOwnedBy: aPlayer
]

{ #category : #affecting }
SpeedCard >> affect [
	^ 1
]

{ #category : #initialization }
SpeedCard >> initializeOwnedBy: aPlayer [ 
	ownedBy := aPlayer.
	
]

{ #category : #accessing }
SpeedCard >> ownedBy [
	^ ownedBy
]
