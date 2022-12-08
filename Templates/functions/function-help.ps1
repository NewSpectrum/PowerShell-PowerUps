function New-CommentHelp {
	[CmdletBinding()]
	param(
		$Name
		$Date
		$Pizza
	)
	
	if ( '$Pizza' -contains 'pizza' ) {
		$PizzaFix = "$Pizza" -replace "(`s?Pizza)|(`s?pizza)"
		$Pizza = "$PizzaFix"
	}
	
	Write-Host -Object "${Name} had ${Pizza} Pizza on ${Date}"
	
	
<#
.SYNOPSIS
	One-Sentence Summary.

.DESCRIPTION
	Short pararagraph summary.

.PARAMETER Name
	$Name Description

.PARAMETER Date
	$Date Description

.PARAMETER Pizza
	$Pizza Description

.NOTES
	Extra Details.

.EXAMPLE 
	New-CommentHelp -Name 'Ferdinand' -Date '02/01/1531' -Pizza 'Pepperoni'
	[ details ]
	[ simulated output ]

.EXAMPLE 
	New-CommentHelp -Example
	[ details ]
	[ simulated output ]

.ROLE
	[ name of the 'user role' for the help topic ]
	(optional)

.FUNCTIONALITY
	[ keyword(s) describing the intended function ]
	(optional)

.COMPONENT
	(optional)

.INPUTS
	(optional)

.OUTPUTS
	(optional)

.FORWARDHELPCATEGORY Function
.FORWARDHELPTARGETNAME Command-Name (optional)

.LINK https://
.LINK Related-Function
.LINK Related-Cmdlet
.LINK about_Related_Content
#>
}