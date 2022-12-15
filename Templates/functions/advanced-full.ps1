function New-AdvFunction {
	[CmdletBinding]
	param(
		[Parameter(Mandatory=$True,
		           Position=0,
				   HelpMessage=$Null,
				   ParameterSetName="Defaults",
				   ValueFromPipeline=$True,
				   ValueFromPipelineByPropertyName=$True)]
		[ValidateNotNullOrEmpty()]
		[SupportsWildcards]
		[Alias("S","String")]
		[string]$StringParam, 
		
		[Parameter(Mandatory=$False,
				   HelpMessage=$Null,
				   ParameterSetName="Defaults",
				   ValueFromPipeline=$True,
				   ValueFromPipelineByPropertyName=$True)]
		[SupportsWildcards]
		[Alias("A","Array")]
		[string[]]$ArrayParam,
		
		[Parameter(Mandatory=$False,
				   HelpMessage=$Null,
				   ParameterSetName="Defaults",
				   ValueFromPipeline=$False,
				   ValueFromPipelineByPropertyName=$False)]
		[Alias("B","Bool")]
		[switch]$SwitchParam
	)
	
	
	#★ Begin Process Block
	begin {
		#
	}
	
	#★ Main Process Block
	process {
		#
	}
	
	#★ End Process Block
	end {
		#
	}



<#
.SYNOPSIS
One-Sentence Summary.

.DESCRIPTION
Short pararagraph summary.

.PARAMETER Name
Name Description

.PARAMETER Date
Date Description

.NOTES
Extra Details.

.EXAMPLE 
New-Function -Name 'Cement'

.EXAMPLE 
New-Function -Name 'Bacon' -Date 'Today'

.ROLE
[ name of the 'user role' for the help topic ]
(optional)

.FUNCTIONALITY
[ keyword(s) describing the intended function ]
(optional)

.FORWARDHELPCATEGORY
Function

.FORWARDHELPTARGETNAME
Command-Name (optional)

.LINK
https://github.com/NewSpectrum/PowerShell-PowerUps/wiki
.LINK
Related-Function
.LINK
Related-Cmdlet
.LINK
about_Related_Content
#>
}