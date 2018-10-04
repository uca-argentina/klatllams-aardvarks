Class {
	#name : #CircularCollectionTests,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
CircularCollectionTests >> testAnEmptyCircularCollectionShouldRaiseAnException [
	self
		should: [ CircularCollection contains: #() ]
		raise: AssertionFailure
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'The collection is empty' ]
]

{ #category : #tests }
CircularCollectionTests >> testCircularCollectionGoesBackToTheFirstPosition [
	| numbers |
	numbers := CircularCollection contains: #(1 2 3).
	self
		assert: numbers next equals: 1;
		assert: numbers next equals: 2;
		assert: numbers next equals: 3;
		assert: numbers next equals: 1
]
