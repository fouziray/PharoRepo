Class {
	#name : #Liste,
	#superclass : #Object,
	#instVars : [
		'tete',
		'fin'
	],
	#category : #ListeChainee
}

{ #category : #utilities }
Liste >> deleteNode: valueToDelete [
	"deletes first occurence of a node containing the value to delete "
			
	| currentNode previousNode |
	currentNode := tete.
	previousNode :=currentNode .
	currentNode valeur = valueToDelete
	  ifTrue: [ tete := currentNode suivant .
					previousNode := currentNode.]
	  ifFalse: [ 
			[ previousNode suivant isNotNil ] whileTrue: [ 
			currentNode valeur = valueToDelete ifTrue: [ previousNode suivant: currentNode suivant ].
			previousNode := currentNode.
			currentNode := currentNode suivant 
			].
		 ].
	^previousNode .
	
]

{ #category : #'as yet unclassified' }
Liste >> inserer: noeud [
	| refneoud |
    refneoud := noeud.
    fin ifNotNil: [ fin suivant: refneoud ].
    tete ifNil: [ tete := refneoud ].
    fin := refneoud.
    ^ refneoud
]

{ #category : #'as yet unclassified' }
Liste >> premier [
	^ tete
	
]
