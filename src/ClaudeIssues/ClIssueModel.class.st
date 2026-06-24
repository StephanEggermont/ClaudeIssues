Class {
	#name : 'ClIssueModel',
	#superclass : 'Object',
	#instVars : [
		'root',
		'issues'
	],
	#category : 'ClaudeIssues-Model',
	#package : 'ClaudeIssues',
	#tag : 'Model'
}

{ #category : 'as yet unclassified' }
ClIssueModel >> initialize [
	issues := OrderedCollection new
]

{ #category : 'accessing' }
ClIssueModel >> issues [
	^issues
]

{ #category : 'accessing' }
ClIssueModel >> read [
	| issuesJson |
	issuesJson := STONJSON fromString: root contents.
	issuesJson do: [:rawIssue | |issue|
		issue := ClIssue new
			data: rawIssue;
			yourself.
		self issues add: issue].
	
]

{ #category : 'accessing' }
ClIssueModel >> root: aFileReference [
	root := aFileReference
]
