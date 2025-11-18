@echo off
:: run.bat - Inicia un servidor HTTP simple y abre el navegador (Windows)
:: Lanza el servidor en un proceso separado y abre el navegador
start "" cmd /c "python -m http.server 8000"
:: espera breve para que el servidor arranque
timeout /t 1 >nul

:: Intentar abrir Google Chrome si está instalado; si no, abrir el navegador por defecto
where chrome >nul 2>nul
if %errorlevel%==0 (
	start "" "chrome" "http://localhost:8000/"
) else (
	start "" "http://localhost:8000/"
)
