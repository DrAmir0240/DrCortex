$ErrorActionPreference = "Stop"

$RepoUrl = "https://github.com/DrAmir0240/DrCortex.git"
$InstallDir = Join-Path $env:USERPROFILE ".drcortex"
$BinDir = Join-Path $env:USERPROFILE ".local\bin"

Write-Host "🧠 Initializing DrCortex Installation..." -ForegroundColor Cyan

# Detect Python 3 command
$PythonCmd = $null
foreach ($cmd in @("python", "python3", "py")) {
    if (Get-Command $cmd -ErrorAction SilentlyContinue) {
        $PythonCmd = $cmd
        break
    }
}
if (-not $PythonCmd) {
    Write-Error "Python 3 is required but was not found in PATH. Please install Python 3 and try again."
    exit 1
}

if ((Test-Path ".\bin\drcortex") -and (Test-Path ".\core\master-rules.tpl.md")) {
    Write-Host "📦 Installing from local repository..."
    New-Item -ItemType Directory -Force -Path $InstallDir | Out-Null
    Copy-Item -Recurse -Force ".\bin", ".\core", ".\templates" $InstallDir
    if (Test-Path ".\README.md") {
        Copy-Item -Force ".\README.md" $InstallDir
    }
} elseif (Test-Path (Join-Path $InstallDir ".git")) {
    Write-Host "🔄 Updating existing DrCortex installation..."
    git -C $InstallDir pull --quiet
} else {
    Write-Host "📥 Cloning DrCortex from GitHub..."
    if (Test-Path $InstallDir) {
        Remove-Item -Recurse -Force $InstallDir
    }
    git clone --quiet $RepoUrl $InstallDir
}

New-Item -ItemType Directory -Force -Path $BinDir | Out-Null

$PythonExec = if ($PythonCmd -eq "py") { "py -3" } else { $PythonCmd }
$TargetScript = Join-Path $InstallDir "bin\drcortex"
$ShimContent = "@echo off`r`n$PythonExec `"$TargetScript`" %*`r`n"

Set-Content -Path (Join-Path $BinDir "drcortex.cmd") -Value $ShimContent -Encoding ASCII
Set-Content -Path (Join-Path $BinDir "dcx.cmd") -Value $ShimContent -Encoding ASCII

$UserPath = [Environment]::GetEnvironmentVariable("Path", "User")
if (-not $UserPath) { $UserPath = "" }
$PathParts = $UserPath -split ";" | Where-Object { $_ -ne "" }
if ($PathParts -notcontains $BinDir) {
    $NewPath = ($PathParts + $BinDir) -join ";"
    [Environment]::SetEnvironmentVariable("Path", $NewPath, "User")
    $env:Path = "$BinDir;$env:Path"
}

Write-Host "✅ Commands installed: 'drcortex' and 'dcx'" -ForegroundColor Green
Write-Host ""

if ($PythonCmd -eq "py") {
    & py -3 $TargetScript setup
} else {
    & $PythonCmd $TargetScript setup
}
