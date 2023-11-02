Class {
	#name : #TriangleTest,
	#superclass : #TestCase,
	#category : #'Team-7'
}

{ #category : #tests }
TriangleTest >> testArea [

	self assert: (Triangle newA: 3 andB: 4 andC: 5) area equals: 6.
	self assert: (Triangle newA: 5 andB: 12 andC: 13) area equals: 30.
	self assert: (Triangle newA: 7 andB: 24 andC: 25) area equals: 84.
	self assert: (Triangle newA: 8 andB: 15 andC: 17) area equals: 60.
]

{ #category : #tests }
TriangleTest >> testInitialize [

	| triangle |
	triangle := Triangle new.
	self assert: triangle side1 equals: 2.
	self assert: triangle side2 equals: 3.
	self assert: triangle side3 equals: 7.
]

{ #category : #tests }
TriangleTest >> testPerimeter [

	self assert: (Triangle newA: 3 andB: 4 andC: 5) perimeter equals: 12.
	self assert: (Triangle newA: 5 andB: 12 andC: 13) perimeter equals: 30.
	self assert: (Triangle newA: 7 andB: 24 andC: 25) perimeter equals: 56.
	self assert: (Triangle newA: 8 andB: 15 andC: 17) perimeter equals: 40.
]
