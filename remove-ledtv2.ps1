$f = "C:\Users\Administrator\Desktop\rusha-electronics\public\index.html"
$c = Get-Content $f -Raw
$idx = $c.IndexOf('<option value="led-tv">')
if ($idx -ge 0) {
    $start = $c.Substring(0, $idx)
    $rest = $c.Substring($idx)
    $nl = [Environment]::NewLine
    $nlLen = $nl.Length
    $newRest = $rest.Substring($nlLen)
    $c = $start + $newRest
    Set-Content $f $c
    Write-Host "Removed led-tv option" -ForegroundColor Green
} else {
    Write-Host "led-tv not found" -ForegroundColor Yellow
}
