@echo off

setlocal

echo ============================
echo       Kroki Starter        
echo ============================

cd %~d0%~p0
echo %~d0%~p0


REM PlantUMLのJARファイルのパスを指定
set KROKI_LISTEN=0.0.0.0:60006
java -jar .\lib\kroki-standalone-server-v0.26.0.jar

endlocal
