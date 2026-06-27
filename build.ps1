# =====================================================================
# build.ps1 — Compile le dossier LaTeX (via Docker TexLive) et ouvre le PDF
# Usage :
#   .\build.ps1            -> compile une fois puis ouvre output\main.pdf
#   .\build.ps1 -Watch     -> recompile automatiquement à chaque sauvegarde
#   .\build.ps1 -NoOpen    -> compile sans ouvrir le PDF
# =====================================================================

param(
    [switch]$Watch,
    [switch]$NoOpen
)

$ErrorActionPreference = "Stop"

# Se place dans le dossier du script (racine du projet)
$ProjectDir = $PSScriptRoot
Set-Location $ProjectDir

$Image   = "registry.gitlab.com/islandoftex/images/texlive:latest"
$PdfPath = Join-Path $ProjectDir "output\main.pdf"

# --- Vérifie que Docker tourne -----------------------------------------
Write-Host "Verification de Docker..." -ForegroundColor Cyan
try {
    docker info *> $null
    if ($LASTEXITCODE -ne 0) { throw }
} catch {
    Write-Host "Docker ne repond pas." -ForegroundColor Yellow
    $DockerExe = "C:\Program Files\Docker\Docker\Docker Desktop.exe"
    if (Test-Path $DockerExe) {
        Write-Host "Lancement de Docker Desktop..." -ForegroundColor Yellow
        Start-Process $DockerExe
        Write-Host "Attente du demarrage de Docker (jusqu'a 120s)..." -ForegroundColor Yellow
        $ok = $false
        for ($i = 0; $i -lt 60; $i++) {
            Start-Sleep -Seconds 2
            docker info *> $null
            if ($LASTEXITCODE -eq 0) { $ok = $true; break }
        }
        if (-not $ok) {
            Write-Host "Docker n'a pas demarre a temps. Lance Docker Desktop puis relance ce script." -ForegroundColor Red
            exit 1
        }
    } else {
        Write-Host "Docker Desktop introuvable. Installe-le ou lance-le manuellement." -ForegroundColor Red
        exit 1
    }
}
Write-Host "Docker OK." -ForegroundColor Green

# --- Construit la commande latexmk -------------------------------------
$Latexmk = "latexmk -pdf -interaction=nonstopmode -halt-on-error -output-directory=../output main.tex"
if ($Watch) {
    # -pvc : recompile en continu a chaque modification
    $Latexmk = "latexmk -pdf -pvc -interaction=nonstopmode -output-directory=../output main.tex"
    Write-Host "Mode WATCH : recompilation automatique. Ctrl+C pour arreter." -ForegroundColor Cyan
}

# --- Lance la compilation dans le conteneur ----------------------------
docker run --rm -v "${ProjectDir}:/workdir" -w /workdir/src $Image sh -c "$Latexmk"
$BuildCode = $LASTEXITCODE

if ($BuildCode -ne 0) {
    Write-Host "Echec de la compilation (code $BuildCode). Voir output\main.log pour le detail." -ForegroundColor Red
    exit $BuildCode
}

# En mode watch, on n'arrive ici qu'apres Ctrl+C : pas d'ouverture auto.
if ($Watch) { exit 0 }

Write-Host "Compilation reussie -> $PdfPath" -ForegroundColor Green

# --- Ouvre le PDF ------------------------------------------------------
if (-not $NoOpen) {
    if (Test-Path $PdfPath) {
        Invoke-Item $PdfPath
    } else {
        Write-Host "PDF introuvable a l'emplacement attendu." -ForegroundColor Yellow
    }
}
