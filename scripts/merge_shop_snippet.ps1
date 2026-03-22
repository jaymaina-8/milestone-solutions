$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$shopPath = Join-Path $root 'shop.html'
$snipPath = Join-Path $root 'shop-products-snippet.html'
$shop = [System.IO.File]::ReadAllText($shopPath)
$snip = [System.IO.File]::ReadAllText($snipPath).TrimEnd()
$marker = '                <div class="text-center mt-5 py-4">'
$start = $shop.IndexOf('                <div class="row g-4">')
if ($start -lt 0) { throw 'row g-4 not found' }
$end = $shop.IndexOf($marker, $start)
if ($end -lt 0) { throw 'text-center marker not found' }
# include newline before marker
$before = $shop.Substring(0, $start)
$after = $shop.Substring($end)
$newShop = $before + $snip + "`r`n`r`n" + $after
[System.IO.File]::WriteAllText($shopPath, $newShop, [System.Text.UTF8Encoding]::new($false))
Write-Host 'Merged snippet into shop.html'
