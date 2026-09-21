$f = "C:\Users\Administrator\Desktop\rusha-electronics\public\index.html"
$c = Get-Content $f -Raw

# Fix font
$c = $c -replace 'DM\+Sans:wght\@400;500;600;700&family=Space\+Grotesk:wght\@500;600;700', 'Inter:wght\@300;400;500;600;700;800;900'

# Fix image references - use real shop photos
$c = $c -replace "image: 'earphones\.jpg'", "image: 'IMG-20260918-WA0032.jpg'"
$c = $c -replace "image: 'smart-watch\.jpg'", "image: 'IMG-20260918-WA0030.jpg'"
$c = $c -replace "image: 'led-bulbs\.jpg'", "image: 'IMG-20260918-WA0021.jpg'"
$c = $c -replace "image: 'bluetooth-speaker\.jpg'", "image: 'IMG-20260918-WA0017.jpg'"
$c = $c -replace "image: 'IMG-20260918-WA0037\.jpg'", "image: 'IMG-20260918-WA0036.jpg'"

# Fix hero badge text
$c = $c -replace "Open Now \| 10% Student Discount", "Mon-Sat 8AM-8PM"

# Fix USB drive image
$c = $c -replace "image: 'IMG-20260918-WA0029\.jpg'.*desc: 'High Speed USB 3\.0'", "image: 'IMG-20260918-WA0029.jpg', badge: '', desc: 'High Speed USB 3.0'"

Set-Content $f $c
Write-Host "All fixes applied!" -ForegroundColor Green
