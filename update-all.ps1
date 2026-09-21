$f = "C:\Users\Administrator\Desktop\rusha-electronics\public\index.html"
$c = Get-Content $f -Raw

# ============================================================
# 1. UPDATE PRODUCT IMAGES with new better photos
# ============================================================

# itel it2160 → actual itel it2160 boxes (214701)
$c = $c -replace "{ id: 4, name: 'itel it2160', category: 'phones', price: 'UGX 45,000', image: 'IMG-20260918-WA0013\.jpg'", "{ id: 4, name: 'itel it2160', category: 'phones', price: 'UGX 45,000', image: '20260921_214701.jpg'"

# Bluetooth Speaker → actual itel speaker box (214834)
$c = $c -replace "{ id: 13, name: 'Bluetooth Speaker', category: 'audio', price: 'UGX 55,000', image: 'IMG-20260918-WA0037\.jpg'", "{ id: 13, name: 'Bluetooth Speaker', category: 'audio', price: 'UGX 55,000', image: '20260921_214834.jpg'"

# Power King Extension → actual itel power extension box (215009)
$c = $c -replace "{ id: 15, name: 'Power King Extension', category: 'power', price: 'UGX 20,000', image: 'IMG-20260918-WA0002\.jpg'", "{ id: 15, name: 'Power King Extension', category: 'power', price: 'UGX 20,000', image: '20260921_215009.jpg'"

# Smartwatch → actual smart watch box (214750)
$c = $c -replace "{ id: 17, name: 'Smartwatch', category: 'accessories', price: 'UGX 65,000', image: 'IMG-20260918-WA0029\.jpg'", "{ id: 17, name: 'Smartwatch', category: 'accessories', price: 'UGX 65,000', image: '20260921_214750.jpg'"

# ============================================================
# 2. ADD NEW PRODUCTS (Infinix Hot 50i + Oraimo Headphones)
# ============================================================

# Find the last product in the array and add new ones before the closing bracket
$oldLastProduct = "{
                id: 18,
                name: 'Honor LED Bulb 12W',
                category: 'lighting',
                price: 'UGX 8,000',
                image: 'IMG-20260921-WA0020.jpg',
                desc: 'Energy saving LED bulb, bright white light'
            }"

$newProducts = "{
                id: 18,
                name: 'Honor LED Bulb 12W',
                category: 'lighting',
                price: 'UGX 8,000',
                image: 'IMG-20260921-WA0020.jpg',
                desc: 'Energy saving LED bulb, bright white light'
            },
            {
                id: 19,
                name: 'Infinix Hot 50i',
                category: 'phones',
                price: 'UGX 450,000',
                image: '20260921_214616.jpg',
                desc: '4GB RAM, 128GB ROM, 50MP Camera, 5000mAh Battery'
            },
            {
                id: 20,
                name: 'Oraimo Headphones OR-09',
                category: 'audio',
                price: 'UGX 35,000',
                image: '20260921_214805.jpg',
                desc: 'Born For Music - Wired headphones with mic'
            }"

$c = $c.Replace($oldLastProduct, $newProducts)

# ============================================================
# 3. UPDATE GALLERY with new shop interior photo
# ============================================================

# Replace the gallery large featured image with new full shop interior (222456)
$c = $c -replace 'src="IMG-20260921-WA0017\.jpg" alt="Rusha Electronics Full Shop Interior" class="gallery-img w-full h-full object-cover" loading="lazy" style="min-height:400px"', 'src="20260921_222456.jpg" alt="Rusha Electronics Full Shop Interior" class="gallery-img w-full h-full object-cover" loading="lazy" style="min-height:400px"'

# Replace gallery phones display with new Infinix display
$c = $c -replace 'src="IMG-20260918-WA0010\.jpg" alt="Phones Display" class="gallery-img w-full h-full object-cover" loading="lazy" style="min-height:190px"', 'src="20260921_214644.jpg" alt="Infinix Phones Display" class="gallery-img w-full h-full object-cover" loading="lazy" style="min-height:190px"'

# Replace gallery accessories display with new accessories display
$c = $c -replace 'src="IMG-20260921-WA0035\.jpg" alt="Accessories Display Case" class="gallery-img w-full h-full object-cover" loading="lazy" style="min-height:190px"', 'src="IMG-20260921-WA0035.jpg" alt="Accessories Display Case" class="gallery-img w-full h-full object-cover" loading="lazy" style="min-height:190px"'

# Replace gallery feature phones with new itel boxes
$c = $c -replace 'src="IMG-20260918-WA0013\.jpg" alt="Feature Phones" class="gallery-img w-full h-full object-cover" loading="lazy" style="min-height:190px"', 'src="20260921_214742.jpg" alt="itel Feature Phones Display" class="gallery-img w-full h-full object-cover" loading="lazy" style="min-height:190px"'

