"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".
For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #Card,
	#superclass : #Object,
	#instVars : [
		'owner'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Card class >> ownedBy: aPlayer [
	^ self new initializeOwnedBy: aPlayer.
]

{ #category : #affecting }
Card >> addACardOn: aBoard affecting: aPlayerOrCard [
	^ self subclassResponsibility .
]

{ #category : #affecting }
Card >> affect: arg1 on: aBoard [
	^ self subclassResponsibility
]

{ #category : #accessing }
Card >> assertAffectsOnePlayer: aPlayerCollection [
	aPlayerCollection asOrderedCollection size == 1
		ifFalse: [ ^ AssertionFailure
				signal: ' This card should affect only One Player' ]
]

{ #category : #asserting }
Card >> assertCanCancelAnotherCard [
	AssertionFailure signal: 'This card cannot cancel another card'
]

{ #category : #asserting }
Card >> assertCardNeedsLastCard: aCardsCollection [
	
]

{ #category : #affecting }
Card >> cancel: arg1 on: aBoard [
	^ AssertionFailure signal: 'This card cannot cancel another card'
]

{ #category : #initialization }
Card >> initializeOwnedBy: aPlayer [
	owner := aPlayer
]

{ #category : #asserting }
Card >> isPermanent [
	^ self isTransient not
]

{ #category : #asserting }
Card >> isTransient [
	^ self subclassResponsibility
]

{ #category : #accessing }
Card >> owner [
	^ owner
]
