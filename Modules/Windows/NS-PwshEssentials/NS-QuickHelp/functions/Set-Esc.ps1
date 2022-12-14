Get-ExecutionPolicy -OutVariable 'ExecPolicy'
if ( "${ExecPolicy}" -ne "Bypass" -or "Unrestricted" ) {
	try {
		Set-ExecutionPolicy -Force -ErrorAction 'SilentlyContinue' -ErrorVariable +"$Logs.Errors" -WarningVariable +"$Logs.Warnings" -ExecutionPolicy 'Bypass'
	}
	catch 
		[System.UnauthorizedAccessException],
		[Microsoft.PowerShell.Commands.SetExecutionPolicyCommand] {
		Write-Host -ForegroundColor Yellow "`n`tThis script required administrative privilages."
		Write-Host "`tPlease run this script again from an Administrative PowerShell,"
		Write-Host "or Right-Click the '.ps1' file and 'Run as Administrator'."
		# Write-Debug "$_" | Out-File -Path "$Logs.DebugLogs" -Append
	}
}

# Set-Location -Path "D:\OneDrive - New Spectrum\Dev\Scripting\Windows Scripting\Basics"

function Set-Esc {
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
Set-Esc
#

<#
.SYNOPSIS
	Set Escape-Sequence Variables

.DESCRIPTION
	Sets a series of PSCustomObjects that can be called on in Cmdlets such as 'Write-Host' as an easy-to-use text formatting system.

NOTES
	Extra Details.

.EXAMPLE
	Example 1:
	Get the Parameters of 'Get-ChildItem'
	
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

.ROLE
	User

.FUNCTIONALITY
	Help, Get-Help

COMPONENT
	(optional)

INPUTS
	(optional)

OUTPUTS
	(optional)

.FORWARDHELPCATEGORY Function
.FORWARDHELPTARGETNAME Get-Help

.LINK https://
.LINK Get-FullHelp
.LINK Get-Command
.LINK Get-Help
.LINK about_Updatable_Help
#>

}