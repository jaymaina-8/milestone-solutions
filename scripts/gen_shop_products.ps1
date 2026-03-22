function New-Card {
    param($cat, $badge, $fname, $title, $price, $desc)
    $src = 'img/' + ($fname -replace ' ', '%20')
    @"
                    <div class="col-lg-3 col-md-4 col-sm-6 shop-card" data-category="$cat">
                        <div class="product-card rounded overflow-hidden shadow-sm h-100 d-flex flex-column">
                            <img class="img-fluid w-100" src="$src" alt="$title" style="background: #E8EFFF; min-height: 200px; display: block; object-fit: cover;">
                            <div class="p-3 flex-grow-1 d-flex flex-column">
                                <span class="badge bg-primary mb-2 align-self-start">$badge</span>
                                <h6 class="mb-1">$title</h6>
                                <p class="price-line mb-2 text-primary">$price</p>
                                <p class="small text-muted flex-grow-1">$desc</p>
                                <a href="contact.html" class="btn btn-warning btn-sm fw-bold">Request a Quote</a>
                            </div>
                        </div>
                    </div>
"@
}

$lines = New-Object System.Collections.ArrayList

# Books & Stationery (book 1.png … book 10.png)
$books = @(
    @{ t = 'Targeter CBC Tracker Grade 1'; p = 'Ksh 1,150 <span class="text-muted fw-normal small">ea.</span>'; d = 'Wings of Excellence edition; competency-based curriculum learner support' },
    @{ t = 'Targeter CBC Tracker Grade 2'; p = 'Ksh 1,150 <span class="text-muted fw-normal small">ea.</span>'; d = 'Wings of Excellence edition; competency-based curriculum learner support' },
    @{ t = 'Targeter CBC Tracker Grade 3'; p = 'Ksh 1,150 <span class="text-muted fw-normal small">ea.</span>'; d = 'Wings of Excellence edition; competency-based curriculum learner support' },
    @{ t = 'Targeter CBC Tracker Grade 4'; p = 'Ksh 1,150 <span class="text-muted fw-normal small">ea.</span>'; d = 'Rationalised edition; CBC tracker for grade 4 learners' },
    @{ t = 'Targeter CBC Tracker Grade 5'; p = 'Ksh 1,150 <span class="text-muted fw-normal small">ea.</span>'; d = 'Rationalised edition; CBC tracker for grade 5 learners' },
    @{ t = 'Targeter CBC Tracker Grade 6'; p = 'Ksh 1,150 <span class="text-muted fw-normal small">ea.</span>'; d = 'Rationalised edition; CBC tracker for grade 6 learners' },
    @{ t = 'Targeter CBC Tracker Grade 7 Volume 1'; p = 'Ksh 1,250 <span class="text-muted fw-normal small">ea.</span>'; d = 'English, Kiswahili, Social Studies, CRE and IRE' },
    @{ t = 'Targeter CBC Tracker Grade 7 Volume 2'; p = 'Ksh 1,250 <span class="text-muted fw-normal small">ea.</span>'; d = 'Mathematics, Integrated Science, Agriculture, Pre-Technical Studies and Creative Arts &amp; Sports' },
    @{ t = 'Targeter CBC Tracker Grade 8 Volume 1'; p = 'Ksh 1,250 <span class="text-muted fw-normal small">ea.</span>'; d = 'English, Kiswahili, Social Studies, CRE and IRE' },
    @{ t = 'The ''A'' Finder Agriculture Revision Book'; p = 'Ksh 950 <span class="text-muted fw-normal small">ea.</span>'; d = 'Revised edition; Targeter Series agriculture revision book' }
)
1..10 | ForEach-Object {
    $ix = $_ - 1
    [void]$lines.Add((New-Card 'stationery' 'Books &amp; Stationery' "book $_.png" $books[$ix].t $books[$ix].p $books[$ix].d))
}

