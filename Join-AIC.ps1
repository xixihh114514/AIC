$ErrorActionPreference = 'Stop'

$expectedHash = '00FD4EE5E715DB3AA6491B93E28D990B04F0D1A0CB0459287FB8C7E6B96C2C83'
$parts = 0..5 | ForEach-Object { 'AIC.zip.part{0:D3}' -f $_ }
$outputPath = Join-Path (Get-Location) 'AIC.zip'

foreach ($part in $parts) {
    if (-not (Test-Path -LiteralPath $part -PathType Leaf)) {
        throw "Missing archive part: $part"
    }
}

if (Test-Path -LiteralPath $outputPath) {
    throw "Output already exists: $outputPath"
}

$output = [System.IO.File]::Create($outputPath)
try {
    foreach ($part in $parts) {
        $inputFile = [System.IO.File]::OpenRead((Join-Path (Get-Location) $part))
        try {
            $inputFile.CopyTo($output)
        } finally {
            $inputFile.Dispose()
        }
    }
} finally {
    $output.Dispose()
}

$actualHash = (Get-FileHash -LiteralPath $outputPath -Algorithm SHA256).Hash
if ($actualHash -ne $expectedHash) {
    throw "SHA-256 mismatch. Expected $expectedHash, got $actualHash"
}

Write-Output "Verified: $outputPath"
