Class {
	#name : #CardTests,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
CardTests >> testAllKindsOfCardsCanBeCreated [
	AccelerationCard new.
	CancellationCard new.
	OverloadCard new.
	RedoCard new.
	RepeatCard new.
	SpeedCard new.
	
]
