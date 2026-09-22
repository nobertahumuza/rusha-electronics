$f = "C:\Users\Administrator\Desktop\rusha-electronics\public\index.html"
$c = Get-Content $f -Raw

# All view counts to set (under 120)
$replacements = @{
    "views: 1247" = "views: 98"
    "views: 893" = "views: 45"
    "views: 654" = "views: 112"
    "views: 432" = "views: 67"
    "views: 2156" = "views: 105"
    "views: 987" = "views: 33"
    "views: 756" = "views: 89"
    "views: 1345" = "views: 76"
    "views: 567" = "views: 41"
    "views: 890" = "views: 22"
    "views: 423" = "views: 54"
    "views: 678" = "views: 93"
    "views: 1567" = "views: 119"
    "views: 345" = "views: 78"
    "views: 2345" = "views: 120"
    "views: 1890" = "views: 87"
    "views: 1123" = "views: 108"
    "views: 456" = "views: 63"
    "views: 1234" = "views: 84"
}

foreach ($key in $replacements.Keys) {
    $c = $c -replace [regex]::Escape($key), $replacements[$key]
}

Set-Content $f $c

# Verify
$check = Select-String -Path $f -Pattern "views: \d+" -AllMatches
$over = ($check.Matches | Where-Object { [int]($_.Value -replace 'views: ','') -gt 120 }).Count
Write-Host "Views over 120 remaining: $over" -ForegroundColor Yellow
$allViews = $check.Matches | ForEach-Object { [int]($_.Value -replace 'views: ','') }
Write-Host "All view values: $($allViews -join ', ')" -ForegroundColor Green
Write-Host "Done!" -ForegroundColor Green
