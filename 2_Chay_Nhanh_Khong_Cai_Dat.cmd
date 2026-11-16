@ECHO OFF
TITLE Chay Nhanh TryToBlockMe (Mode -1)
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [!] Dang yeu cau quyen Administrator...
    powershell -NoProfile -Command "Start-Process cmd -ArgumentList '/c \"%~f0\"' -Verb RunAs"
    exit /b
)

PUSHD "%~dp0"
set _arch=x86
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set _arch=x86_64)
IF DEFINED PROCESSOR_ARCHITEW6432 (set _arch=x86_64)

echo =====================================================================
echo           TRYTOBLOCKME - CHAY NHANH KHONG CAI DICH VU
echo =====================================================================
echo * Dang bat Bypass DPI cho Steam o che do Mode -1.
echo * HAY THU NHO (MINIMIZE) CUA SO NAY VA GIU NGUYEN TRONG KHI DUNG STEAM.
echo * Dong cua so nay se tat che do bypass.
echo =====================================================================
echo.
"%CD%\%_arch%\goodbyedpi.exe" -1
POPD
