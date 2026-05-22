@echo off
setlocal

echo ASCII DOC CONVERTER

cd /d %~d0%~p0
echo CurrentDir: %~d0%~p0

set ADOC_NAME=AsciiDocSample
set ADOCBASEPATH=%~d0%~p0
set SCRIPTBASEPATH=C:\workspace\AsciiDocSampleGitHub

del /f /q /s "%ADOCBASEPATH%out" 2>nul

echo START %ADOC_NAME% Word Convert

powershell -NoProfile -ExecutionPolicy Bypass ^
  -File "%SCRIPTBASEPATH%\Convert-AsciiDocToWord.ps1" ^
  -AdocFullPath "%ADOCBASEPATH%%ADOC_NAME%.adoc" ^
  -OutputFullPath "%ADOCBASEPATH%out\%ADOC_NAME%.docx" ^
  -ConfigFullPath "%ADOCBASEPATH%conf/word-style.sample.json"

powershell -NoProfile -ExecutionPolicy Bypass ^
  -File "%SCRIPTBASEPATH%\Convert-AsciiDocToWord.ps1" ^
  -AdocFullPath "%ADOCBASEPATH%AsciiDocToWord.adoc" ^
  -OutputFullPath "%ADOCBASEPATH%out\AsciiDocToWord.docx" ^
  -ConfigFullPath "%ADOCBASEPATH%conf/word-style.sample.json"

echo FINISH %ADOC_NAME% Word Convert
endlocal
pause
