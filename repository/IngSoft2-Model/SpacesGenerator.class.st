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
	spaces:		<Object>


    Implementation Points
"
Class {
	#name : #SpacesGenerator,
	#superclass : #Object,
	#instVars : [
		'spacesQuantity',
		'spaces'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
SpacesGenerator class >> spacesQuantity: aQuantity [
	^ self new initializeWithSpaces: aQuantity
]

{ #category : #generators }
SpacesGenerator >> generateAtomicBombSpaces [
	| spaces quantity |
	spaces := OrderedCollection new.
	quantity := spacesQuantity * 0.02 floor.
	(1 to: quantity) do: [ :i | spaces add: AtomicBombSpace new ].
	^ spaces
]

{ #category : #generators }
SpacesGenerator >> generateMoonWalkSpaces [
	| spaces quantity |
	spaces := OrderedCollection new.
	quantity := spacesQuantity * 0.1 floor.
	(1 to: quantity) do: [ :i | spaces add: (MoonWalkSpace backwardsRandom ) ].
	^ spaces
]

{ #category : #generators }
SpacesGenerator >> generateNoEffectSpacesWith: spacesRemaining [
	| spaces |
	spaces := OrderedCollection new.
	(1 to: spacesRemaining) do: [ :i | spaces add: NoEffectSpace new ].
	^ spaces
]

{ #category : #generators }
SpacesGenerator >> generateRandomDistributionWith: allSpaces. [
	
]

{ #category : #generators }
SpacesGenerator >> generateSpaceDistribution [
	| noEffectSpaces moonWalkSpaces atomicBombSpaces speedUpSpaces wormHoleSpaces spacesRemaining allSpaces |
	wormHoleSpaces := self generateWormHoleSpaces.
	atomicBombSpaces := self generateAtomicBombSpaces.
	moonWalkSpaces := self generateMoonWalkSpaces.
	speedUpSpaces := self generateSpeedUpSpaces.
	spacesRemaining := spacesQuantity - wormHoleSpaces size - atomicBombSpaces size
		- moonWalkSpaces size - speedUpSpaces size.
	noEffectSpaces := self generateNoEffectSpacesWith: spacesRemaining.
	allSpaces := {wormHoleSpaces.
	atomicBombSpaces.
	moonWalkSpaces.
	speedUpSpaces.
	noEffectSpaces}.
	
	spaces := self generateRandomDistributionWith: allSpaces.
	
]

{ #category : #generators }
SpacesGenerator >> generateSpeedUpSpaces [
	| spaces quantity |
	spaces := OrderedCollection new.
	quantity := spacesQuantity * 0.2 floor.
	(1 to: quantity) do: [ :i | spaces add: SpeedUpSpace new ].
	^ spaces
]

{ #category : #generators }
SpacesGenerator >> generateWormHoleSpaces [
	| spaces quantity |
	spaces := OrderedCollection new.
	quantity := spacesQuantity * 0.2 floor.
	(1 to: quantity) do: [ :i | spaces add: WormHoleSpace new ]
]

{ #category : #initialization }
SpacesGenerator >> initializeWithSpaces: aQuantity [
	spacesQuantity := aQuantity
]
