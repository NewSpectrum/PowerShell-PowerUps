function Get-Params {
	[CmdletBinding()]
	param(
		[Parameter(Mandatory=$True,
		           Position=0,
				   ParameterSetName="Defaults",
				   ValueFromPipeline=$True,
				   ValueFromPipelineByPropertyName=$True)]
		[Alias("N")]
		[string]$Name,
		
		[Parameter(Mandatory=$False,
				   ParameterSetName="Defaults",
				   ValueFromPipeline=$False,
				   ValueFromPipelineByPropertyName=$False)]
		[Alias("P")]
		[string[]]$Params,
		
		[Parameter(Mandatory=$False,
				   ParameterSetName="Defaults",
				   ValueFromPipeline=$False,
				   ValueFromPipelineByPropertyName=$True)]
		[Alias("C")]
		[string[]]$Category
	)
	
	
	begin {
		if ( "${Params}" -eq $Null ) {
			$Params = "*"
		}
		
		$Valid = [PSCustomObject]@{
			Categories = @(
				"Cmdlet",
				"Function",
				"Script"
			)
		}
		
		if ( "$Esc" -eq $Null ) {
			$Esc = [PSCustomObject]@{
				Reset 		= "`e[0m"
				Br 			= "`n"
				Tab			= "`t"
				BrTab		= "`n`t"
				RsBr		= "`e[0m `n"
				RsBrTab		= "`e[0m `n`t"
				Color = [PSCustomObject]@{
					Gray		= "`e[90m"
					bGray		= "`e[1;90m"
					White		= "`e[97m"
					bWhite		= "`e[1;97m"
					
					Red			= "`e[91m"
					RedD		= "`e[31m"
					bRed		= "`e[1;91m"
					bRedD		= "`e[1;31m"
					
					Green		= "`e[92m"
					GreenD		= "`e[32m"
					bGreen		= "`e[1;92m"
					bGreenD		= "`e[1;32m"
					
					Yellow		= "`e[93m"
					YellowD		= "`e[33m"
					bYellow		= "`e[1;93m"
					bYellowD	= "`e[1;33m"
					
					Blue		= "`e[94m"
					BlueD		= "`e[34m"
					bBlue		= "`e[1;94m"
					bBlueD		= "`e[1;34m"
					
					Magenta		= "`e[95m"
					MagentaD	= "`e[35m"
					bMagenta	= "`e[1;95m"
					bMagentaD	= "`e[1;35m"
					
					Cyan		= "`e[96m"
					CyanD		= "`e[36m"
					bCyan		= "`e[1;96m"
					bCyanD		= "`e[1;36m"
				}
				Sim = [PSCustomObject]@{
					Params		= "$Esc.Color.Gray"
					Strings		= "$Esc.Color.CyanD"
					Command		= "$Esc.Color.Yellow"
				}
			}
		}
		
		$MSG = [PSCustomObject]@{
			Errors = [PSCustomObject]@{
				Test	= "${Esc.$BrTab}Test${Esc.$Br}"
			}
		}
	}
	
	
	process {
		if ( "${Name}" -ne $Null ) {
			try {
				if ( "${Name}" -contains "*" -or "?" ) {
					throw "WildcardError"
					} else {
						$Search = (
						Get-Help -Name "${Name}" -Category "${Category}" -Parameter "${Params}" | %{
								[PSCustomObject]@{
									Name		= $_.Name
									Category	= $_.Category
								}
							}
						)
						if ( $Search.PSCustomObject.count -gt 1 ) {
							throw "WildcardError"
						} else {
							Get-Help -Name "${Name}" -Category "${Category}" -Parameter "${Params}"
						}
					}
			}
			catch [WildcardError] {
				Write-Host ""
				Write-Error "The value supplied for '-Name' contains a wildcard and produced multiple results."
				
				Write-Host "`nPlease provide a specific, literal name for your desired query without Wildcards."
				Write-Host "If you need help finding the name of the command in question, use the '`e[93mGet-Command`e[0m' Cmdnlet."
				Write-Host "`e[93m `n`tGet-Command`e[0m `e[90m-Name`e[0m `e[36m'*Wildcard Search*'`e[0m`n"
				Write-Host "`e[93m `n`tGet-Command`e[0m `e[90m-UseFuzzyMatching -Name`e[0m `e[36m'Non-Wildcard Search'`e[0m`n"
			}
		}
	}
	
	
	end {
		#
	}


<#
.SYNOPSIS
	Get the parameters of a command.

.DESCRIPTION
	A streamlined function that uses 'Get-Help -Parameter' to quickly and easily list only a Command's Parameter Help details. Works for Cmdlets, Functions, and Scripts.

.PARAMETER Name
The name of the Command, Cmdlet, Function, or Script you wish to find the parameters of.

.PARAMETER Date
	$Params Description

.PARAMETER Pizza
	$Category Description

.NOTES
	Extra Details.

.EXAMPLE Get the Parameters of 'Get-ChildItem'

	Command Line Input:
		Get-Params 'Get-ChildItem'
	
	[ Full simulated output for this example is online-only ]

.EXAMPLE 
	Example 2:
	Pipe 'Get-Command' output to 'Get-Params'
	
	Command Line Input:
		Get-Command -Verb 'Set' -Noun 'Var*' -CommandType -Cmdlet | Get-Params
	
	
	The output of the 'Get-Command' portion alone would be:
	
		CommandType     Name                Version    Source
		-----------     ----                -------    ------    
		Cmdlet          Set-Variable        7.0.0.0    Microsof…
	
	
	Because there is only ONE result, the output can be piped '|' into the 'Get-Params' function.
	
	[ Full simulated output for this example is online-only ]

.ROLE User

.FUNCTIONALITY Help, Get-Help

.FORWARDHELPCATEGORY Function
.FORWARDHELPTARGETNAME Get-Help

.LINK https://GitHub.com/NewSpectrum
.LINK Get-FullHelp
.LINK Get-Command
.LINK Get-Help
.LINK about_Updatable_Help
#>
}

$AliasDesc = "The 'Get-Params' function. Gets the Parameter help info for any Cmdlet, Command, Script, Function, etc."

Set-Alias -Force -Name 'gph' -Value "Get-Params" -Description "${AliasDesc}"