Class {
	#name : 'ClIssue',
	#superclass : 'Object',
	#instVars : [
		'data',
		'createdAt',
		'number',
		'title',
		'closedAt'
	],
	#category : 'ClaudeIssues-Model',
	#package : 'ClaudeIssues',
	#tag : 'Model'
}

{ #category : 'accessing' }
ClIssue >> closedAt: closed [ 
	closedAt := closed
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

{ #category : 'accessing' }
ClIssue >> number: aNumber [
	number := aNumber
]

{ #category : 'accessing' }
ClIssue >> title: aString [
	title:= aString
]
