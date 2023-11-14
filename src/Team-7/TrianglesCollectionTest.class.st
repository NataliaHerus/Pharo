Class {
	#name : 'TrianglesCollectionTest',
	#superclass : 'TestCase',
	#category : 'Team-7',
	#package : 'Team-7'
}

{ #category : 'tests' }
TrianglesCollectionTest >> testAddFirst [

	| triangle1 triangle2 regularTriangle3 triangles |
	
	triangle1 := Triangle new.
	triangle2 := Triangle new.
	regularTriangle3 := RegularTriangle  new.
	
	triangles := TrianglesCollection  new addAll: { Triangle new . RegularTriangle new }; yourself.
	triangles addFirst: triangle1.
	self assert: (triangles at: 1) equals: triangle1.
	self assert: (triangles size) equals: 3.
	triangles addFirst: triangle2.
	self assert: (triangles at: 1) equals: triangle2.
	self assert: (triangles size) equals: 4.
]

{ #category : 'tests' }
TrianglesCollectionTest >> testAt [

	| triangle1 triangle2 regularTriangle3 triangles |
	
	triangle1 := Triangle new.
	triangle2 := Triangle new.
	regularTriangle3 := RegularTriangle  new.
	
	triangles := TrianglesCollection  new.
	triangles addFirst: triangle1.
	self assert: (triangles at: 1) equals: triangle1.
	
	triangles addFirst: triangle2.
	self assert: (triangles at: 1) equals: triangle2.
	self assert: (triangles at: 2) equals: triangle1.
	
	triangles addFirst: regularTriangle3.
	self assert: (triangles at: 1) equals: regularTriangle3.
	self assert: (triangles at: 2) equals: triangle2.
	self assert: (triangles at: 3) equals: triangle1.
	
	self should: [ triangles at: 5 ] raise: Error.
]

{ #category : 'tests' }
TrianglesCollectionTest >> testAtPut [

	| triangle1 triangle2 regularTriangle3 triangles |
	
	triangle1 := Triangle new.
	triangle2 := Triangle new.
	regularTriangle3 := RegularTriangle  new.
	
	triangles := TrianglesCollection new addAll: { Triangle new . RegularTriangle  new }; yourself.
	self assert: (triangles at: 1 put: triangle1) equals: triangle1.
	self assert: (triangles at: 1) equals: triangle1.
	self assert: (triangles at: 2 put: triangle2) equals: triangle2.
	self should: [ triangles at: 5 put: Triangle new] raise: Error.
	self
		should: [ triangles at: 1 put: 2@5 ]
		raise: Error
]

{ #category : 'tests' }
TrianglesCollectionTest >> testInitialize [ 

	self assert: TrianglesCollection new size equals: 0
]
