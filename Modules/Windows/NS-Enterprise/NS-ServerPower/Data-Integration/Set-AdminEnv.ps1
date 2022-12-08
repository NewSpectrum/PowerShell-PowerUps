Set-ExececutionPolicy -PassThru -Force -ExecutionPolicy 'Bypass'

$ErrorView="CategoryView"
$ErrorActionPreference="Suspend"
$VerbosePreference="Continue"
$WarningPreference="Continue"
$DebugPreference="Continue"

function Set-AdminEnv {
	[CmdletBinding(SupportShouldProcess)]
	param
}