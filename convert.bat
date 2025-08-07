@echo off

setlocal

ECHO ASCII DOC CONVERTER

cd %~d0%~p0
echo %~d0%~p0

set ADOC_NAME=AsciiDocSample

REM PlantUMLのJARファイルのパスを指定
set PLANTUML_JAR="%~d0%~p0lib\plantuml-1.2025.4.jar"

del /f /q /s "%~d0%~p0HTML"
del /f /q /s "%~d0%~p0PDF"

echo START COVER Convert
powershell.exe  -NoProfile -ExecutionPolicy RemoteSigned '"%~d0%~p0convertpdf.ps1"'
echo FINISH COVER Convert

echo START HTML Convert
powershell -Command "$env:DIAGRAM_PLANTUML_CLASSPATH='%PLANTUML_JAR%'; Start-Process -NoNewWindow -Wait asciidoctor -ArgumentList '\"%~d0%~p0%ADOC_NAME%.adoc\"', '\"-o\"', '\"%~d0%~p0HTML\\%ADOC_NAME%.html\"', '\"-r\"', '\"asciidoctor-diagram\"'"

echo FINISH HTML Convert

echo START PDF Convert
powershell -Command "$env:DIAGRAM_PLANTUML_CLASSPATH='%PLANTUML_JAR%'; Start-Process -NoNewWindow -Wait asciidoctor-pdf -ArgumentList '\"%~d0%~p0%ADOC_NAME%.adoc\"', '\"-o\"', '\"%~d0%~p0PDF\\%ADOC_NAME%.pdf\"', '\"-r\"', '\"asciidoctor-diagram\"', '\"-a\"', '\"pdf-theme=conf/theme.yml\"', '\"-a\"', '\"pdf-fontsdir=fonts\"', '\"-a\"', '\"converttype=pdf\"'"
echo FINISH PDF Convert
pause
endlocal
