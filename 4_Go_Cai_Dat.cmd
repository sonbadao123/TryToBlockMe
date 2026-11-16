@ECHO OFF
TITLE Go Cai Dat TryToBlockMe
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [!] Dang yeu cau quyen Administrator...
    powershell -NoProfile -Command "Start-Process cmd -ArgumentList '/c \"%~f0\"' -Verb RunAs"
    exit /b
)

echo Dang dung va go bo hoan toan dich vu GoodbyeDPI khoi he thong...
sc stop "GoodbyeDPI" >nul 2>&1
sc delete "GoodbyeDPI" >nul 2>&1
sc stop "WinDivert1.4" >nul 2>&1
sc delete "WinDivert1.4" >nul 2>&1
sc stop "WinDivert" >nul 2>&1
sc delete "WinDivert" >nul 2>&1

echo.
echo =====================================================================
echo [OK] DA GO BO TOAN BO DICH VU THANH CONG!
echo He thong da tro ve trang thai ban dau.
echo =====================================================================
pause
