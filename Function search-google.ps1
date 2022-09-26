Function search-google {
    $query = 'https://www.google.com/search?q='
    $args | ForEach-Object { $query = $query + "$_+" }
    $url = $query.Substring(0, $query.Length - 1)
    Start-Process "$url"
}

$key = "AIzaSyChk6AlAuRibCugMCnwJ4UzY-nTHmycV1M"
$query = "Purple Ostriches"

invoke-restmethod -uri ("https://customsearch.googleapis.com/customsearch/v1?q={0}&key={1}" -f $Query,$Key) -Method Get -ContentType "application/json"
