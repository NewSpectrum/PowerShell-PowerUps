function Get-ParamHelp {
	[CmdletBinding()]
	param(
		[Parameter(Mandatory=$False,
		           Position=0,
				   ParameterSetName="Defaults",
				   ValueFromPipeline=$True,
				   ValueFromPipelineByPropertyName=$True)]
		[Alias("N")]
		[string]$Name,
		
		[Parameter(Mandatory=$False,
				   ParameterSetName="Defaults",
				   ValueFromPipeline=$True,
				   ValueFromPipelineByPropertyName=$True)]
		[SupportsWildcards]
		[Alias("PN")]
		[string]$ParameterName,
		
		[Parameter(Mandatory=$False,
				   ParameterSetName="Search Options",
				   ValueFromPipeline=$False,
				   ValueFromPipelineByPropertyName=$False)]
		[SupportsWildcards]
		[Alias("Fuzzy")]
		[switch]$SuggestedResults,
		
	)
	
	param(
		[Parameter(Mandatory=$False,
				   ParameterSetName="Defaults",
				   ValueFromPipeline=$True,
				   ValueFromPipelineByPropertyName=$True)]
		[SupportsWildcards]
		[Alias("CN")]
		[string]$CmdletName,
		
		[Parameter(Mandatory=$False,
				   ParameterSetName="Defaults",
				   ValueFromPipeline=$True,
				   ValueFromPipelineByPropertyName=$True)]
		[SupportsWildcards]
		[Alias("PN")]
		[string]$ParameterName,
		
	)
	
	
	#★ Begin Process Block
	begin {
		
	}
	
	#★ Main Process Block
	process {
		#- The primary focus of the function
	}
	
	#★ End Process Block
	end {
		
	}



<#
.SYNOPSIS
	One-Sentence Summary.

.DESCRIPTION
	Short pararagraph summary.

.PARAMETER Param
	Param Description

.PARAMETER Param
	Param Description

.PARAMETER Param
	Param Description

.NOTES
	Extra Details.

.EXAMPLE 
	Example
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