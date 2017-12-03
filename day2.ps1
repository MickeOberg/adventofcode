# Day 2
# Part One
$spread = Get-Content -Path day2.txt
$sums = $spread -split "`t"
$checksum = 0
$start = 0
$end = 15

for ($i = 0; $i -lt 16; $i++) {
 
    $row = $sums[$start..$end] | Measure-Object -Maximum -Minimum
    $checksum += ($row.Maximum - $row.Minimum)
    $start = ($end+1)
    $end = ($end+16)
}

Write-Host `r`n"Total Checksum:" $checksum -ForegroundColor yellow


# Day 2
# Part Two

$start = 0
$end = 15
$res = 0

for ($i = 0; $i -lt 16; $i++) {
    foreach ($num in $sums[$start..$end]) {
    
    for ($x = 0; $x -lt 16; $x++) {
        if ($num % $sums[$start+$x] -eq 0 -and $num -ne $sums[$start+$x] ) {$res += ($num/$sums[$start+$x]) }
    }
    }
    $start = ($end+1)
    $end = ($end+16)
    }

    Write-Host "Result:" $res -ForegroundColor yellow 
