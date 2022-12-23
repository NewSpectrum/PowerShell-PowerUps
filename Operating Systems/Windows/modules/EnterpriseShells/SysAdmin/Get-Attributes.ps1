$Policy = $( Get-ExecutionPolicy )
if ( $Policy -ne "Unrestricted" -or "Bypass" ) {
	Set-ExecutionPolicy -ExecutionPolicy 'Bypass' -Scope 'Process' 
}


Set-Variable <#
#>	-Name 'DevDir' <#
#>	-Scope 'Script' <#
#>	-Visibility 'Public' <#
#>	-Force <#
#>	-Value "D:\OneDrive - New Spectrum\Dev\Scripting\Windows Scripting\Testing\Create & Modify Files\Get-Attributes.ps1"

Set-Variable <#
#>	-Name 'TestScript' <#
#>	-Scope 'Script' <#
#>	-Visibility 'Public' <#
#>	-Force <#
#>	-Value "D:\OneDrive - New Spectrum\Dev\Scripting\Windows Scripting\Testing\Create & Modify Files\Get-Attributes.ps1"

Set-Variable <#
#>	-Name 'ScriptDir' <#
#>	-Scope 'Script' <#
#>	-Visibility 'Public' <#
#>	-Force <#
#>	-Value "D:\OneDrive - New Spectrum\Dev\Scripting\Windows Scripting\Testing\Create & Modify Files"

Set-Variable <#
#>	-Name 'GpDir' <#
#>	-Scope 'Script' <#
#>	-Visibility 'Public' <#
#>	-Force <#
#>	-Value "$env:UserProfile\Desktop\GP"


$Properties	= [PSCustomObject]@{}
$Test		= $( Get-ChildItem -Path ".\*" )



Set-Location -PassThru -Path "${GpDir}"
$Tests | Get-Member |
	Tee-Object -Append -Variable "${Properties[@]}"
#








<#
#>


<#
$Properties = $(
	$Test | Get~Member
)
#>

#-PassThru