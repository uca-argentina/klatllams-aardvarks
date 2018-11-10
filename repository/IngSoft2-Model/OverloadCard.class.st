Class {
	#name : #OverloadCard,
	#superclass : #Card,
	#instVars : [
		'ownedBy'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
OverloadCard class >> ownedBy: aPlayer [
	^self new initializeOwnedBy: aPlayer
]

{ #category : #affecting }
OverloadCard >> affect: aPlayer [
]

{ #category : #initialization }
OverloadCard >> initializeOwnedBy: aPlayer [ 
	ownedBy := aPlayer.
	
]

{ #category : #accessing }
OverloadCard >> ownedBy [
	^ ownedBy
]
