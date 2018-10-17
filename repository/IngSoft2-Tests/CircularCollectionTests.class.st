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
CircularCollectionTests >> testCircularCollectionCanBeInitializedAtASpecificPosition [
	| numbers |
	numbers := CircularCollection contains: #(1 2 3) startingAt:2.
	self assert: (numbers nextBy: -1) equals: 1;
		  assert: (numbers nextBy:1) equals: 2;
		  assert: (numbers nextBy:3) equals:2 ;
		  assert: (numbers nextBy:-3) equals: 2;
		  assert: (numbers nextBy:-1) equals: 1;
		  assert: (numbers nextBy:1) equals: 2
]

{ #category : #tests }
CircularCollectionTests >> testCircularCollectionCanReturnHowManyTurnsToTheCollectionHaveBeenDone [
	| numbers |
	numbers := CircularCollection contains: #(1 2 3 4 5).
	self assert: numbers turns equals:0;
		  assert: (numbers nextBy:6) equals: 1;
		  assert: numbers turns equals:1;
		  assert: (numbers nextBy:5) equals: 1;
		  assert: numbers turns equals:2;
		  assert: (numbers nextBy:-5) equals: 1;
		  assert: numbers turns equals:1;
     	  assert: (numbers nextBy:-5) equals: 1;
		  assert: numbers turns equals:0;
 		  assert: (numbers nextBy:-5) equals: 1;
		  assert: numbers turns equals:-1;
		  assert: (numbers nextBy:-5) equals: 1;
		  assert: numbers turns equals:-2;
		  assert: (numbers nextBy:20) equals: 1;
		  assert: numbers turns equals:2
]

{ #category : #tests }
CircularCollectionTests >> testCircularCollectionCanReturnThePreviousElement [
	| numbers |
	numbers := CircularCollection contains: #(1 2 3).
	self assert: (numbers nextBy:-1) equals: 3;
		  assert: (numbers nextBy:-1) equals: 2;
		  assert: (numbers nextBy:-1) equals: 1;
		  assert: (numbers nextBy:-1) equals: 3.	
]

{ #category : #tests }
CircularCollectionTests >> testCircularCollectionGoesBackToTheFirstPosition [
	| numbers |
	numbers := CircularCollection contains: #(1 2 3).
	self
		assert: (numbers nextBy:1) equals: 1;
		assert: (numbers nextBy:1) equals: 2;
		assert: (numbers nextBy:1) equals: 3;
		assert: (numbers nextBy:1) equals: 1
]

{ #category : #tests }
CircularCollectionTests >> testCircularCollectionGoesForwardAndbackwardsMoreThanOnePosition [
	| numbers |
	numbers := CircularCollection contains: #(1 2 3 4 5).
	self
		assert: (numbers nextBy:2) equals: 2;
		assert: (numbers nextBy:-3) equals: 4;
		assert: (numbers nextBy:2) equals: 1;
		assert: (numbers nextBy:4) equals: 5;
		assert: (numbers nextBy:-5) equals: 5;
		assert: (numbers nextBy:0) equals: 5;
		assert: (numbers nextBy:0) equals: 5
]