# Replace gallery headphones with new Oraimo headphones
$c = $c -replace 'src="IMG-20260918-WA0015\.jpg" alt="Earphones Collection" class="gallery-img w-full h-full object-cover" loading="lazy" style="min-height:190px"', 'src="20260921_214805.jpg" alt="Oraimo Headphones Display" class="gallery-img w-full h-full object-cover" loading="lazy" style="min-height:190px"'

# Replace gallery chargers with new itel speaker
$c = $c -replace 'src="IMG-20260918-WA0036\.jpg" alt="Chargers Display" class="gallery-img w-full h-full object-cover" loading="lazy" style="min-height:190px"', 'src="20260921_214834.jpg" alt="itel Bluetooth Speaker" class="gallery-img w-full h-full object-cover" loading="lazy" style="min-height:190px"'

# Replace gallery extension cables with new smart watch
$c = $c -replace 'src="IMG-20260918-WA0002\.jpg" alt="Extension Cables" class="gallery-img w-full h-full object-cover" loading="lazy" style="min-height:190px"', 'src="20260921_214750.jpg" alt="Smart Watch Display" class="gallery-img w-full h-full object-cover" loading="lazy" style="min-height:190px"'

# Replace gallery LED TV with new power extension
$c = $c -replace 'src="IMG-20260918-WA0023\.jpg" alt="LED TV and Gadgets" class="gallery-img w-full h-full object-cover" loading="lazy" style="min-height:190px"', 'src="20260921_215009.jpg" alt="itel Power Extension" class="gallery-img w-full h-full object-cover" loading="lazy" style="min-height:190px"'

# ============================================================
# 4. UPDATE HERO BACKGROUND to shop signboard (WA0016)
# ============================================================
$c = $c -replace 'src="IMG-20260921-WA0035\.jpg" alt="Rusha Electronics Shop Front" class="w-full h-full object-cover"', 'src="IMG-20260921-WA0016.jpg" alt="Rusha Electronics Shop Front" class="w-full h-full object-cover"'

# ============================================================
# 5. ADD NAVIGATION LINK to dashboard
# ============================================================

# Add dashboard link in the navigation before the WhatsApp button
$navDashboard = '
                        <a href="dashboard.html" class="px-4 py-2 bg-gradient-to-r from-purple-600 to-blue-600 text-white rounded-full text-sm font-semibold hover:from-purple-700 hover:to-blue-700 transition-all shadow-lg">
                            <i class="fas fa-chart-line mr-1"></i> Dashboard
                        </a>'

$c = $c -replace '(<a href="#contact".*?</a>\s*</div>\s*</div>\s*</nav>)', "$navDashboard`n                    `$1"

# ============================================================
# 6. UPDATE HERO BOTTOM GRID with new photos
# ============================================================

# Hero grid large image → new shop interior (222456)
$c = $c -replace 'src="IMG-20260921-WA0017\.jpg" alt="Rusha Electronics Shop Interior" class="w-full h-full object-cover hover:scale-105 transition-transform duration-500"', 'src="20260921_222456.jpg" alt="Rusha Electronics Shop Interior" class="w-full h-full object-cover hover:scale-105 transition-transform duration-500"'

# Hero grid small 1 → new Infinix display
$c = $c -replace 'src="IMG-20260918-WA0010\.jpg" alt="Phones" class="w-full h-full object-cover hover:scale-105 transition-transform duration-500"', 'src="20260921_214644.jpg" alt="Phones" class="w-full h-full object-cover hover:scale-105 transition-transform duration-500"'

# Hero grid small 2 → new accessories display
$c = $c -replace 'src="IMG-20260918-WA0019\.jpg" alt="Accessories" class="w-full h-full object-cover hover:scale-105 transition-transform duration-500"', 'src="IMG-20260921-WA0035.jpg" alt="Accessories" class="w-full h-full object-cover hover:scale-105 transition-transform duration-500"'

# ============================================================
# 7. ADD "photos" category to filter buttons
# ============================================================

# Add Photos button after All button
$c = $c -replace '(<button onclick="filterProducts\(''all''\)"[^>]*>All</button>)', "`$1`n                    <button onclick=""filterProducts('photos')"" class=""px-4 py-2 rounded-full text-sm font-semibold border-2 border-purple-300 text-purple-700 hover:bg-purple-50 transition-all""><i class=""fas fa-camera mr-1""></i>Photos</button>"

# ============================================================
# 8. UPDATE onerror fallback
# ============================================================
$c = $c -replace "onerror=""this\.onerror=null;this\.src='IMG-20260921-WA0016\.jpg'""", "onerror=""this.onerror=null;this.src='IMG-20260921-WA0016.jpg'"""

Set-Content $f $c
Write-Host "All product and gallery updates applied!" -ForegroundColor Green
