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
		'spacesQuantity'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
SpacesGenerator class >> spacesQuantity: aQuantity [
	^ self new initializeWithSpaces: aQuantity
]

{ #category : #generators }
SpacesGenerator >> generateAtomicBombSpaces [
	| atomicBombSpaces |
	atomicBombSpaces := OrderedCollection new.
	atomicBombSpaces add: AtomicBombSpace new withOccurrences: (spacesQuantity * 0.02) asFloat floor.
	^ atomicBombSpaces
]

{ #category : #generators }
SpacesGenerator >> generateMoonWalkSpaces [
 | moonWalkSpaces |
 moonWalkSpaces := OrderedCollection new.
 moonWalkSpaces add:MoonWalkSpace backwardsRandom withOccurrences:(spacesQuantity * 0.1) asFloat floor.
	^ moonWalkSpaces
]

{ #category : #generators }
SpacesGenerator >> generateNoEffectSpacesWith: spacesRemaining [
	| noEffectSpaces |
	noEffectSpaces := OrderedCollection new.
	noEffectSpaces add: NoEffectSpace new withOccurrences: spacesRemaining.
	^ noEffectSpaces
]

{ #category : #generators }
SpacesGenerator >> generateRandomDistributionWith: allSpaces [
	| randomNumber mixedSpaces |
	mixedSpaces := OrderedCollection new.
	[ mixedSpaces size < spacesQuantity ]
		whileTrue: [ randomNumber := (1 to: allSpaces size) atRandom.
			(allSpaces at: randomNumber) notEmpty
				ifTrue: [ mixedSpaces add: (allSpaces at: randomNumber) first.
					(allSpaces at: randomNumber) removeFirst ] ].
	^ mixedSpaces
]

{ #category : #generators }
SpacesGenerator >> generateSpaceDistribution [
   | noEffectSpaces moonWalkSpaces atomicBombSpaces speedUpSpaces wormHoleSpaces spacesRemaining       	allSpaces |
	
	wormHoleSpaces := self generateWormHoleSpaces.
	atomicBombSpaces := self generateAtomicBombSpaces.
	moonWalkSpaces := self generateMoonWalkSpaces.
	speedUpSpaces := self generateSpeedUpSpaces.
	
	spacesRemaining := spacesQuantity - wormHoleSpaces size - atomicBombSpaces size - 
	moonWalkSpaces size - speedUpSpaces size.
	
	noEffectSpaces := self generateNoEffectSpacesWith: spacesRemaining.
	
	allSpaces := {wormHoleSpaces.atomicBombSpaces.moonWalkSpaces.speedUpSpaces.noEffectSpaces}.
	
	^ self generateRandomDistributionWith: allSpaces asOrderedCollection
]

{ #category : #generators }
SpacesGenerator >> generateSpeedUpSpaces [
	| speedUpSpaces |
	speedUpSpaces := OrderedCollection new.
	speedUpSpaces add: SpeedUpSpace new withOccurrences: (spacesQuantity * 0.2) asFloat floor.
	^ speedUpSpaces
]

{ #category : #generators }
SpacesGenerator >> generateWormHoleSpaces [
	| wormHoleSpaces |
	wormHoleSpaces := OrderedCollection new.
	wormHoleSpaces add: WormHoleSpace new withOccurrences: (spacesQuantity * 0.2) asFloat floor.
	^ wormHoleSpaces
]

{ #category : #initialization }
SpacesGenerator >> initializeWithSpaces: aQuantity [
	spacesQuantity := aQuantity
]
