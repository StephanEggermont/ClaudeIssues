Class {
	#name : 'CILabeledIssueGroupLeaf',
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
CILabeledIssueGroupLeaf >> gtCombinedView: aView [
	<gtView>
	^ GtPhlowView empty explicit 
		title: 'Combined';
		priority: 20;
		object: self argument: GtPhlowView empty;
		stencil: [ |pane table|
			pane := BrVerticalPane new 
"			background: Color lightYellow;
"			constraintsDo: [ :c | 
				c horizontal matchParent.
				c vertical matchParent.
				c padding: (BlInsets all: 2) ].
			table := BrColumnedList new.
			table column 
				title: 'Nr' translated;
				width: 40;
				cellStencil: [ :each | BrLabel new aptitude: BrGlamorousLabelAptitude new ];
				dataBinder: [ :aLabel :eachIssue |
					aLabel text: (eachIssue number)].
			table column 
				title: 'Title' translated;
				width: 450;
				cellStencil: [ :each | BrLabel new aptitude: BrGlamorousLabelAptitude new ];
				dataBinder: [ :aLabel :eachIssue |
					aLabel text: (eachIssue title)].
			table column 
				title: 'Created' translated;
				width: 50;
				cellStencil: [ :each | BrLabel new aptitude: BrGlamorousLabelAptitude new ];
				dataBinder: [ :aLabel :eachIssue |
					aLabel text: (eachIssue createdAt dayOfMonth)].
			table column 
				title: 'Closed' translated;
				width: 50;
				cellStencil: [ :each | BrLabel new aptitude: BrGlamorousLabelAptitude new ];
				dataBinder: [ :aLabel :eachIssue | |cl|
					cl := eachIssue closedAt.
					cl ifNil: [aLabel text: 'open']
					ifNotNil: [
						aLabel text: (eachIssue closedAt dayOfMonth)]].
			table
				addAptitude: BrColumnedListHeaderAptitude;
				items: self issueGroups.
			pane addChild: (BrLabel new 
				aptitude: BrGlamorousLabelAptitude new;
				text: label).
			pane addChild: table.
			
				 ]
]

{ #category : 'as yet unclassified' }
CILabeledIssueGroupLeaf >> gtIssuesView: aView [
	<gtView>
	^ aView columnedList
		title: 'Issues ',self label asString;
		priority: 10;
		items: [ issueGroups];
		column: 'Nr' text: [:each | each number]; 
		column: 'Title' text: [:each | each title]; 
		column: 'Created' text: [:each | each createdAt]; 
		column: 'Closed' text: [:each | each closedAt]; 
		column: '#Comments' text: [:each | each comments size]

]

{ #category : 'as yet unclassified' }
CILabeledIssueGroupLeaf >> inactiveClosed [
	^issueGroups count: [:issue | issue inactiveClosed]
]

{ #category : 'as yet unclassified' }
CILabeledIssueGroupLeaf >> initialize [
	issueGroups := OrderedCollection new
]

{ #category : 'accessing' }
CILabeledIssueGroupLeaf >> issueGroups [
	^ issueGroups
]

{ #category : 'accessing' }
CILabeledIssueGroupLeaf >> issueGroups: anObject [
	issueGroups := anObject
]

{ #category : 'accessing' }
CILabeledIssueGroupLeaf >> label [
	^ label
]

{ #category : 'accessing' }
CILabeledIssueGroupLeaf >> label: anObject [
	label := anObject
]

{ #category : 'as yet unclassified' }
CILabeledIssueGroupLeaf >> timeColorFor: resolvedGroup [
	|nrOfWeeks|
	nrOfWeeks := label.
	nrOfWeeks = -1 ifTrue: [ ^Color blue ].
	nrOfWeeks <= 4 ifTrue: [ ^Color green ].
	nrOfWeeks <= 12 ifTrue: [ ^Color yellow ].
	nrOfWeeks <= 52 ifTrue: [ ^Color orange ].
	^Color red .
]
