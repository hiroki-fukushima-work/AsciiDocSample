@echo off

echo ============================
echo      �J����������
echo ============================

cd %~d0%~p0
echo %~d0%~p0

@echo off

:: �Ǘ��Ҍ����`�F�b�N�i�Ǘ��҂Ȃ� '1' ���Ԃ�j
net session >nul 2>&1
if %errorlevel% == 0 (
    echo �Ǘ��Ҍ����� PowerShell �X�N���v�g�����s���܂�...

    powershell -ExecutionPolicy Bypass -File "%~dp0setupDev.ps1
    powershell -ExecutionPolicy Bypass -File "%~dp0registKrokiStarter.ps1
    goto :eof
) else (
    echo �Ǘ��Ҍ������K�v�ł��B�ċN�����܂�...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    goto :eof
)


@echo off

