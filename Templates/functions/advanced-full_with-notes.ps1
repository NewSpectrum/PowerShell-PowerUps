function New-AdvFunction {
	[CmdletBinding()] # 'CmdletBinding' provides 'Common Parameters'
	param(
		[Parameter(Mandatory=$True,
		           Position=0, #Parameter can be used without being named
				   # HelpMessage="Optional Help Info",
				   ParameterSetName="Defaults",
				   ValueFromPipeline=$True,
				   ValueFromPipelineByPropertyName=$True)]
		[ValidateNotNullOrEmpty()] #Only use for 'Mandatory' Params
		[SupportsWildcards] #Permits the use of '*' and '?'
		[Alias("S","String")] #Now '-S' = '-StringParam'
		[string]$StringParam, 
		# Don't forget the ',' if adding multiple Parameters to the same 'param()' block- which is important to do for the automated 'Syntax' in 'Get-Help'
		# See Wiki for more info (bottom)
		
		
		#!! Important: The '[Parameter()]' properties are PER $PARAMETER not per 'param()' block, and must be declared for each $param if you want the settings to actually apply
		[Parameter(Mandatory=$False,
				   # HelpMessage="Optional Help Info",
				   ParameterSetName="Defaults",
				   ValueFromPipeline=$True,
				   ValueFromPipelineByPropertyName=$True)]
		[SupportsWildcards] #Permits the use of '*' and '?'
		[Alias("A","Array")]
		[string[]]$ArrayParam #Array Input Example:
		#... -Array Item01, 'Second Item', Item-03 -Verbose...
		# See Wiki or enter one of the following Help commands:
			# "Get-Help 'Format-Table' -Parameter 'Parameter'"
			# "Get-Help about_Parameters" (look for <string[]>)

		[Parameter(Mandatory=$False,
				   HelpMessage=$Null,
				   ParameterSetName="Defaults",
				   ValueFromPipeline=$False,
				   ValueFromPipelineByPropertyName=$False)]
		[Alias("B","Bool")]
		[switch]$SwitchParam #aka Boolean. Takes '$True' or '$False'
	)
	
	
	#★ Begin Process Block
	begin {
	<#	- Typically used to prep for the 'Main Process Block'
			? Declare variables, arrays, hash tables, PSCustomObjects
			? Check for (and maybe correct) various conditions with if/else
			? Establish temporary environment conditions
			? Setup specific logging & error handling directives
	#>
	}
	
	#★ Main Process Block
	process {
		#- The primary focus of the function
	}
	
	#★ End Process Block
	end {
	<#	- Generally used for 'cleaning up' & error handling
			? Remove temporary files & folders from the process
			? Send logs/reports & delete (if user doesn't need them)
			? Run final checks on permissions, etc
	#>
	}



<#
See Wiki or 
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