$f = "C:\Users\Administrator\Desktop\rusha-electronics\public\index.html"
$c = Get-Content $f -Raw

# ============================================================
# FIX BROKEN IMAGE REFERENCES
# ============================================================

# Hero background: WA0016 is gone → use accessories wall
$c = $c.Replace('src="IMG-20260921-WA0016.jpg" alt="Rusha Electronics Shop Front" class="w-full h-full object-cover">', 'src="IMG-20260918-WA0019.jpg" alt="Rusha Electronics Accessories Wall" class="w-full h-full object-cover">')

# Hero grid bottom: WA0016 is gone → use TV/electronics wall
$c = $c.Replace('src="IMG-20260921-WA0016.jpg" alt="Rusha Electronics Shop Front" class="w-full h-full object-cover hover:scale-105 transition-transform duration-500">', 'src="IMG-20260918-WA0023.jpg" alt="Rusha Electronics TV and Electronics Display" class="w-full h-full object-cover hover:scale-105 transition-transform duration-500">')

# Contact section: WA0016 is gone → use accessories wall
$c = $c.Replace('src="IMG-20260921-WA0016.jpg" alt="Rusha Electronics Shop Entrance" class="w-full h-56 object-cover">', 'src="IMG-20260918-WA0019.jpg" alt="Rusha Electronics Shop in Kakoba" class="w-full h-56 object-cover">')

# Gallery phones: 214644 is gone → use phones on counter
$c = $c.Replace('src="20260921_214644.jpg" alt="Infinix Smartphones on Display"', 'src="IMG-20260918-WA0010.jpg" alt="Samsung and itel Phones on Display"')

# Gallery extension cables: WA0002 is gone → use new named file
$c = $c.Replace('src="IMG-20260918-WA0002.jpg" alt="Extension Cables"', 'src="power king extension cables.jpg" alt="Power King Extension Cables Display"')

# Gallery earphones: WA0015 is gone → use new named file
$c = $c.Replace('src="IMG-20260918-WA0015.jpg" alt="Earphones Collection"', 'src="heat phones.jpg" alt="Earphones and Headphones Collection"')

# onerror fallback: WA0016 is gone → use accessories wall
$c = $c.Replace("onerror=""this.onerror=null;this.src='IMG-20260921-WA0016.jpg'""", "onerror=""this.onerror=null;this.src='IMG-20260918-WA0019.jpg'""")

# ============================================================
# FIX PRODUCT IMAGES
# ============================================================

# id 4: itel it2160 → feature phones photo
$c = $c.Replace("image: '20260921_214701.jpg'", "image: 'IMG-20260918-WA0013.jpg'")

# id 9: Oraimo Conch 2 Neo → earphones photo
$c = $c.Replace("image: 'IMG-20260918-WA0015.jpg', badge: 'Hot'", "image: 'heat phones.jpg', badge: 'Hot'")

# id 13: Bluetooth Speaker → BoomBest speaker photo
$c = $c.Replace("image: '20260921_214834.jpg'", "image: 'robot speakers.jpg'")

# id 15: Power King Extension → new named file
$c = $c.Replace("image: '20260921_215009.jpg'", "image: 'power king extension cables.jpg'")

# id 17: Smartwatch → accessories display (has watch visible)
$c = $c.Replace("image: '20260921_214750.jpg'", "image: 'IMG-20260918-WA0036.jpg'")

# id 18: Honor LED Bulb → bulbs photo
$c = $c.Replace("image: 'IMG-20260921-WA0020.jpg', badge: '', desc: 'Energy Saving, Bright White'", "image: 'bulbs.jpg', badge: '', desc: 'Energy Saving, Bright White'")

# id 19: Infinix Hot 50i → phones photo
$c = $c.Replace("image: '20260921_214616.jpg'", "image: 'IMG-20260918-WA0010.jpg'")

# id 20: Oraimo Headphones OR-09 → JBL headphones photo
$c = $c.Replace("image: '20260921_214805.jpg'", "image: 'EAR PHONES.jpg'")

# ============================================================
# ADD NEW PRODUCTS
# ============================================================

$oldLast = "{ id: 20, name: 'Oraimo Headphones OR-09', category: 'audio', price: 'UGX 35,000', image: 'EAR PHONES.jpg', badge: '', desc: 'Born For Music, Wired with Mic' },"

$newProducts = "{ id: 20, name: 'JBL 8818 Bluetooth Headphones', category: 'audio', price: 'UGX 25,000', image: 'EAR PHONES.jpg', badge: 'New', desc: 'Athlete Wireless, Bluetooth, Multiple Colors' },
            { id: 21, name: 'BoomBest Wireless Speaker', category: 'audio', price: 'UGX 35,000', image: 'robot speakers.jpg', badge: '', desc: 'FM Radio, TF/USB, Phone Holder, Portable' },
            { id: 22, name: 'Philips Dry Iron HD1172', category: 'home', price: 'UGX 55,000', image: 'FLat irons.jpg', badge: '', desc: 'Original, Non-stick Soleplate, Fast Heating' },
            { id: 23, name: 'Electric Kettle 1.8L', category: 'home', price: 'UGX 35,000', image: 'PACOLATORS.jpg', badge: '', desc: 'Easy Power / TopScarlett, Stainless Steel' },
            { id: 24, name: 'Screen Guard Tempered Glass', category: 'accessories', price: 'UGX 10,000', image: 'SCREEN GUARDS.jpg', badge: '', desc: '21D/10D/19H, Full Glue, All Phone Models' },
            { id: 25, name: 'Memory Card 32GB + USB Reader', category: 'accessories', price: 'UGX 15,000', image: 'memory cards.jpg', badge: '', desc: 'GoldPlus Micro SD, USB 3.0 Card Reader' },
            { id: 26, name: 'LED Bulb 7W SSS/LEDON', category: 'lighting', price: 'UGX 5,000', image: 'bulbs.jpg', badge: '', desc: 'Energy Saving, E27, Bright White Light' },"

$c = $c.Replace($oldLast, $newProducts)

# ============================================================
# ADD "HOME" FILTER BUTTON
# ============================================================

$c = $c.Replace(
    '<button onclick="filterProducts(''lighting'')" class="filter-btn px-5 py-2 rounded-full text-sm font-semibold border-2 border-gray-200 text-gray-600 hover:border-brand-300 transition-all" data-filter="lighting">Lighting</button>',
    '<button onclick="filterProducts(''lighting'')" class="filter-btn px-5 py-2 rounded-full text-sm font-semibold border-2 border-gray-200 text-gray-600 hover:border-brand-300 transition-all" data-filter="lighting">Lighting</button>
                <button onclick="filterProducts(''home'')" class="filter-btn px-5 py-2 rounded-full text-sm font-semibold border-2 border-gray-200 text-gray-600 hover:border-brand-300 transition-all" data-filter="home">Home Appliances</button>'
)

# ============================================================
# ADD "home" category to filter function
# ============================================================

$c = $c.Replace("const filtered = filter === 'all' ? products : products.filter(p => p.category === filter);", "const filtered = filter === 'all' ? products : products.filter(p => p.category === filter);")

Set-Content $f $c
Write-Host "All fixes applied!" -ForegroundColor Green
