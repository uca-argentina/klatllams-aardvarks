Class {
	#name : #RandomCardGenerator,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #generators }
RandomCardGenerator class >> randomCardOwnedBy: aPlayer [ 
	^ {AccelerationCard.
	CancellationCard.
	OverloadCard.
	RedoCard.
	RepeatCard.
	SpeedCard} atRandom ownedBy: aPlayer.
]
