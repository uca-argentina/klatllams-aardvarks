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
		'facesQuantity',
		'type'
	],
	#classInstVars : [
		'facesQuantity'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
Dice class >> assertIsValid: aType withFaces: aQuantity [
	(aType isKindOf: DeterministicType)
		ifTrue: [ aType assertValidSequence: aQuantity ]
]

{ #category : #asserting }
Dice class >> assertValidFaces:aQuantity [
	aQuantity > 24
		ifTrue: [ AssertionFailure signal: 'Faces must be less than 25' ].
	aQuantity < 4
		ifTrue: [ AssertionFailure signal: 'Faces must be more than 3' ].
]

{ #category : #'instance creation' }
Dice class >> faces: aQuantity [
	"Set RandomType as Default if not specified"

	^self faces: aQuantity ofType: RandomType new

]

{ #category : #'instance creation' }
Dice class >> faces: aQuantity ofType: aType [ 
	self assertValidFaces: aQuantity.
	self assertIsValid: aType withFaces: aQuantity. 
	^ self new initializeWithFaces: aQuantity initializeWithType: aType
]

{ #category : #action }
Dice >> deterministicRoll: aRollValue [
	^ aRollValue
]

{ #category : #'instance initialization' }
Dice >> initializeWithFaces: aQuantity initializeWithType: aType [
	facesQuantity := aQuantity.
	type := aType
]

{ #category : #action }
Dice >> randomRoll [
	^ (1 to: facesQuantity) atRandom
]

{ #category : #accesing }
Dice >> roll [
	^ type roll: self
]

{ #category : #accessing }
Dice >> type [
	^ type
]
