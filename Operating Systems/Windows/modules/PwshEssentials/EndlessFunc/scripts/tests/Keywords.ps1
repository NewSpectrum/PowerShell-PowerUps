$Images = $(
		Get-ChildItem -Path ".\" -Filter "Julie*OF*.jpg"
	)



$FileProperties = $( $Images | %{
	[PSCustomObject]@{
		Name		= $_.BaseName
		Extension	= $_.Extension
		FileSize 	= $($SizeMB	= $(
				[Math]::Round($_.Length / 1024),2
				)
			) 
		Path		= $_.Path
	}
}

$FileProperties | ConvertTo-JSON -Depth 4




