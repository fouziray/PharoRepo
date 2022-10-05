Class {
	#name : #RewriteExpression,
	#superclass : #Object,
	#category : #RewriteExpression
}

{ #category : #accessing }
RewriteExpression >> firstExpression [
	| sum |
	sum := 0.
	#(21 23 53 66 87) do: [:item | sum := sum + item].
	^sum
]

{ #category : #'as yet unclassified' }
RewriteExpression >> injectExpression [
	
	
	^#(21 23 53 66 87) inject: 0 into: [:sum :item |  sum + item].

	
]

{ #category : #'as yet unclassified' }
RewriteExpression >> myExpression [
	| sum liste|
	liste:=#(21 23 53 66 87).
	
	sum := 0.
	1 to: liste size do: [ :i | sum:=sum+liste at: i].
	^sum
]
