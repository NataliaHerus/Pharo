Class {
	#name : #RegularTriangleTest,
	#superclass : #TestCase,
	#category : #'Team-7'
}

{ #category : #tests }
RegularTriangleTest >> testArea [
	
	| triangle |
	triangle := Triangle new.
	
	triangle side: 4.
	self assert: triangle area equals: (4 squared * (3 raisedTo: 0.5)) / 4.
	
	triangle side: 20.
	self assert: triangle area equals: (20 squared * (3 raisedTo: 0.5)) / 4.
	
	triangle side: 30.
	self assert: triangle area equals: (30 squared * (3 raisedTo: 0.5)) / 4.
	
	triangle side: 111.
	self assert: triangle area equals: (111 squared * (3 raisedTo: 0.5)) / 4.
]

{ #category : #tests }
RegularTriangleTest >> testPerimeter [
	
	| triangle |
	triangle := Triangle new.
	
	triangle side: 4.
	self assert: triangle area equals: 16.
	
	triangle side: 20.
	self assert: triangle area equals: 60.
	
	triangle side: 30.
	self assert: triangle area equals: 90.
	
	triangle side: 111.
	self assert: triangle area equals: 333.
]
