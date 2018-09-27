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
		'state'
	],
	#classInstVars : [
		'facesQuantity'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Dice class >> facesQuantity: aQuantity [
	aQuantity > 24
		ifTrue: [ AssertionFailure signal: 'Faces must be less than 25' ].
	aQuantity < 4
		ifTrue: [ AssertionFailure signal: 'Faces must be more than 3' ].
	^ self new initializeWithFacesQuantity: aQuantity
]

{ #category : #'instance creation' }
Dice class >> facesQuantity: aQuantity state: aState [
	^ self new initializeWithFacesQuantity: aQuantity initializeWithState: aState
]

{ #category : #action }
Dice >> deterministicStateRoll [
	^ 4
]

{ #category : #accesing }
Dice >> faces [
	^ 1 to: facesQuantity
]

{ #category : #accesing }
Dice >> facesQuantity [
	^ facesQuantity
]

{ #category : #'instance initialization' }
Dice >> initializeWithFacesQuantity: aQuantity [
	facesQuantity := aQuantity.
	state := RandomDiceState new
]

{ #category : #'instance initialization' }
Dice >> initializeWithFacesQuantity: aQuantity initializeWithState: aState [
	facesQuantity := aQuantity.
	state := aState
]

{ #category : #action }
Dice >> randomStateRoll [
	^ (1 to: facesQuantity) atRandom
]

{ #category : #accesing }
Dice >> roll [
	^ self state roll: self
]

{ #category : #accesing }
Dice >> state [
	^ state
]
