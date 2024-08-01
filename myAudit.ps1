
param(
    [Parameter(Mandatory = $true)]
    [System.IO.FileInfo] $ADNTHashes,
    [Parameter(Mandatory = $true)]
    [System.IO.FileInfo] $HashDictionary
)
process {
    $stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
    # Set the current location so .NET will be nice and accept relative paths
    [Environment]::CurrentDirectory = Get-Location
    # Declare and fill new hashtable with ADNThashes. Converts to upper case to 
    $htADNTHashes = @{}
    Import-Csv -Delimiter ":" -Path $ADNTHashes -Header "User","Hash" | % {$htADNTHashes[$_.Hash.toUpper()] += @($_.User)}
       
    # Create Filestream reader
    $fsHashDictionary = New-Object IO.Filestream $HashDictionary,'Open','Read','Read'
    $frHashDictionary = New-Object System.IO.StreamReader($fsHashDictionary)
    # Output CSV headers
    Write-Output "Username,Frequency,Hash"
    #Iterate through HashDictionary checking each hash against ADNTHashes
    while ($null -ne ($lineHashDictionary = $frHashDictionary.ReadLine())) {
        if($htADNTHashes.ContainsKey($lineHashDictionary.Split(":")[0].ToUpper())) {
                $user = $htADNTHashes[$lineHashDictionary.Split(":")[0].ToUpper()]
                $frequency = $lineHashDictionary.Split(":")[1]
                $hash = $linehashDictionary.Split(":")[0].ToUpper()
                Write-Output "$user,$frequency,$hash"
            }
        }
    $stopwatch.Stop()
    Write-Output "Function Match-ADHashes completed in $($stopwatch.Elapsed.TotalSeconds) Seconds"
}
    
end {
}