Class {
	#name : #SpacesGeneratorTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
SpacesGeneratorTest >> testGenerateAtomicBombSpacesReturns2PercentOfSpacesQuantitySize [
	| spacesGen |
	spacesGen := SpacesGenerator spacesQuantity: 100.
	self assert: ((spacesGen generateAtomicBombSpaces) size) equals: 2
]

{ #category : #tests }
SpacesGeneratorTest >> testGenerateMoonWalkSpacesReturns10PercentOfSpacesQuantitySize [
	| spacesGen |
	spacesGen := SpacesGenerator spacesQuantity: 100.
	self assert: ((spacesGen generateMoonWalkSpaces) size) equals: 10
]

{ #category : #tests }
SpacesGeneratorTest >> testGenerateNoEffectSpacesReturns48PercentOfSpacesQuantitySize [
	| spacesGen |
	spacesGen := SpacesGenerator spacesQuantity: 100.
	self assert: ((spacesGen generateNoEffectSpacesWith:48 ) size) equals: 48
]

{ #category : #tests }
SpacesGeneratorTest >> testGenerateSpaceDistributionReturns100SpacesQuantity [
	| spacesGen |
	spacesGen := SpacesGenerator spacesQuantity: 100.
	self assert: ((spacesGen generateSpaceDistribution) size) equals: 100
]

{ #category : #tests }
SpacesGeneratorTest >> testGenerateSpeedUpSpacesReturns20PercentOfSpacesQuantitySize [
	| spacesGen |
	spacesGen := SpacesGenerator spacesQuantity: 100.
	self assert: ((spacesGen generateSpeedUpSpaces) size) equals: 20
]

{ #category : #tests }
SpacesGeneratorTest >> testGenerateWormHoleSpacesReturns20PercentOfSpacesQuantitySize [
	| spacesGen |
	spacesGen := SpacesGenerator spacesQuantity: 100.
	self assert: ((spacesGen generateWormHoleSpaces) size) equals: 20
]
