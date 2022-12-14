function Get-Params {
	[CmdletBinding()]
	param(
		[Parameter(Mandatory=$True,
		           Position=0,
				   ParameterSetName="Defaults",
				   ValueFromPipeline=$True,
				   ValueFromPipelineByPropertyName=$True,)]
		[Alias("N")]
		[string]$Name,
		
		[Parameter(Mandatory=$False,
		           Position=0,
				   ParameterSetName="Defaults",
				   ValueFromPipeline=$False,
				   ValueFromPipelineByPropertyName=$False,)]
		[Alias("P")]
		[string[]]$Params
	)
	
	if ( "${Params}" -eq $Null ) {
		$Params = "*"
	}
	
	try {
		Get-Help -Name "${Name}" -Parameter "${Params}"
	}
	catch {
		
	}
	
}

$AliasDesc = "The 'Get-Params' function. Gets the Parameter help info for any Cmdlet, Command, Script, Function, etc."

Set-Alias -Force -Name 'gph' -Value "Get-Params" -Description "${AliasDesc}"