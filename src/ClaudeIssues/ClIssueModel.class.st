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
	issuesJson do: [:rawIssue | |issue closed|
		closed := (rawIssue at: #closedAt).
		closed ifNotNil: [closed := closed asZTimestamp].
		issue := ClIssue new
			createdAt: (rawIssue at: #createdAt) asZTimestamp;
			closedAt:  closed;
			number: (rawIssue at: #number);
			title: (rawIssue at: #title);
			data: rawIssue;
			yourself.
		self issues add: issue].
	
]

{ #category : 'accessing' }
ClIssueModel >> root: aFileReference [
	root := aFileReference
]
