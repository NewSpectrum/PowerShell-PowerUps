$WarningPreference		= "SilentlyContinue"
$ErrorActionPreference	= "Suspend"
$ErrorView				= "CategoryView"

[CmdletBinding()]
	param(
		[Parameter(Mandatory=$False,
		           Position=0,
				   ParameterSetName="Logs",
				   ValueFromPipeline=$True,
				   ValueFromPipelineByPropertyName=$True)]
		[Alias("LP","Path")]
		[string]$LogPath
	)
#

# Declare empty variable for final logs output
	New-Variable -Name 'LogsTemp' -Scope 'Script'

# Default & Fallback Locations for temporary files
	$LogsDefault	= ".\.ps-temp\logs"
	$LogsFallback	= "$env:UserProfile\.ps-temp\logs"

# Check '$LogPath' Parameter
	if ( "${LogPatg}" -ne $null ) {
		Test-Path "${LogPath}" -PathType Container -OutVariable 'PathTest'
		if ( $PathTest -eq $True ) {
			$LogsTemp = "${LogPath}"
		} else {
			Write-Host "`n`tThe value provided for '-LogPath' was invalid."
			
		}
	}

# Set Log Ouputs
	$Logs = [PSCustomObject]@{
		Warnings	= $null
		WarningLogs = "${beans}\warnings.log"
		Errors		= $null
		ErrorLogs	= "${beans}\errors.log"
	}



# Verify the script is being run as an Administrator

try {# to run this Admin-level command
	Set-ExecutionPolicy -Force -ErrorAction 'SilentlyContinue' -ErrorVariable +"$Logs.Errors" -WarningVariable +"$Logs.Warnings"
}
catch {# the error saying permission denied
# Message to user  ↓
	Write-Output: "☹️"
	$_
}



# msiexec.exe /package PowerShell-7.3.0-win-x64.msi /quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=1 ENABLE_PSREMOTING=1 REGISTER_MANIFEST=1 USE_MU=1 ENABLE_MU=1 ADD_PATH=1
