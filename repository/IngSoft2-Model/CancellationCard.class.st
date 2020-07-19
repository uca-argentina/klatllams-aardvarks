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
	owner:		<Object>


    Implementation Points
"
Class {
	#name : #CancellationCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #affecting }
CancellationCard >> addACardOn: aBoard affecting: aCard [ 
	^ self affect: aCard on: aBoard.
]

{ #category : #affecting }
CancellationCard >> affect: card on: aBoard [
	self cancel: card on: aBoard.
]

{ #category : #asserting }
CancellationCard >> assertCanCancelAnotherCard [
]

{ #category : #affecting }
CancellationCard >> cancel: card on: aBoard [
	aBoard removeAnActive: card
]

{ #category : #asserting }
CancellationCard >> isTransient [
	^ true
]
