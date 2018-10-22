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

    Instance Variables
	backwardsValue:		<Object>


    Implementation Points
"
Class {
	#name : #MoonWalkSpace,
	#superclass : #Object,
	#instVars : [
		'backwardsValue'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
MoonWalkSpace class >> assertValidBackwardsValue: aQuantity [
	((aQuantity < 1)| (aQuantity > 10))
		ifTrue: [ AssertionFailure signal: 'Bad MoonWalk backwards value' ]
]

{ #category : #'instance creation' }
MoonWalkSpace class >> backwardsRandom [
	| aQuantity |
	aQuantity := self generateValidBackwardsValue.
	^ self new initializeWithBackwardsValue: aQuantity
]

{ #category : #'instance creation' }
MoonWalkSpace class >> backwardsValue: aQuantity [ 
	self assertValidBackwardsValue: aQuantity.
	^ self new initializeWithBackwardsValue: aQuantity
]

{ #category : #generators }
MoonWalkSpace class >> generateValidBackwardsValue [
	^ (1 to: 10) atRandom
]

{ #category : #action }
MoonWalkSpace >> affect: aPlayer on: board [ 
   board	moveAllExcept: aPlayer by: backwardsValue negated.
]

{ #category : #initialization }
MoonWalkSpace >> initializeWithBackwardsValue: aQuantity [
	backwardsValue := aQuantity
]
