$f = "C:\Users\Administrator\Desktop\rusha-electronics\public\index.html"
$c = Get-Content $f -Raw

# Replace shop-front.png with other real shop photos in all 5 locations
$c = $c -replace 'src="shop-front\.png" alt="Rusha Electronics Shop Front" class="w-full h-full object-cover"', 'src="IMG-20260918-WA0010.jpg" alt="Phones Display" class="w-full h-full object-cover"'
$c = $c -replace 'src="shop-front\.png" alt="Rusha Electronics Shop Front" class="w-full h-full object-cover hover:scale-105 transition-transform duration-500"', 'src="IMG-20260918-WA0037.jpg" alt="Full Shop Wall" class="w-full h-full object-cover hover:scale-105 transition-transform duration-500"'
$c = $c -replace 'src="shop-front\.png" alt="Rusha Electronics Shop Front - Kakoba, Mbarara" class="gallery-img w-full h-full object-cover" loading="lazy" style="min-height:400px"', 'src="IMG-20260918-WA0019.jpg" alt="Accessories Wall" class="gallery-img w-full h-full object-cover" loading="lazy" style="min-height:400px"'
$c = $c -replace 'src="shop-front\.png" alt="Rusha Electronics Shop" class="w-full h-80 md:h-\[420px\] object-cover"', 'src="IMG-20260918-WA0023.jpg" alt="Shop Interior" class="w-full h-80 md:h-[420px] object-cover"'
$c = $c -replace 'src="shop-front\.png" alt="Rusha Electronics Shop Front" class="w-full h-56 object-cover"', 'src="IMG-20260918-WA0036.jpg" alt="Chargers and Power" class="w-full h-56 object-cover"'

Set-Content $f $c

# Verify
$check = Select-String -Path $f -Pattern 'shop-front' -AllMatches
if ($check.Count -eq 0) {
    Write-Host "SUCCESS: All shop-front.png references replaced!" -ForegroundColor Green
} else {
    Write-Host "Remaining:" -ForegroundColor Red
    $check | ForEach-Object { Write-Host $_.Line -ForegroundColor Red }
}
