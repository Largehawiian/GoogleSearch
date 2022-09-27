<#
.SYNOPSIS
    Search Google from the command line.
.DESCRIPTION
    Search Google from the command line.
.NOTES
    
.LINK
    
.EXAMPLE
    Search-Google -Query "PowerShell" -ApkiKey "Your  Key"
#>
Function Search-Google{
    param (
        [Parameter(Mandatory=$true, Position=0)][string]$Query,
        [Parameter(Mandatory=$true, Position=1)][string]$APIKey
    )

    $cx ="c3062c84ab15f4527"
    $results = invoke-restmethod -uri ("https://customsearch.googleapis.com/customsearch/v1?key={1}&q={0},&cx={2}" -f $Query,$Key,$cx) -Method Get -ContentType "application/json"
    $results.items | ForEach-Object {
        [PSCustomObject]@{
            Title = $_.title
            Link = $_.link
            Snippet = $_.snippet
        }
    }
}