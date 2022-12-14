# If '$null' then Set Default
	if ( "$TempParam01" -eq $null ) {
		$TempParam01 = "TempParam01_Default"
	}


# Basic Switch Logic
	if ( $TempSwitch01 -eq $true ) {
		# Action
	}
	
	if ( $TempSwitch02 -eq $false ) {
		# Action
	}
	
	if ( $TempSwitch03 -eq $null ) {
		# Action
	}


# else-if
	if ( "$TempVar01" -eq "$Condition01" ) {
		# Action
	} elseif ( "$TempVar01" -eq "$Condition02" ) {
		# Action
	}
	
	
	# [io.file]::OpenWrite($OutFile).close()