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
	rollSequence:		<Object>


    Implementation Points
"
Class {
	#name : #DeterministicType,
	#superclass : #Object,
	#instVars : [
		'rollSequence'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
DeterministicType class >> assertIsValid: aNumberSequence withDiceFaces: aQuantity [
		aNumberSequence elements detect: [ :each | each > aQuantity ]
		                   ifFound: [ AssertionFailure signal: 'Invalid Sequence' ]
	
]

{ #category : #'instance creation' }
DeterministicType class >> rolling: aNumberSequence faces: aQuantity [
     self assertIsValid: aNumberSequence withDiceFaces: aQuantity .
	^ self new initializeRolling: aNumberSequence
]

{ #category : #initialization }
DeterministicType >> initializeRolling: aNumberSequence [
	rollSequence:= aNumberSequence
]

{ #category : #action }
DeterministicType >> roll [
	^ rollSequence nextBy:1
]
