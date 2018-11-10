Class {
	#name : #RepeatCard,
	#superclass : #Card,
	#instVars : [
		'ownedBy'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
RepeatCard class >> ownedBy: aPlayer [
	^self new initializeOwnedBy: aPlayer
]

{ #category : #affecting }
RepeatCard >> affect: aPlayer [
]

{ #category : #initialization }
RepeatCard >> initializeOwnedBy: aPlayer [ 
	ownedBy := aPlayer.
	
]

{ #category : #accessing }
RepeatCard >> ownedBy [
	^ ownedBy
]
