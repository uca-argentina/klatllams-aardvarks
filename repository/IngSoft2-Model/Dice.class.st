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
	facesQuantity:		<Object>


    Implementation Points
"
Class {
	#name : #Dice,
	#superclass : #Object,
	#instVars : [
		'type'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
Dice class >> assertValidFaces:aQuantity [
	aQuantity > 24
		ifTrue: [ AssertionFailure signal: 'Faces must be less than 25' ].
	aQuantity < 4
		ifTrue: [ AssertionFailure signal: 'Faces must be more than 3' ].
]

{ #category : #'instance creation' }
Dice class >> faces: aQuantity [
	^ self faces: aQuantity ofType: (RandomType rollingUntil: aQuantity)
]

{ #category : #'instance creation' }
Dice class >> faces: aQuantity ofType: aType [ 
	self assertValidFaces: aQuantity.
	^ self new initializeWithType: aType
]

{ #category : #initialization }
Dice >> initializeWithType: aType [
	type := aType
]

{ #category : #action }
Dice >> roll [
	^ type roll
]
