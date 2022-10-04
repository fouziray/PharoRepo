"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestListeChaineeTests,
	#superclass : #PackageManifest,
	#category : #'ListeChainee-Tests-Manifest'
}

{ #category : #'code-critics' }
ManifestListeChaineeTests class >> ruleSendsUnknownMessageToGlobalRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#InsererTest #testAddElement #false)) #'2022-09-24T01:03:05.527662+01:00') )
]
