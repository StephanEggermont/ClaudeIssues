Class {
	#name : 'CILabeledIssueGroup',
	#superclass : 'Object',
	#instVars : [
		'label',
		'issueGroups'
	],
	#category : 'ClaudeIssues-Model',
	#package : 'ClaudeIssues',
	#tag : 'Model'
}

{ #category : 'as yet unclassified' }
CILabeledIssueGroup >> gtResolveTimeOn: aView [
	<gtView>
	^ aView mondrian
		title: 'ResolveTime';
		priority: 10;
		painting: [ :aMondrian | 
			aMondrian nodes
			stencil: [ :labeledGroup | 
				GtMondrianUMLClassElement withDefaultContainer 
					label: (labeledGroup label);
					border: (BlBorder 
						paint: (Color black alpha: 0.5) width: 1)];
		      with: self issueGroups;
		      forEach: [ :week |
		      	aMondrian nodes
		      		stencil: [ :issue |
		      			BlElement new
		      				height: issue comments size ;
		      				width: issue comments size ;
		      				margin: (BlInsets all: 1);
		      				background: (issue closedAt  ifNil: [
		      					Color blue ]
		      				ifNotNil: [
		      					Color green])];
		      		with: (week issueGroups) .
		      		aMondrian layout grid].
		aMondrian layout grid.
		aMondrian]
]

{ #category : 'as yet unclassified' }
CILabeledIssueGroup >> initialize [
	issueGroups := OrderedDictionary new
]

{ #category : 'accessing' }
CILabeledIssueGroup >> issueGroups [
	^ issueGroups
]

{ #category : 'accessing' }
CILabeledIssueGroup >> issueGroups: anObject [
	issueGroups := anObject
]

{ #category : 'accessing' }
CILabeledIssueGroup >> label [
	^ label
]

{ #category : 'accessing' }
CILabeledIssueGroup >> label: anObject [
	label := anObject
]
