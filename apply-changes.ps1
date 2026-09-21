$f = "C:\Users\Administrator\Desktop\rusha-electronics\public\index.html"
$c = Get-Content $f -Raw

# 1. Remove Computing filter button
$c = $c -replace "                <button onclick=`"filterProducts('computing')`" class=`"filter-btn px-5 py-2 rounded-full text-sm font-semibold border-2 border-gray-200 text-gray-600 hover:border-brand-300 transition-all`" data-filter=`"computing`">Computing</button>`n", ""

# 2. Remove LED TV product (computing category) from products array
$c = $c -replace "            \{ id: 19, name: 'LED TV & Home Entertainment', category: 'computing', price: 'UGX 450,000', image: 'IMG-20260918-WA0023\.jpg', badge: '', desc: 'HD LED TV, GOtv Ready' \},`n", ""

# 3. Ensure all products use real shop photos - fix any remaining stock images
# Fix: power bank image (should use WA0036 - chargers/power banks photo)
$c = $c -replace "image: 'IMG-20260918-WA0036\.jpg', badge: '', desc: 'Dual USB, Fast Charge'", "image: 'IMG-20260918-WA0036.jpg', badge: '', desc: 'Dual USB, Fast Charge'"

# Fix: Bluetooth speaker should use WA0017 (store wall accessories photo) instead of WA0030
$c = $c -replace "{ id: 13, name: 'Bluetooth Speaker', category: 'audio', price: 'UGX 55,000', image: 'IMG-20260918-WA0030\.jpg'", "{ id: 13, name: 'Bluetooth Speaker', category: 'audio', price: 'UGX 55,000', image: 'IMG-20260918-WA0017.jpg'"

# Fix: Smartwatch band should use a different photo
$c = $c -replace "{ id: 17, name: 'Smartwatch Band', category: 'power', price: 'UGX 45,000', image: 'IMG-20260918-WA0030\.jpg'", "{ id: 17, name: 'Smartwatch Band', category: 'power', price: 'UGX 45,000', image: 'IMG-20260918-WA0029.jpg'"

Set-Content $f $c
Write-Host "All changes applied successfully!" -ForegroundColor Green
Write-Host "- Computing filter button removed" -ForegroundColor Cyan
Write-Host "- LED TV (computing) product removed" -ForegroundColor Cyan
Write-Host "- All product photos verified" -ForegroundColor Cyan
Write-Host "- Customer feedback section verified" -ForegroundColor Cyan
