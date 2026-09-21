$f = "C:\Users\Administrator\Desktop\rusha-electronics\public\index.html"
$c = Get-Content $f -Raw

# ============================================================
# 1. HERO SECTION - Use shop signboard (WA0016) as hero bg
# ============================================================
# Replace hero background image
$c = $c -replace 'src="IMG-20260918-WA0010\.jpg" alt="Phones Display" class="w-full h-full object-cover"', 'src="IMG-20260921-WA0016.jpg" alt="Rusha Electronics Shop Front" class="w-full h-full object-cover"'

# Replace hero bottom overlay image
$c = $c -replace 'src="IMG-20260918-WA0037\.jpg" alt="Full Shop Wall" class="w-full h-full object-cover hover:scale-105 transition-transform duration-500"', 'src="IMG-20260921-WA0017.jpg" alt="Rusha Electronics Shop Interior" class="w-full h-full object-cover hover:scale-105 transition-transform duration-500"'

# ============================================================
# 2. GALLERY SECTION - Update with new better photos
# ============================================================
# Gallery large featured image → new full shop interior
$c = $c -replace 'src="IMG-20260918-WA0019\.jpg" alt="Accessories Wall" class="gallery-img w-full h-full object-cover" loading="lazy" style="min-height:400px"', 'src="IMG-20260921-WA0017.jpg" alt="Rusha Electronics Full Shop Interior" class="gallery-img w-full h-full object-cover" loading="lazy" style="min-height:400px"'

# Gallery phones → keep WA0010 (phones display) but rename alt
# Gallery accessories wall → replace with WA0035 (accessories display case)
$c = $c -replace 'src="IMG-20260918-WA0019\.jpg" alt="Accessories Wall" class="gallery-img w-full h-full object-cover" loading="lazy" style="min-height:190px"', 'src="IMG-20260921-WA0035.jpg" alt="Accessories Display Case" class="gallery-img w-full h-full object-cover" loading="lazy" style="min-height:190px"'

# Gallery LED bulbs → replace with WA0020 (Honor LED bulbs close-up)
$c = $c -replace 'src="IMG-20260918-WA0021\.jpg" alt="LED Bulbs and Gadgets" class="gallery-img w-full h-full object-cover" loading="lazy" style="min-height:190px"', 'src="IMG-20260921-WA0020.jpg" alt="Honor LED Bulbs Display" class="gallery-img w-full h-full object-cover" loading="lazy" style="min-height:190px"'

# Gallery phones display → update alt text
$c = $c -replace 'src="IMG-20260918-WA0010\.jpg" alt="Phones Display" class="gallery-img w-full h-full object-cover" loading="lazy" style="min-height:190px"', 'src="IMG-20260918-WA0010.jpg" alt="Phones Display" class="gallery-img w-full h-full object-cover" loading="lazy" style="min-height:190px"'

# ============================================================
# 3. ABOUT SECTION - Use accessories display (WA0035)
# ============================================================
$c = $c -replace 'src="IMG-20260918-WA0023\.jpg" alt="Shop Interior" class="w-full h-80 md:h-\[420px\] object-cover"', 'src="IMG-20260921-WA0035.jpg" alt="Rusha Electronics Accessories Display" class="w-full h-80 md:h-[420px] object-cover"'

# ============================================================
# 4. CONTACT SECTION - Use shop signboard (WA0016)
# ============================================================
$c = $c -replace 'src="IMG-20260918-WA0036\.jpg" alt="Chargers and Power" class="w-full h-56 object-cover"', 'src="IMG-20260921-WA0016.jpg" alt="Rusha Electronics Shop Entrance" class="w-full h-56 object-cover"'

# ============================================================
# 5. SERVICES SECTION - Update images
# ============================================================
# Phone Repair Service → keep WA0023 (TV/interior)
# Charging & Battery Service → keep WA0036 (chargers)
# Accessories & Gadgets → replace WA0019 with WA0035
$c = $c -replace 'src="IMG-20260918-WA0019\.jpg" alt="Charging and Battery Service" class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"', 'src="IMG-20260921-WA0035.jpg" alt="Accessories and Gadgets Display" class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"'

# ============================================================
# 6. PRODUCT IMAGES - Replace with better new photos
# ============================================================

# Product 5: Goldplus Cable → better cables photo (WA0022)
$c = $c -replace "{ id: 5, name: 'Goldplus 4-in-1 Fast Cable', category: 'accessories', price: 'UGX 35,000', image: 'IMG-20260918-WA0011\.jpg'", "{ id: 5, name: 'Goldplus 4-in-1 Fast Cable', category: 'accessories', price: 'UGX 35,000', image: 'IMG-20260921-WA0022.jpg'"

# Product 7: USB Flash Drive → actual USB drive photo
$c = $c -replace "{ id: 7, name: 'USB Flash Drive 64GB', category: 'accessories', price: 'UGX 20,000', image: 'IMG-20260918-WA0017\.jpg'", "{ id: 7, name: 'USB Flash Drive 64GB', category: 'accessories', price: 'UGX 20,000', image: '20260921_115718.jpg'"

# Product 10: Super Bass Headphones → actual headphones photo (WA0018)
$c = $c -replace "{ id: 10, name: 'Super Bass Pro Headphones', category: 'audio', price: 'UGX 10,000', image: 'IMG-20260918-WA0030\.jpg'", "{ id: 10, name: 'Super Bass Pro Headphones', category: 'audio', price: 'UGX 10,000', image: 'IMG-20260921-WA0018.jpg'"

# Product 11: Oraimo Wireless Headphones → actual Oraimo box photo (WA0018)
$c = $c -replace "{ id: 11, name: 'Oraimo Wireless Headphones', category: 'audio', price: 'UGX 85,000', image: 'IMG-20260918-WA0036\.jpg'", "{ id: 11, name: 'Oraimo Wireless Headphones', category: 'audio', price: 'UGX 85,000', image: 'IMG-20260921-WA0018.jpg'"

# Product 13: Bluetooth Speaker → shop wall with speakers (WA0037)
$c = $c -replace "{ id: 13, name: 'Bluetooth Speaker', category: 'audio', price: 'UGX 55,000', image: 'IMG-20260918-WA0017\.jpg'", "{ id: 13, name: 'Bluetooth Speaker', category: 'audio', price: 'UGX 55,000', image: 'IMG-20260918-WA0037.jpg'"

# Product 14: Fast Charger → actual chargers in display (WA0035)
$c = $c -replace "{ id: 14, name: 'Oraimo Fast Charger Adapter', category: 'power', price: 'UGX 30,000', image: 'IMG-20260918-WA0028\.jpg'", "{ id: 14, name: 'Oraimo Fast Charger Adapter', category: 'power', price: 'UGX 30,000', image: 'IMG-20260921-WA0035.jpg'"

# Product 18: Honor LED Bulb → actual Honor LED bulbs photo (WA0020)
$c = $c -replace "{ id: 18, name: 'Honor LED Bulb 12W', category: 'lighting', price: 'UGX 8,000', image: 'IMG-20260918-WA0021\.jpg'", "{ id: 18, name: 'Honor LED Bulb 12W', category: 'lighting', price: 'UGX 8,000', image: 'IMG-20260921-WA0020.jpg'"

# ============================================================
# 7. UPDATE onerror fallback image
# ============================================================
$c = $c -replace "onerror=`"this.onerror=null;this.src='IMG-20260918-WA0017\.jpg'`"", "onerror=`"this.onerror=null;this.src='IMG-20260921-WA0016.jpg'`""

Set-Content $f $c
Write-Host "All photo updates applied!" -ForegroundColor Green
