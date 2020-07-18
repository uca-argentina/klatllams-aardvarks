"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestIngSoftModel,
	#superclass : #PackageManifest,
	#category : #'IngSoft2-Model-Manifest'
}

{ #category : #'code-critics' }
ManifestIngSoftModel class >> ruleRBNoClassCommentRuleV1FalsePositive [
	^ #(#(#(#RGPackageDefinition #(#'IngSoft2-Model')) #'2020-07-18T11:44:53.099943-03:00') )
]
