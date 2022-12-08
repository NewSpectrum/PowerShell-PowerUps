Set-ExececutionPolicy -PassThru -Force -ExecutionPolicy 'Bypass'

$ErrorView="CategoryView"
$ErrorActionPreference="Suspend"
$VerbosePreference="Continue"
$WarningPreference="Continue"
$DebugPreference="Continue"


function Set-BaseEnv {
	[CmdletBinding()]
	param(
		[switch]$ExportJSON
	)
	
	$BaseEnv = [PSCustomObject]@{
		LocalUser = @{
			PwshDir = "$env:UserProfile\Documents\PowerShell"
			DefaultProfiles = @(
				"Microsoft.PowerShell_Profile.ps1",
				"Microsoft.VSCode_profile.ps1",
				"profile.ps1"
			)
		}
		
		LocalSystem = @{
			PS7dir 	= "$env:ProgramFiles\PowerShell\7"
			
		}
	}
	
	$AdminDefaults = [PSCustomObject]@{
		LocalDir 	= "$BaseEnv.$LocalPSDir\Enterprise"
	}
}
Set-EnvObjects





function Set-AdminEnv {
	[CmdletBinding(SupportShouldProcess)]
	param(
		[Parameter(Mandatory=$False,
				   ParameterSetName="Defaults",
				   ValueFromPipeline=$False,
   				   ValueFromPipelineByPropertyName=$False)]
		[Alias("D","Defaults")]
		[switch]$DefaultSettings
	)
	
	param(
		[Parameter(Mandatory=$False,
				   ParameterSetName="Profile",
				   ValueFromPipeline=$True,
   				   ValueFromPipelineByPropertyName=$True)]
		[ValidateNotNullOrEmpty()]
		[Alias("text","text")]
		[string]$ProfilePath,
		
		[Parameter(Mandatory=$False,
				   ParameterSetName="Profile",
				   ValueFromPipeline=$True,
   				   ValueFromPipelineByPropertyName=$True)]
		[ValidateNotNullOrEmpty()]
		[Alias("text","text")]
		[string]$ProfilePath,
	)
	
	
	begin {
		if ( "$DefaultSettings" -eq $True ) {
			
		}
	}
	
	
	process {
		#
	}
	
	
	end {
		#
	}


#====================================


<#
	★ Function Help Section ★
		- 'Set-AdminEnv' -

.SYNOPSIS
	Establishes a full-featured administrative PowerShell Profile & Environment for Enterprise Management.

.DESCRIPTION
	Short pararagraph summary.

.PARAMETER DefaultSettings
	Use the default settings to configure the Admin Environment & PowerShell Profile. These settings are easily reconfigured using this and other related scripts/functions included in this module.
	
	For more information, see: 'Get-Help -Online Set-AdminEnv'

.PARAMETER Date
	$Date Description

.PARAMETER Pizza
	$Pizza Description

.NOTES
	Extra Details.

.EXAMPLE 
	Set-AdminEnv -D
	[ details ]
	[ simulated output ]

.EXAMPLE 
	New-CommentHelp -Example
	[ details ]
	[ simulated output ]

.ROLE
	Admin

.FUNCTIONALITY
	Enterprise Admin, Server Admin, Server Automation, Profile Configuration, Environment Configuration

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