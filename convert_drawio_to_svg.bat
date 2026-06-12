
@echo off
setlocal 

REM Create image folder if it doesn't exist
if not exist images (
    mkdir images
)

REM Set path to draw.io CLI executable
set DRAWIO_CLI="C:\Program Files\draw.io\draw.io.exe"

REM Loop through all .drawio files in drawio folder
for %%f in (drawio\*.drawio) do (
    set "filename=%%~nf"
    echo Converting %%f to images\!filename!.svg
    %DRAWIO_CLI% --export "%%f" --output "images\!filename!.svg" --format svg
)

echo Conversion complete.
