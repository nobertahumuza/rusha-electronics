$f = "C:\Users\Administrator\Desktop\rusha-electronics\public\index.html"
$c = Get-Content $f -Raw

# 1. Add views to ear pods products
$c = $c -replace "(\{ id: 27, name: 'Ear Pods Wireless', category: 'audio', price: 'UGX 25,000', image: 'earpods 444\.jpg', views: )0(, desc: 'TWS Wireless, Bluetooth 5\.0'\})", "`$1567`$2"
$c = $c -replace "(\{ id: 28, name: 'Ear Pods Pro', category: 'audio', price: 'UGX 35,000', image: 'earpods 444\.jpg', views: )0(, desc: 'Noise Cancelling, Touch Control'\})", "`$11234`$2"
$c = $c -replace "(\{ id: 29, name: 'Ear Pods Basic', category: 'audio', price: 'UGX 15,000', image: 'earpods 444\.jpg', views: )0(, desc: 'Wired, With Mic, 3\.5mm'\})", "`$1890`$2"

# 2. Add views display after product desc in card
$c = $c -replace "(\$\{product\.desc\}</p>)(`n\s+<div class=`"flex items-center justify-between mt-4`">)", "`$1`n                        <div class=`"flex items-center gap-1 mt-1`">`n                            <svg class=`"w-3.5 h-3.5 text-yellow-400`" fill=`"currentColor`" viewBox=`"0 0 20 20`"><path d=`"M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z`"/></svg>`n                            <span class=`"text-gray-500 text-xs`">${product.views} views</span>`n                        </div>`n                        <div class=`"flex items-center justify-between mt-1`">")

$c = $c -replace "(\$\{product\.desc\}</p>\s+<div class=`"flex items-center justify-between mt-1`">\s+<div class=`"flex items-center gap-1 mt-1`">)", "`$1")

Set-Content $f $c
Write-Host "Views added!" -ForegroundColor Green
