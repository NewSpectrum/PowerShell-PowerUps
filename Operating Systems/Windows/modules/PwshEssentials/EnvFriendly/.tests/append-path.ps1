#$ErrorActionPreference	= ''
$ErrorView				= 'CategoryView'
$WarningPreference		= 'Continue'
$DebugPreference		= 'Continue'
$VerbosePreference		= 'Continue'
$InformationPreference	= 'Continue'


[Environment]::SetEnvironmentVariable(
	"$env:ProgramFiles\WinRAR",
	$env:Path,
	[System.EnvironmentVariableTarget]::Machine
)

refreshenv



# $TestDir="D:\OneDrive - New Spectrum\Dev\Scripting\Windows Scripting\Testing"
# Set-Location "$TestDir\env"