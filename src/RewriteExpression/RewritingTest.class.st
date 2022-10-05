Class {
	#name : #RewritingTest,
	#superclass : #TestCase,
	#category : #RewriteExpression
}

{ #category : #tests }
RewritingTest >> testSumInject [
	 |firstExpSum injectSum class|
	class:=RewriteExpression new.
	firstExpSum:= class firstExpression.
	injectSum :=  class injectExpression  .
		self assert: (firstExpSum) equals: injectSum.
]

{ #category : #tests }
RewritingTest >> testSumIteration [
	 |firstExpSum myExpSum class|
	class:=RewriteExpression new.
	firstExpSum:= class firstExpression.
	myExpSum :=  class myExpression .
		self assert: (firstExpSum) equals: myExpSum.
]
