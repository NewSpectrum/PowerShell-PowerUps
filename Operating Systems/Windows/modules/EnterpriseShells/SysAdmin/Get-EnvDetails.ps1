$Policy = $( Get-ExecutionPolicy )
if ( $Policy -ne "Unrestricted" -or "Bypass" ) {
	Set-ExecutionPolicy -ExecutionPolicy 'Bypass' -Scope 'Process' 
}

