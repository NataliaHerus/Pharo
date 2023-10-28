"
Representation of Triangle class
"
Class {
	#name : #Triangle,
	#superclass : #Object,
	#instVars : [
		'side1',
		'side2',
		'side3'
	],
	#category : #'Team-7'
}

{ #category : #'instance creation' }
Triangle class >> newA: a andB: b andC: c [
	^ self basicNew side1: a; side2: b; side3: c.
]

{ #category : #accessing }
Triangle >> area [
    "Повертає площу трикутника, використовуючи формулу Герона"
    | s p |
    s := (side1 + side2 + side3) / 2.
    p := s * (s - side1) * (s - side2) * (s - side3).
    ^ p sqrt.
]

{ #category : #initialization }
Triangle >> initialize [ 
	side1:=2.
	side2:=3.
	side3:=7.
]

{ #category : #accessing }
Triangle >> perimeter [
    "Повертає периметр трикутника"
    ^ side1 + side2 + side3.
]

{ #category : #printing }
Triangle >> print [
    "Метод для виведення трикутника на екран"
    self printOn: Transcript.
]

{ #category : #printing }
Triangle >> printOn: aStream [
    "Метод для виведення трикутника в потік"
    aStream nextPutAll: 'A Triangle ['.
	side1 printOn: aStream.
	aStream nextPut: $x.
	side2 printOn: aStream.
	aStream nextPut: $x.
	side3 printOn: aStream.
	aStream nextPut: $].
]

{ #category : #accessing }
Triangle >> side1 [
    "Повертає довжину першої сторони трикутника"
    ^ side1.
]

{ #category : #accessing }
Triangle >> side1: aNumber [

	side1 := 0.1 max: aNumber
]

{ #category : #accessing }
Triangle >> side2 [
    "Повертає довжину другої сторони трикутника"
    ^ side2.
]

{ #category : #accessing }
Triangle >> side2: aNumber [

	side2 := 0.1 max: aNumber
]

{ #category : #accessing }
Triangle >> side3 [
    "Повертає довжину другої сторони трикутника"
    ^ side3.
]

{ #category : #accessing }
Triangle >> side3: aNumber [

	side3 := 0.1 max: aNumber
]
