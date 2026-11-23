@echo off
cd /d "%~dp0"
git --version || (echo Git nao encontrado & pause & exit /b 1)
git init -b main
git add .
git commit -m "Projeto Power BI: market share e penetracao de internet fixa"
git remote remove origin 2>nul
git remote add origin https://github.com/engcley/panorama-telecom-market-share.git
git push -u origin main
echo.
echo Terminado. Se apareceu erro acima, me avise.
pause
