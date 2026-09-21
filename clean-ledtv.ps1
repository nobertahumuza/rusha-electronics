$f = "C:\Users\Administrator\Desktop\rusha-electronics\public\index.html"
$c = Get-Content $f -Raw

# Remove any remaining partial led-tv line
$c = $c -replace "                                        `"ption value=`"led-tv`">LED TV</option>\n", ""
$c = $c -replace "                                        ption value=`"led-tv`">LED TV</option>\n", ""
# Also try removing the whole line by matching from the start of line
$c = $c -replace "\n\s*ption value=`"led-tv`">LED TV</option>", ""
# Fallback: just remove the text directly
$c = $c.Replace("ption value=`"led-tv`">LED TV</option>", "")

Set-Content $f $c

# Verify
$check = Select-String -Path $f -Pattern "led-tv" -AllMatches
if ($check.Count -eq 0) {
    Write-Host "SUCCESS: All led-tv references removed!" -ForegroundColor Green
} else {
    Write-Host "Still remaining:" -ForegroundColor Red
    $check | ForEach-Object { Write-Host $_.Line -ForegroundColor Red }
}
