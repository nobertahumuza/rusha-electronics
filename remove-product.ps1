$f = "C:\Users\Administrator\Desktop\rusha-electronics\public\index.html"
$c = Get-Content $f -Raw

# Remove USB Data Cable Pack from order form dropdown
$c = $c -replace "                                        <option value=`"usb-data-cables`">USB Data Cable Pack</option>`n", ""

# Remove USB Data Cable Pack from products array
$c = $c -replace "            \{ id: 8, name: 'USB Data Cable Pack', category: 'accessories', price: 'UGX 15,000', image: 'usb-cables\.jpg', badge: '', desc: 'Multi-type, Fast Charge' \},`n", ""

Set-Content $f $c
Write-Host "USB Data Cable Pack removed successfully!" -ForegroundColor Green
