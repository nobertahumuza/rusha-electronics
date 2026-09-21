$f = "C:\Users\Administrator\Desktop\rusha-electronics\public\index.html"
$c = Get-Content $f -Raw

# 1. Remove Computing filter button line
$lineToRemove = "                <button onclick=`"filterProducts('computing')`" class=`"filter-btn px-5 py-2 rounded-full text-sm font-semibold border-2 border-gray-200 text-gray-600 hover:border-brand-300 transition-all`" data-filter=`"computing`">Computing</button>"
$c = $c.Replace($lineToRemove + "`n", "")

# 2. Remove LED TV product line  
$tvLine = "            { id: 19, name: 'LED TV & Home Entertainment', category: 'computing', price: 'UGX 450,000', image: 'IMG-20260918-WA0023.jpg', badge: '', desc: 'HD LED TV, GOtv Ready' },"
$c = $c.Replace($tvLine + "`n", "")

# 3. Remove LED TV from order form dropdown
$ledTvOption = "                                        <option value=`"led-tv`">LED TV</option>"
$c = $c.Replace($ledTvOption + "`n", "")

# 4. Also try with different whitespace patterns
$c = $c -replace "                                        <option value=`"led-tv`">LED TV</option>`n", ""
$c = $c -replace "            \{ id: 19, name: 'LED TV & Home Entertainment'.*\n", ""
$c = $c -replace "                <button onclick=`"filterProducts\('computing'\)`".*\n", ""

Set-Content $f $c

# Verify
$check = Select-String -Path $f -Pattern "computing|LED TV|led-tv" -AllMatches
if ($check.Count -eq 0) {
    Write-Host "SUCCESS: All computing references removed!" -ForegroundColor Green
} else {
    Write-Host "WARNING: Some computing references remain:" -ForegroundColor Yellow
    $check | ForEach-Object { Write-Host $_.Line -ForegroundColor Red }
}