# Staedtler stationery (sta 1.jpg … sta 5.jpg)
$staItems = @(
    @{ t = 'SAFQA Copy A4 Multi-Use Paper 80 gsm (500 Sheets)'; p = 630; d = 'A4, 80 gsm, 500-sheet ream as shown on pack' },
    @{ t = 'Helix Oxford Mathematical Instruments Complete Accuracy'; p = 295; d = 'Classic metal-tin geometry set shown in the image' },
    @{ t = 'aOne A4 Multi-Purpose Quality Paper 80 gsm'; p = 870; d = 'A4 photocopy paper ream; 80 gsm' },
    @{ t = 'Counter Book (Assorted 2, 3 &amp; 6 Quire)'; p = 175; d = 'Counter books shown in mixed quire sizes; price from the 2-quire entry point' },
    @{ t = 'BIC Orange Original Fine Ball Pens (Box of 20)'; p = 410; d = 'Fine 0.8 mm orange-barrel box pack as pictured' }
)
1..5 | ForEach-Object {
    $ix = $_ - 1
    $item = $staItems[$ix]
    $priceStr = "Ksh $($item.p.ToString('N0')) <span class=`"text-muted fw-normal small`">ea.</span>"
    [void]$lines.Add((New-Card 'stationery' 'Stationery' "sta $_.jpg" $item.t $priceStr $item.d))
}

# Sports balls (ball 1.jpg … ball 5.jpg)
$balls = @(
    @{ t = 'Mikasa PKC55-BR Size 5 Football'; p = 'Ksh 2,280 <span class="text-muted fw-normal small">ea.</span>'; d = 'Original tubeless football as pictured; often sold with a free pump' },
    @{ t = 'Size 7 Rubber Basketball'; p = 'From Ksh 1,800 <span class="text-muted fw-normal small">ea.</span>'; d = 'Standard orange pebble-grip basketball shown in the image' },
    @{ t = 'Mikasa FT-5 Size 5 Football'; p = 'From Ksh 1,090 <span class="text-muted fw-normal small">ea.</span>'; d = 'Red-and-white Mikasa size 5 football, commonly bundled with pump and needle' },
    @{ t = 'San Francisco 49ers American Football'; p = 'From Ksh 2,900 <span class="text-muted fw-normal small">ea.</span>'; d = 'American football with 49ers logo as shown' },
    @{ t = 'Mikasa MVA330 Official Volleyball'; p = 'Ksh 2,320 <span class="text-muted fw-normal small">ea.</span>'; d = 'Blue-and-yellow official ball shown with free pump promotion' }
)
1..5 | ForEach-Object {
    $ix = $_ - 1
    [void]$lines.Add((New-Card 'artsports' 'Art &amp; Sports' "ball $_.jpg" $balls[$ix].t $balls[$ix].p $balls[$ix].d))
}

$labFiles = @()
$labFiles += 1..2 | ForEach-Object { "lab $_.jpg" }
$labFiles += 'lab 3.webp'
$labFiles += 4..10 | ForEach-Object { "lab $_.jpg" }
$labFiles += 'lab 11.png'

$labItems = @(
    @{ t = 'Crucible Tongs (150 mm)'; p = 'Ksh 225 <span class="text-muted fw-normal small">ea.</span>'; d = 'Stainless steel crucible tongs as shown' },
    @{ t = '500 ml Laboratory Beaker'; p = 'Ksh 1,200 <span class="text-muted fw-normal small">ea.</span>'; d = 'Graduated 500 ml beaker as shown' },
    @{ t = 'Laboratory Apparatus'; p = 'Request price'; d = 'Image file could not be decoded locally, so this item needs manual naming' },
    @{ t = '25 ml Glass Burette with Stopcock'; p = 'Request price'; d = 'Graduated glass burette as shown' },
    @{ t = 'Laboratory Thermometer'; p = 'Ksh 250 <span class="text-muted fw-normal small">ea.</span>'; d = 'Glass laboratory thermometer shown in the image' },
    @{ t = 'Hand Lens Magnifier'; p = 'Ksh 180 <span class="text-muted fw-normal small">ea.</span>'; d = 'Hand-held magnifying glass for science observation' },
    @{ t = 'Laboratory Spoon Spatula'; p = 'Ksh 140 <span class="text-muted fw-normal small">ea.</span>'; d = 'Stainless steel double-ended spoon spatula' },
    @{ t = 'Spring Balance 100 g / 1 N'; p = 'Ksh 390 <span class="text-muted fw-normal small">ea.</span>'; d = 'Dual-scale spring balance marked in grams and newtons' },
    @{ t = '250 ml Volumetric Flask'; p = 'Ksh 340 <span class="text-muted fw-normal small">ea.</span>'; d = 'Glass volumetric flask marked 250 ml' },
    @{ t = 'Laboratory Wash Bottle (Assorted Sizes)'; p = 'Ksh 125 <span class="text-muted fw-normal small">ea.</span>'; d = 'Plastic wash bottles as shown; price based on standard 500 ml bottle' },
    @{ t = 'Glass Test Tube'; p = 'Ksh 90 <span class="text-muted fw-normal small">ea.</span>'; d = 'Single glass test tube as shown' }
)
for ($i = 0; $i -lt $labFiles.Count; $i++) {
    $lf = $labFiles[$i]
    $item = $labItems[$i]
    [void]$lines.Add((New-Card 'lab' 'Lab Equipment' $lf $item.t $item.p $item.d))
}

$furnitureItems = @(
    @{ t = 'Single Student Desk &amp; Moulded Chair Set'; p = 'From Ksh 12,500 <span class="text-muted fw-normal small">/ seat</span>'; d = 'Steel frame; laminated top; stackable chairs available' },
    @{ t = 'Wall-Mounted Magnetic Whiteboard (120 × 90 cm)'; p = 'From Ksh 18,950 <span class="text-muted fw-normal small">/ board</span>'; d = 'Aluminium frame; markers and erasers sold separately' },
    @{ t = 'Teacher Desk with Lockable Pedestal Drawers'; p = 'From Ksh 42,000 <span class="text-muted fw-normal small">ea.</span>'; d = 'Laminate finish; cable port; heavy-duty castors optional' },
    @{ t = 'Double-Sided Library Bookcase (180 cm)'; p = 'From Ksh 24,500 <span class="text-muted fw-normal small">/ unit</span>'; d = 'Adjustable shelves; steel and wood options' },
    @{ t = 'Ergonomic Mesh Office Chair'; p = 'From Ksh 6,800 <span class="text-muted fw-normal small">ea.</span>'; d = 'Lumbar support; height and tilt adjustment' },
    @{ t = 'Height-Adjustable Lab Stool'; p = 'From Ksh 3,200 <span class="text-muted fw-normal small">ea.</span>'; d = 'Polypropylene seat; chemical-resistant base' },
    @{ t = 'Six-Door Steel Student Locker'; p = 'From Ksh 18,000 <span class="text-muted fw-normal small">/ bay</span>'; d = 'Ventilated; padlock hasp; powder-coated' },
    @{ t = 'Rectangular Conference Table (240 × 120 cm)'; p = 'From Ksh 38,500 <span class="text-muted fw-normal small">ea.</span>'; d = 'Seats 8–10; cable management optional' },
    @{ t = 'Four-Drawer Steel Filing Cabinet (A4)'; p = 'From Ksh 14,200 <span class="text-muted fw-normal small">ea.</span>'; d = 'Anti-tilt; central locking' },
    @{ t = 'Cork Notice Board with Aluminium Frame (120 × 90 cm)'; p = 'From Ksh 9,500 <span class="text-muted fw-normal small">ea.</span>'; d = 'Pinboard for corridors and classrooms' }
)
1..10 | ForEach-Object {
    $ix = $_ - 1
    $item = $furnitureItems[$ix]
    [void]$lines.Add((New-Card 'furniture' 'Furniture' "furniture $_.jpg" $item.t $item.p $item.d))
}

[void]$lines.Add((New-Card 'assessments' 'Assessments' 'exam 1.png' 'Targeter Wings Monitoring Learner''s Progress Grade 5 - 2024 Integrated Science' 'From Ksh 100 <span class="text-muted fw-normal small">/ booklet</span>' 'Integrated Science monitoring booklet as shown'))
[void]$lines.Add((New-Card 'assessments' 'Assessments' 'exam 2.jpg' 'Targeter Wings Pre-Primary 1 - Year 2025 Monitoring Learner''s Progress Language Activities' 'From Ksh 100 <span class="text-muted fw-normal small">/ booklet</span>' 'PP1 language activities monitoring booklet as shown'))
[void]$lines.Add((New-Card 'assessments' 'Assessments' 'exam 3.png' 'Kenya Junior School Education Assessment Creative Arts and Sports Paper 1 Grade 9 - 2026' 'From Ksh 100 <span class="text-muted fw-normal small">/ booklet</span>' 'Grade 9 school-based assessment paper shown in the image'))

$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$outPath = Join-Path $root 'shop-products-snippet.html'
$header = '                <div class="row g-4">' + "`n"
$footer = "`n                </div>`n"
$body = $lines -join "`n"
Set-Content -Path $outPath -Value ($header + $body + $footer) -Encoding UTF8
Write-Host "Wrote $($lines.Count) cards to $outPath"
