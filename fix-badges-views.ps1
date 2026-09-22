$f = "C:\Users\Administrator\Desktop\rusha-electronics\public\index.html"
$c = Get-Content $f -Raw

# 1. REMOVE ALL BADGES
$c = $c -replace "badge: 'New'", "badge: ''"
$c = $c -replace "badge: 'Best Seller'", "badge: ''"
$c = $c -replace "badge: 'Popular'", "badge: ''"
$c = $c -replace "badge: 'Hot'", "badge: ''"

# Remove badge display from product cards
$badgePattern = '
                        ${product.badge ? ''<span class="absolute top-3 left-3 bg-brand-500 text-white text-xs font-bold px-2.5 py-1 rounded-full">'' + product.badge + ''</span>'' : ''''}'
$c = $c -replace [regex]::Escape($badgePattern), ''

# 2. ADD VIEWS TO PRODUCTS
$viewsMap = @{
    "6.7"" AMOLED, 128GB, 5G" = 1247
    "6.75"" 120Hz, 8GB, 64GB" = 893
    "6.7"" Display, 64GB" = 654
    "Big Battery, Dual SIM" = 432
    "65W PD27W, Type-C to Lightning" = 2156
    "3A Fast Charging, Durable" = 987
    "High Speed USB 3.0" = 756
    "Deep Bass, With Mic, 3.5mm" = 1345
    "Housing AAA Grade, In-Ear" = 567
    "Born For Music, Bluetooth" = 890
    "3.5mm Jack, With Mic" = 423
    "Portable, Waterproof" = 678
    "2A USB Wall Charger" = 1567
    "3M, 13A Fused Socket" = 345
    "Infinix/GOLF, Dual USB, Fast Charge" = 2345
    "Health Tracking, Bluetooth" = 567
    "Energy Saving, Bright White" = 234
    "4GB RAM, 128GB ROM, 50MP Camera" = 1890
    "Athlete Wireless, Bluetooth, Multiple Colors" = 1123
    "FM Radio, TF/USB, Phone Holder, Portable" = 456
    "21D/10D/19H, Full Glue, All Phone Models" = 2345
    "GoldPlus Micro SD, USB 3.0 Card Reader" = 678
    "Energy Saving, E27, Bright White Light" = 345
}

foreach ($key in $viewsMap.Keys) {
    $old = "desc: '" + $key + "'"
    $new = "views: " + $viewsMap[$key] + ", desc: '" + $key + "'"
    $c = $c.Replace($old, $new)
}

# Add views display in product card
$oldCard = '
                        <h3 class="font-bold text-gray-900 group-hover:text-brand-600 transition">${product.name}</h3>
                        <p class="text-gray-400 text-sm mt-1">${product.desc}</p>
                        <div class="flex items-center justify-between mt-4">'
$newCard = '
                        <h3 class="font-bold text-gray-900 group-hover:text-brand-600 transition">${product.name}</h3>
                        <p class="text-gray-400 text-sm mt-1">${product.desc}</p>
                        ${product.views ? ''<p class="text-gray-400 text-sm mt-0.5"><i class="fas fa-eye text-blue-400 mr-1"></i>'' + product.views.toLocaleString() + '' views</p>'' : ''''}
                        <div class="flex items-center justify-between mt-4">'
$c = $c.Replace($oldCard, $newCard)

Set-Content $f $c
Write-Host "Badges removed, views added!" -ForegroundColor Green
