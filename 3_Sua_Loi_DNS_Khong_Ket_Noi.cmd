@ECHO OFF
TITLE Sua Loi DNS va Khong Ket Noi Steam
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [!] Dang yeu cau quyen Administrator...
    powershell -NoProfile -Command "Start-Process cmd -ArgumentList '/c \"%~f0\"' -Verb RunAs"
    exit /b
)

echo =====================================================================
echo         SUA LOI DNS & KHONG CO KET NOI STEAM (IPV4 & IPV6)
echo =====================================================================
echo [1/2] Dat lai DNS Google IPv4 va IPv6 sach tren tat ca cac card mang...
powershell -NoProfile -Command "Get-NetAdapter | Where-Object { $_.Status -eq 'Up' } | ForEach-Object { Set-DnsClientServerAddress -InterfaceIndex $_.ifIndex -ServerAddresses ('8.8.8.8', '1.1.1.1', '2001:4860:4860::8888', '2001:4860:4860::8844') }"

echo [2/2] Xoa toan bo bo nho dem DNS cu...
ipconfig /flushdns

echo.
echo =====================================================================
echo [OK] DA XU LY XONG! HAY THOAT HAN STEAM ROI MO LAI.
echo =====================================================================
pause
