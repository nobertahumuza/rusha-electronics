$f = "C:\Users\Administrator\Desktop\rusha-electronics\public\index.html"
$c = Get-Content $f -Raw
$c = $c -replace "                                        <option value=`"led-tv`">LED TV</option>`n", ""
Set-Content $f $c
Write-Host "led-tv option removed" -ForegroundColor Green
