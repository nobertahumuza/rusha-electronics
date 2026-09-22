$f = "C:\Users\Administrator\Desktop\rusha-electronics\public\index.html"
$c = Get-Content $f -Raw

# Remove badge property from all products (badge: '', )
$c = $c -replace ", badge: ''", ""

# Remove the badge display code from product card rendering
# Remove the entire line that displays badge
$c = $c -replace '\n                        \$\{product\.badge \? \'<span class="absolute top-3 left-3 bg-brand-500 text-white text-xs font-bold px-2\.5 py-1 rounded-full">\' \+ product\.badge \+ \'</span>\' : \'\'\}', ""
$c = $c -replace '\n                        \$\{product\.badge \?.*badge.*\}', ""
# Remove any remaining badge display line (single line version)
$c = $c -replace '\n                        \$\{product\.badge.*\}', ""
# Remove empty lines left behind
$c = $c -replace '\n\n\n                        <span class="absolute top-3 left-3', "\n                        <span class=\"absolute top-3 left-3"
$c = $c -replace '\n\n\n                        \$\{product\.badge', "\n                        \${product.badge"

Set-Content $f $c
Write-Host "Badges removed from products!" -ForegroundColor Green
