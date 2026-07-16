$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $PSScriptRoot
$assetDirectory = Join-Path $root 'assets'
$outputPath = Join-Path $assetDirectory 'codex-stats.svg'

if (-not (Get-Command agentcat -ErrorAction SilentlyContinue)) {
    throw 'agentcat was not found. Install Agent Cat Connectors first.'
}

$snapshot = agentcat snapshot --json | ConvertFrom-Json
$codex = $snapshot.providers.codex

if ($codex.status -ne 'ok') {
    throw "Codex usage is unavailable. Status: $($codex.status)"
}

function Format-TokenCount([long]$value) {
    if ($value -ge 1000000000) { return ('{0:0.00}B' -f ($value / 1000000000)) }
    if ($value -ge 1000000) { return ('{0:0.00}M' -f ($value / 1000000)) }
    if ($value -ge 1000) { return ('{0:0.0}K' -f ($value / 1000)) }
    return $value.ToString('N0')
}

$today = Format-TokenCount $codex.tokens.today
$week = Format-TokenCount $codex.tokens.week
$month = Format-TokenCount $codex.tokens.month
$all = Format-TokenCount $codex.tokens.all
$threads = [System.Security.SecurityElement]::Escape($codex.threads.ToString())
$updated = Get-Date -Format 'yyyy-MM-dd HH:mm K'

$svg = @"
<svg xmlns="http://www.w3.org/2000/svg" width="760" height="190" role="img" aria-label="Codex usage statistics">
  <defs>
    <linearGradient id="bg" x1="0" y1="0" x2="1" y2="1">
      <stop offset="0" stop-color="#0D1026"/>
      <stop offset="1" stop-color="#24174A"/>
    </linearGradient>
  </defs>
  <rect width="760" height="190" rx="18" fill="url(#bg)"/>
  <text x="32" y="42" fill="#FFFFFF" font-family="Segoe UI, Arial, sans-serif" font-size="22" font-weight="700">Codex log</text>
  <text x="32" y="68" fill="#BEBBDA" font-family="Segoe UI, Arial, sans-serif" font-size="12">Updated locally | $updated</text>
  <g font-family="Segoe UI, Arial, sans-serif" text-anchor="middle">
    <text x="90" y="112" fill="#B7F88A" font-size="22" font-weight="700">$today</text><text x="90" y="138" fill="#BEBBDA" font-size="12">TODAY</text>
    <text x="235" y="112" fill="#B7F88A" font-size="22" font-weight="700">$week</text><text x="235" y="138" fill="#BEBBDA" font-size="12">THIS WEEK</text>
    <text x="380" y="112" fill="#B7F88A" font-size="22" font-weight="700">$month</text><text x="380" y="138" fill="#BEBBDA" font-size="12">THIS MONTH</text>
    <text x="525" y="112" fill="#B7F88A" font-size="22" font-weight="700">$all</text><text x="525" y="138" fill="#BEBBDA" font-size="12">ALL TIME</text>
    <text x="670" y="112" fill="#B7F88A" font-size="22" font-weight="700">$threads</text><text x="670" y="138" fill="#BEBBDA" font-size="12">THREADS</text>
  </g>
</svg>
"@

New-Item -ItemType Directory -Force -Path $assetDirectory | Out-Null
[System.IO.File]::WriteAllText($outputPath, $svg, [System.Text.UTF8Encoding]::new($false))
Write-Host "Codex stats updated: $outputPath"
