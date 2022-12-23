


$PathList = @(
	$( $env:PATH -split ';' )
)

ForEach ( $item in $PathList ) {
	$_ -match "regex"
}