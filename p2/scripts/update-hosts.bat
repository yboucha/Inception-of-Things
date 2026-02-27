@echo off
REM Run as Administrator
echo Adding entries to Windows hosts file...
echo 192.168.56.110 app1.com >> C:\Windows\System32\drivers\etc\hosts
echo 192.168.56.110 app2.com >> C:\Windows\System32\drivers\etc\hosts
echo.
echo Hosts file updated.
echo Test in browser:
echo - http://app1.com
echo - http://app2.com
echo - http://192.168.56.110 (default app)
pause
