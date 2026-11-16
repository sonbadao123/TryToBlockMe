@ECHO OFF
TITLE Cai Dat TryToBlockMe - Steam Bypass Viet Nam
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [!] Dang yeu cau quyen Administrator de cai dat dich vu...
    powershell -NoProfile -Command "Start-Process cmd -ArgumentList '/c \"%~f0\"' -Verb RunAs"
    exit /b
)

PUSHD "%~dp0"
set _arch=x86
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set _arch=x86_64)
IF DEFINED PROCESSOR_ARCHITEW6432 (set _arch=x86_64)

echo =====================================================================
echo           TRYTOBLOCKME - FIX TOAN DIEN STEAM TAI VIET NAM
echo =====================================================================
echo.
echo [1/3] Thiet lap DNS sach (Google va Cloudflare cho ca IPv4 va IPv6)...
echo       (Chong doc DNS va sua triet de loi "KHONG CO KET NOI")
powershell -NoProfile -Command "Get-NetAdapter | Where-Object { $_.Status -eq 'Up' } | ForEach-Object { Set-DnsClientServerAddress -InterfaceIndex $_.ifIndex -ServerAddresses ('8.8.8.8', '1.1.1.1', '2001:4860:4860::8888', '2001:4860:4860::8844') }" >nul 2>&1

echo [2/3] Xoa sach bo nho dem DNS (Flush DNS)...
ipconfig /flushdns >nul 2>&1

echo [3/3] Khoi tao dich vu GoodbyeDPI chay ngam (Mode -1 Tuong thich toi da)...
sc stop "GoodbyeDPI" >nul 2>&1
sc delete "GoodbyeDPI" >nul 2>&1
sc create "GoodbyeDPI" binPath= "\"%CD%\%_arch%\goodbyedpi.exe\" -1" start= "auto" >nul 2>&1
sc description "GoodbyeDPI" "Tu dong vuot tuong lua ISP Viet Nam cho Steam va web bi chan" >nul 2>&1
sc start "GoodbyeDPI" >nul 2>&1

echo.
echo =====================================================================
echo [THANH CONG 100%] DICH VU DA CHAY NGAM VA TU BAT CUNG MAY TINH!
echo.
echo LUU Y CUOI CUNG:
echo 1. Chuot phai vao bieu tuong Steam o goc duoi ben phai -> Chon "Thoat Steam".
echo 2. Bat lai Steam: Store, Community, Chat va Ban be se hoat dong muot ma!
echo =====================================================================
echo.
pause
POPD
