Class {
	#name : 'ClIssue',
	#superclass : 'Object',
	#instVars : [
		'data',
		'createdAt',
		'number',
		'title',
		'closedAt',
		'labels',
		'comments'
	],
	#category : 'ClaudeIssues-Model',
	#package : 'ClaudeIssues',
	#tag : 'Model'
}

{ #category : 'as yet unclassified' }
ClIssue >> addLabel: aLabel [
	labels add: aLabel
]

{ #category : 'accessing' }
ClIssue >> closedAt [
	^ closedAt
]

{ #category : 'accessing' }
ClIssue >> closedAt: closed [ 
	closedAt := closed
]

{ #category : 'accessing' }
ClIssue >> comments [
	^ comments
]

{ #category : 'accessing' }
ClIssue >> comments: anObject [
	comments := anObject
]

{ #category : 'accessing' }
ClIssue >> createdAt [
	^ createdAt
]

{ #category : 'accessing' }
ClIssue >> createdAt: aZTimestamp [
	createdAt:= aZTimestamp
]

{ #category : 'accessing' }
ClIssue >> data [
	^ data
]

{ #category : 'accessing' }
ClIssue >> data: anObject [
	data := anObject
]

{ #category : 'as yet unclassified' }
ClIssue >> initialize [
	labels := OrderedCollection new.
	comments := OrderedCollection new
]

{ #category : 'accessing' }
ClIssue >> labels [
	^ labels
]

{ #category : 'accessing' }
ClIssue >> labels: anObject [
	labels := anObject
]

{ #category : 'accessing' }
ClIssue >> number [
	^ number
]

{ #category : 'accessing' }
ClIssue >> number: aNumber [
	number := aNumber
]

{ #category : 'accessing' }
ClIssue >> title [
	^ title
]

{ #category : 'accessing' }
ClIssue >> title: aString [
	title:= aString
]
