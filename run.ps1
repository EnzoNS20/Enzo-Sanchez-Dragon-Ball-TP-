# run.ps1 - Inicia un servidor HTTP simple y abre el navegador en Windows PowerShell
$port = 8000
$python = Get-Command python -ErrorAction SilentlyContinue
if ($null -eq $python) {
    Write-Host "Python no está disponible en PATH. Abre index.html manualmente o instala Python." -ForegroundColor Yellow
    exit 1
}

Start-Process -FilePath $python.Path -ArgumentList "-m", "http.server", "$port"
Start-Sleep -Seconds 1

# Intentar abrir específicamente Google Chrome; si no está disponible, abrir el navegador por defecto
$chrome = Get-Command chrome -ErrorAction SilentlyContinue
if ($null -ne $chrome) {
    Start-Process -FilePath $chrome.Path -ArgumentList "http://localhost:$port/"
} else {
    Start-Process "http://localhost:$port/"
}
